import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uber_clone/features/booking/data/services/booking_service.dart';
import 'package:uber_clone/features/booking/presentation/widgets/passenger_details_form.dart';
import 'package:uber_clone/features/ride/domain/models/ride_details.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class BookingConfirmationScreen extends ConsumerStatefulWidget {
  final RideDetails ride;
  final int seatsToBook;

  const BookingConfirmationScreen({
    super.key,
    required this.ride,
    required this.seatsToBook,
  });

  @override
  ConsumerState<BookingConfirmationScreen> createState() =>
      _BookingConfirmationScreenState();
}

class _BookingConfirmationScreenState
    extends ConsumerState<BookingConfirmationScreen> {
  final _razorpay = Razorpay();
  bool _isLoading = false;
  String? _selectedPaymentMethod;
  final _notesController = TextEditingController();
  final List<Map<String, dynamic>> _passengers = [];

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    _notesController.dispose();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    try {
      final currentUser = Supabase.instance.client.auth.currentUser;
      if (currentUser == null) throw Exception('No authenticated user');

      final bookingService = BookingService();
      await bookingService.updateBookingStatus(
        bookingId: response.orderId ?? '',
        status: 'confirmed',
        paymentId: response.paymentId,
        paymentTime: DateTime.now(),
        isPaid: true,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Payment successful!')),
        );
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error processing payment: $e')),
        );
      }
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment failed: ${response.message}')),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('External wallet selected: ${response.walletName}')),
    );
  }

  Future<void> _processPayment() async {
    if (_selectedPaymentMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a payment method')),
      );
      return;
    }

    // Validate passenger details
    if (_passengers.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter passenger details')),
      );
      return;
    }

    // Check if all passengers have valid data
    for (var passenger in _passengers) {
      if (passenger['fullName'].toString().trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter name for all passengers')),
        );
        return;
      }
      if (passenger['age'].toString().trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter age for all passengers')),
        );
        return;
      }
    }

    setState(() => _isLoading = true);

    try {
      final currentUser = Supabase.instance.client.auth.currentUser;
      if (currentUser == null) throw Exception('No authenticated user');

      // Validate required fields
      if (widget.ride.id == null) throw Exception('Ride ID is missing');
      if (widget.ride.fromLocation.isEmpty) {
        throw Exception('From location is missing');
      }
      if (widget.ride.toLocation.isEmpty) {
        throw Exception('To location is missing');
      }
      if (widget.ride.driverId.isEmpty) {
        throw Exception('Driver ID is missing');
      }

      // Ensure all values are non-null and properly type-cast
      final String rideId = widget.ride.id!;
      final String driverId = widget.ride.driverId;
      final String fromLocation = widget.ride.fromLocation;
      final String toLocation = widget.ride.toLocation;
      final totalPrice = widget.ride.pricePerSeat * widget.seatsToBook;
      final String? notes =
          _notesController.text.isNotEmpty ? _notesController.text : null;

      // Booking details ready

      final bookingService = BookingService();

      // Create booking first
      final booking = await bookingService.createBooking(
        rideId: rideId,
        userId: currentUser.id,
        driverId: driverId,
        fromLocation: fromLocation,
        toLocation: toLocation,
        startTime: widget.ride.startTime,
        seatsBooked: widget.seatsToBook,
        totalPrice: totalPrice,
        notes: notes,
      );

      // Create passengers for the booking
      if (_passengers.isNotEmpty) {
        await bookingService.createPassengers(
          bookingId: booking.id,
          passengersData: _passengers,
        );
      }

      if (_selectedPaymentMethod == 'pay_now') {
        // Initialize Razorpay payment
        var options = {
          'key': 'YOUR_RAZORPAY_KEY',
          'amount': (totalPrice * 100).toInt(), // Amount in paise
          'name': 'Uber Clone',
          'description': 'Ride Booking',
          'order_id': booking.id,
          'prefill': {
            'contact': currentUser.phone ?? '',
            'email': currentUser.email ?? '',
          }
        };

        _razorpay.open(options);
      } else {
        // For cash payment, just confirm the booking
        await bookingService.updateBookingStatus(
          bookingId: booking.id,
          status: 'confirmed',
        );

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Booking confirmed!')),
          );
          Navigator.pop(context, true);
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error creating booking: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice = widget.ride.pricePerSeat * widget.seatsToBook;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Booking'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.ride.fromLocation} → ${widget.ride.toLocation}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('Driver: ${widget.ride.driverName}'),
                    const SizedBox(height: 8),
                    Text(
                      'Date & Time: ${widget.ride.startTime.day}/${widget.ride.startTime.month}/${widget.ride.startTime.year} ${widget.ride.startTime.hour}:${widget.ride.startTime.minute.toString().padLeft(2, '0')}',
                    ),
                    const SizedBox(height: 8),
                    Text('Seats Booked: ${widget.seatsToBook}'),
                    const SizedBox(height: 8),
                    Text(
                      'Price per Seat: \$${widget.ride.pricePerSeat}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: PassengerDetailsForm(
                  totalSeats: widget.seatsToBook,
                  onPassengersUpdated: (passengers) {
                    setState(() {
                      _passengers.clear();
                      _passengers.addAll(passengers);
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Payment Method',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    RadioListTile<String>(
                      title: const Text('Pay Now'),
                      value: 'pay_now',
                      groupValue: _selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentMethod = value;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Pay in Cash'),
                      value: 'cash',
                      groupValue: _selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentMethod = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Additional Notes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _notesController,
                      decoration: const InputDecoration(
                        hintText: 'Add any special instructions...',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _processPayment,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                        'Confirm Booking',
                        style: TextStyle(fontSize: 16),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
