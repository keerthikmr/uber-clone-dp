import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uber_clone/core/config/supabase_config.dart';
import 'package:uber_clone/features/booking/domain/models/booking_details.dart';
import 'package:uber_clone/features/booking/domain/models/passenger_details.dart';

class BookingService {
  final SupabaseClient _client = SupabaseConfig.client;

  Future<void> ensureBookingsTableExists() async {
    await _client.rpc('ensure_bookings_table_exists');
  }

  Future<BookingDetails> createBooking({
    required String rideId,
    required String userId,
    required String driverId,
    required String fromLocation,
    required String toLocation,
    required DateTime startTime,
    required int seatsBooked,
    required double totalPrice,
    String? notes,
  }) async {
    // Validate required fields
    if (rideId.isEmpty) throw Exception('Ride ID is required');
    if (userId.isEmpty) throw Exception('User ID is required');
    if (driverId.isEmpty) throw Exception('Driver ID is required');
    if (fromLocation.isEmpty) throw Exception('From location is required');
    if (toLocation.isEmpty) throw Exception('To location is required');

    await ensureBookingsTableExists();

    try {
      final response = await _client
          .from('bookings')
          .insert({
            'ride_id': rideId,
            'user_id': userId,
            'driver_id': driverId,
            'from_location': fromLocation,
            'to_location': toLocation,
            'start_time': startTime.toIso8601String(),
            'seats_booked': seatsBooked,
            'total_price': totalPrice,
            'status': 'pending',
            'notes': notes,
            'is_paid': false,
          })
          .select()
          .single();

      print('Booking response fields:');
      response.forEach((key, value) {
        print('$key: $value (${value?.runtimeType})');
      });

      // Ensure all required fields are present
      final requiredFields = [
        'id',
        'ride_id',
        'user_id',
        'driver_id',
        'from_location',
        'to_location',
        'start_time',
        'seats_booked',
        'total_price',
        'status'
      ];
      for (final field in requiredFields) {
        if (response[field] == null) {
          throw Exception('Missing required field in response: $field');
        }
      }

      return BookingDetails.fromJson(response);
    } catch (e) {
      print('Error creating booking: $e');
      rethrow;
    }
  }

  Future<void> updateBookingStatus({
    required String bookingId,
    required String status,
    String? paymentId,
    DateTime? paymentTime,
    bool? isPaid,
  }) async {
    final updates = {
      'status': status,
      if (paymentId != null) 'payment_id': paymentId,
      if (paymentTime != null) 'payment_time': paymentTime.toIso8601String(),
      if (isPaid != null) 'is_paid': isPaid,
    };

    await _client.from('bookings').update(updates).eq('id', bookingId);
  }

  Future<List<BookingDetails>> getUserBookings(String userId) async {
    final response = await _client
        .from('bookings')
        .select()
        .eq('user_id', userId)
        .order('start_time', ascending: false);

    return response.map((booking) => BookingDetails.fromJson(booking)).toList();
  }

  Future<BookingDetails> getBookingById(String bookingId) async {
    final response =
        await _client.from('bookings').select().eq('id', bookingId).single();

    return BookingDetails.fromJson(response);
  }

  Future<void> ensurePassengersTableExists() async {
    await _client.rpc('ensure_passengers_table_exists');
  }

  Future<List<PassengerDetails>> createPassengers({
    required String bookingId,
    required List<Map<String, dynamic>> passengersData,
  }) async {
    if (passengersData.isEmpty) {
      return [];
    }

    await ensurePassengersTableExists();

    try {
      final List<Map<String, dynamic>> passengersToInsert = passengersData
          .map((passenger) => {
                'booking_id': bookingId,
                'full_name': passenger['fullName'],
                'age': int.parse(passenger['age']),
                'gender': passenger['gender'],
              })
          .toList();

      final response =
          await _client.from('passengers').insert(passengersToInsert).select();

      return response.map((p) => PassengerDetails.fromJson(p)).toList();
    } catch (e) {
      print('Error creating passengers: $e');
      rethrow;
    }
  }

  Future<List<PassengerDetails>> getPassengersByBookingId(
      String bookingId) async {
    try {
      final response =
          await _client.from('passengers').select().eq('booking_id', bookingId);

      return response.map((p) => PassengerDetails.fromJson(p)).toList();
    } catch (e) {
      print('Error getting passengers: $e');
      return [];
    }
  }
}
