import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uber_clone/core/config/supabase_config.dart';
import 'package:uber_clone/features/ride/domain/models/ride_details.dart';

class RideService {
  final SupabaseClient _client = SupabaseConfig.client;

  Future<void> ensureRidesTableExists() async {
    try {
      // Check if the table exists
      await _client.from('rides').select('id').limit(1);
      print('Rides table exists');
    } catch (e) {
      print(
          'Error: Rides table does not exist. Please create it in the Supabase dashboard.');
      rethrow;
    }
  }

  Future<RideDetails> createRide(RideDetails ride) async {
    try {
      await ensureRidesTableExists();

      // Get the current session and user
      final session = _client.auth.currentSession;
      if (session == null) {
        throw Exception('No active session found');
      }

      final user = session.user;
      if (user.id.isEmpty) {
        throw Exception('Invalid user ID');
      }

      // Create ride with the user's ID
      final rideWithDriverId = ride.copyWith(driverId: user.id);

      final response = await _client
          .from('rides')
          .insert(rideWithDriverId.toJson())
          .select()
          .single();

      return RideDetails.fromJson(response);
    } catch (e) {
      print('Error in createRide: $e');
      throw Exception('Failed to create ride: $e');
    }
  }

  Future<List<RideDetails>> getAvailableRides() async {
    try {
      final response = await _client
          .from('rides')
          .select('*, drivers!inner(full_name)')
          .eq('status', 'available')
          .order('start_time');

      return response.map((ride) {
        final driver = ride['drivers'] as Map<String, dynamic>;
        return RideDetails.fromJson({
          ...ride,
          'driverName': driver['full_name'] ?? 'Unknown Driver',
        });
      }).toList();
    } catch (e) {
      throw Exception('Failed to get available rides: $e');
    }
  }

  Future<List<RideDetails>> getDriverRides(String driverId) async {
    try {
      final response = await _client
          .from('rides')
          .select()
          .eq('driver_id', driverId)
          .order('start_time');

      return response.map((ride) => RideDetails.fromJson(ride)).toList();
    } catch (e) {
      throw Exception('Failed to get driver rides: $e');
    }
  }

  Future<void> updateRideStatus(String rideId, String status) async {
    try {
      await _client.from('rides').update({
        'status': status,
        'updated_at': DateTime.now().toIso8601String()
      }).eq('id', rideId);
    } catch (e) {
      throw Exception('Failed to update ride status: $e');
    }
  }
}
