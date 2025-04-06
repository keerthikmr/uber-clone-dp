import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uber_clone/core/config/supabase_config.dart';
import 'package:uber_clone/features/driver/domain/models/driver_details.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

class DriverService {
  final SupabaseClient _client = SupabaseConfig.client;
  final _uuid = const Uuid();

  // Function to ensure the drivers table exists
  Future<void> ensureDriversTableExists() async {
    try {
      print('Checking if drivers table exists...');

      // Try to query the table - if it doesn't exist, this will throw an error
      try {
        await _client.from('drivers').select('id').limit(1);
        print('✅ Drivers table already exists');
        return;
      } catch (e) {
        print('❌ Drivers table doesn\'t exist or has an error: $e');
      }

      // Create the table if it doesn't exist
      print('Creating drivers table...');
      const createTableSQL = '''
      CREATE TABLE IF NOT EXISTS drivers (
        id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
        full_name TEXT NOT NULL,
        phone_number TEXT NOT NULL,
        email TEXT NOT NULL,
        date_of_birth TIMESTAMP NOT NULL,
        gender TEXT NOT NULL,
        license_number TEXT NOT NULL,
        license_expiry_date TIMESTAMP NOT NULL, 
        vehicle_type TEXT NOT NULL,
        vehicle_registration_number TEXT NOT NULL,
        vehicle_insurance_expiry TIMESTAMP NOT NULL,
        street_address TEXT NOT NULL,
        city TEXT NOT NULL,
        state TEXT NOT NULL,
        zip_code TEXT NOT NULL,
        profile_photo_url TEXT NOT NULL,
        license_photo_url TEXT NOT NULL,
        insurance_photo_url TEXT NOT NULL,
        is_verified BOOLEAN DEFAULT FALSE,
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP DEFAULT NOW()
      );
      ''';

      await _client.rpc('execute_sql', params: {'query': createTableSQL});
      print('✅ Drivers table created successfully');
    } catch (e) {
      print('❌ Error ensuring drivers table exists: $e');
    }
  }

  Future<String> _uploadFile(File file, String folder) async {
    final fileExt = path.extension(file.path);
    final fileName = '${_uuid.v4()}$fileExt';
    final storageResponse = await _client.storage
        .from('driver-documents')
        .upload('$folder/$fileName', file);

    return _client.storage
        .from('driver-documents')
        .getPublicUrl('$folder/$fileName');
  }

  Future<DriverDetails> registerDriver({
    required DriverDetails driverDetails,
    required File profilePhoto,
    required File licensePhoto,
    required File insurancePhoto,
  }) async {
    try {
      print('Starting driver registration for ${driverDetails.fullName}');

      // Ensure the drivers table exists
      await ensureDriversTableExists();

      // For testing only - check if connection works
      print('Testing Supabase connection...');
      try {
        final supabaseUrl = SupabaseConfig.url;
        final supabaseKey = SupabaseConfig.anonKey;
        print('Supabase URL: $supabaseUrl');
        print('Supabase Key exists: ${supabaseKey.isNotEmpty}');

        // Try a simple query to test connection
        final testResponse =
            await _client.from('test_connection').select().maybeSingle();
        print('Supabase test connection response: $testResponse');
      } catch (e) {
        print('Supabase connection test failed: $e');
      }

      // We'll skip file upload for diagnosing the issue
      // Just use placeholder URLs for testing
      final driver = driverDetails.copyWith(
        profilePhotoUrl: 'test_profile_url',
        licensePhotoUrl: 'test_license_url',
        insurancePhotoUrl: 'test_insurance_url',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      print('Converting driver to JSON: ${driver.toJson()}');
      print('Trying to insert into drivers table...');

      try {
        final response = await _client
            .from('drivers')
            .insert(driver.toJson())
            .select()
            .single();

        print('Supabase insert response: $response');
        return DriverDetails.fromJson(response);
      } catch (e) {
        print('ERROR INSERTING DRIVER: $e');
        // Check if the drivers table exists
        try {
          final tables = await _client.rpc('get_tables');
          print('Available tables: $tables');
        } catch (rpcError) {
          print('Error checking tables: $rpcError');
        }
        rethrow;
      }
    } catch (e) {
      print('Error in DriverService.registerDriver: $e');
      throw Exception('Failed to register driver: $e');
    }
  }

  Future<DriverDetails?> getDriverDetails(String driverId) async {
    try {
      final response =
          await _client.from('drivers').select().eq('id', driverId).single();

      return DriverDetails.fromJson(response);
      return null;
    } catch (e) {
      throw Exception('Failed to get driver details: $e');
    }
  }

  Future<void> updateDriverDetails(DriverDetails driver) async {
    try {
      await _client
          .from('drivers')
          .update(driver.copyWith(updatedAt: DateTime.now()).toJson())
          .eq('id', driver.id);
    } catch (e) {
      throw Exception('Failed to update driver details: $e');
    }
  }
}
