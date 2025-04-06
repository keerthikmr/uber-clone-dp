import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uber_clone/features/driver/domain/models/driver_details.dart';

class DriverService {
  final _supabase = Supabase.instance.client;

  Future<DriverDetails?> registerDriver(DriverDetails details) async {
    try {
      print('DriverService: Starting registration process...');
      print('DriverService: Supabase client initialized: ${_supabase != null}');

      // Ensure the drivers table exists
      await ensureDriversTableExists();
      print('DriverService: Drivers table verified/created');

      print('DriverService: Converting driver details to JSON...');
      final driverData = details.toJson();
      print('DriverService: JSON data: $driverData');

      print('DriverService: Attempting to insert into Supabase...');
      final response =
          await _supabase.from('drivers').insert(driverData).select().single();
      print('DriverService: Supabase response: $response');

      if (response != null) {
        print('DriverService: Successfully inserted driver data');
        return DriverDetails.fromJson(response);
      } else {
        print('DriverService: No response data received from Supabase');
        return null;
      }
    } catch (e, stackTrace) {
      print('DriverService: Error during registration: $e');
      print('DriverService: Stack trace: $stackTrace');
      rethrow;
    }
  }

  Future<void> ensureDriversTableExists() async {
    try {
      print('DriverService: Checking if drivers table exists...');
      final result = await _supabase
          .rpc('table_exists', params: {'table_name': 'drivers'});
      print('DriverService: Table exists check result: $result');

      if (result == false) {
        print('DriverService: Creating drivers table...');
        await _supabase.rpc('create_drivers_table');
        print('DriverService: Drivers table created successfully');
      }
    } catch (e, stackTrace) {
      print('DriverService: Error checking/creating drivers table: $e');
      print('DriverService: Stack trace: $stackTrace');
      rethrow;
    }
  }
}
