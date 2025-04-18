import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uber_clone/features/booking/presentation/screens/booking_confirmation_screen.dart';
import 'package:uber_clone/features/booking/presentation/widgets/location_search_field.dart';
import 'package:uber_clone/features/ride/domain/models/ride_details.dart';
import 'package:uber_clone/features/ride/presentation/providers/ride_service_provider.dart';

class FindRideScreen extends ConsumerStatefulWidget {
  const FindRideScreen({super.key});

  @override
  ConsumerState<FindRideScreen> createState() => _FindRideScreenState();
}

class _FindRideScreenState extends ConsumerState<FindRideScreen> {
  final _fromLocationController = TextEditingController();
  final _toLocationController = TextEditingController();
  DateTime? _dateFilter;
  int? _maxPrice;
  String? _fromLocation;
  String? _toLocation;

  @override
  void dispose() {
    _fromLocationController.dispose();
    _toLocationController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dateFilter ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (picked != null) {
      setState(() {
        _dateFilter = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find a Ride'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  LocationSearchField(
                    hintText: 'From Location',
                    controller: _fromLocationController,
                    onLocationSelected: (location, name) {
                      setState(() {
                        _fromLocation = name;
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  LocationSearchField(
                    hintText: 'To Location',
                    controller: _toLocationController,
                    onLocationSelected: (location, name) {
                      setState(() {
                        _toLocation = name;
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: const Icon(Icons.calendar_today),
                          title: Text(
                            _dateFilter == null
                                ? 'Any Date'
                                : '${_dateFilter!.day}/${_dateFilter!.month}/${_dateFilter!.year}',
                          ),
                          onTap: _selectDate,
                        ),
                      ),
                      Expanded(
                        child: DropdownButtonFormField<int>(
                          value: _maxPrice,
                          decoration: const InputDecoration(
                            labelText: 'Max Price',
                            prefixIcon: Icon(Icons.attach_money),
                          ),
                          items: [
                            const DropdownMenuItem(
                              value: null,
                              child: Text('Any Price'),
                            ),
                            ...List.generate(10, (index) {
                              final price = (index + 1) * 10;
                              return DropdownMenuItem(
                                value: price,
                                child: Text('\$$price'),
                              );
                            }),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _maxPrice = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<RideDetails>>(
              future: ref.read(rideServiceProvider).getAvailableRides(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                final rides = snapshot.data ?? [];
                final filteredRides = rides.where((ride) {
                  if (_fromLocation != null &&
                      !ride.fromLocation
                          .toLowerCase()
                          .contains(_fromLocation!.toLowerCase())) {
                    return false;
                  }
                  if (_toLocation != null &&
                      !ride.toLocation
                          .toLowerCase()
                          .contains(_toLocation!.toLowerCase())) {
                    return false;
                  }
                  if (_dateFilter != null &&
                      !(ride.startTime.year == _dateFilter!.year &&
                          ride.startTime.month == _dateFilter!.month &&
                          ride.startTime.day == _dateFilter!.day)) {
                    return false;
                  }
                  if (_maxPrice != null && ride.pricePerSeat > _maxPrice!) {
                    return false;
                  }
                  return true;
                }).toList();

                if (filteredRides.isEmpty) {
                  return const Center(
                    child: Text('No rides found matching your criteria'),
                  );
                }

                return ListView.builder(
                  itemCount: filteredRides.length,
                  itemBuilder: (context, index) {
                    final ride = filteredRides[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${ride.fromLocation} → ${ride.toLocation}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Driver: ${ride.driverName}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${ride.startTime.day}/${ride.startTime.month}/${ride.startTime.year} ${ride.startTime.hour}:${ride.startTime.minute.toString().padLeft(2, '0')}',
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${ride.availableSeats} seats available • \$${ride.pricePerSeat} per seat',
                            ),
                            if (ride.notes != null) ...[
                              const SizedBox(height: 4),
                              Text(
                                'Notes: ${ride.notes}',
                                style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          BookingConfirmationScreen(
                                        ride: ride,
                                        seatsToBook: 1, // Default to 1 seat
                                      ),
                                    ),
                                  );
                                },
                                child: const Text('Book'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
