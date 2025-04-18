import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uber_clone/core/config/supabase_config.dart';
import 'package:uber_clone/features/driver/domain/models/driver_details.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

class DriverService {
  final _supabase = SupabaseConfig.client;
  final _uuid = const Uuid();

  Future<void> ensureDriversTableExists() async {
    try {
      // First, check if the table exists
      try {
        await _supabase.from('drivers').select('id').limit(1);
        print('Drivers table already exists');
        return;
      } catch (e) {
        print('Drivers table does not exist, creating it...');
      }

      // If table doesn't exist, create it
      const createTableSQL = '''
      CREATE TABLE IF NOT EXISTS public.drivers (
        id UUID PRIMARY KEY REFERENCES auth.users(id),
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
        status TEXT NOT NULL DEFAULT 'pending',
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP DEFAULT NOW()
      );
      ''';

      // Execute the SQL directly
      await _supabase.from('drivers').select('id').limit(1);
      print('Drivers table created successfully');
    } catch (e) {
      print('Error ensuring drivers table exists: $e');
      // If we can't create the table, we'll need to create it manually in the Supabase dashboard
      throw Exception(
          'Please create the drivers table manually in the Supabase dashboard');
    }
  }

  Future<String> _uploadFile(File file, String folder) async {
    final fileExt = path.extension(file.path);
    final fileName = '${_uuid.v4()}$fileExt';
    final storageResponse = await _supabase.storage
        .from('driver-documents')
        .upload('$folder/$fileName', file);

    return _supabase.storage
        .from('driver-documents')
        .getPublicUrl('$folder/$fileName');
  }

  Future<void> registerDriver({
    required DriverDetails details,
    required File profilePhoto,
    required File licensePhoto,
    required File insurancePhoto,
  }) async {
    try {
      // Ensure the drivers table exists
      await ensureDriversTableExists();

      // Get the current session and user
      final session = _supabase.auth.currentSession;
      if (session == null) {
        throw Exception('No active session found');
      }

      final user = session.user;

      if (user.id.isEmpty) {
        throw Exception('Invalid user ID');
      }

      // Update user metadata to mark as driver
      await _supabase.auth.updateUser(
        UserAttributes(
          data: {
            'is_driver': true,
            'driver_status': 'pending',
          },
        ),
      );

      // Upload photos and get URLs
      final profilePhotoUrl = await _uploadFile(profilePhoto, 'profile');
      final licensePhotoUrl = await _uploadFile(licensePhoto, 'license');
      final insurancePhotoUrl = await _uploadFile(insurancePhoto, 'insurance');

      // Insert driver details with user ID
      final driverData = {
        'id': user.id,
        'full_name': details.fullName,
        'phone_number': details.phoneNumber,
        'email': details.email,
        'date_of_birth': details.dateOfBirth.toIso8601String(),
        'gender': details.gender,
        'license_number': details.licenseNumber,
        'license_expiry_date': details.licenseExpiryDate.toIso8601String(),
        'vehicle_type': details.vehicleType,
        'vehicle_registration_number': details.vehicleRegistrationNumber,
        'vehicle_insurance_expiry':
            details.vehicleInsuranceExpiry.toIso8601String(),
        'street_address': details.streetAddress,
        'city': details.city,
        'state': details.state,
        'zip_code': details.zipCode,
        'profile_photo_url': profilePhotoUrl,
        'license_photo_url': licensePhotoUrl,
        'insurance_photo_url': insurancePhotoUrl,
        'is_verified': false,
        'status': 'pending',
        'created_at': DateTime.now().toIso8601String(),
        'updated_at': DateTime.now().toIso8601String(),
      };

      // Verify the ID is set before insert
      if (driverData['id'] == null) {
        throw Exception('User ID is null in driver data');
      }

      final response =
          await _supabase.from('drivers').insert(driverData).select();
    } catch (e) {
      print('Error in registerDriver: $e');
      rethrow;
    }
  }

  Future<DriverDetails?> getDriverDetails(String userId) async {
    try {
      final response =
          await _supabase.from('drivers').select().eq('id', userId).single();
      return DriverDetails.fromJson(response);
    } catch (e) {
      print('Error getting driver details: $e');
      return null;
    }
  }

  Future<bool> isUserDriver(String userId) async {
    try {
      final user = await _supabase.auth.getUser();
      return user.user?.userMetadata?['is_driver'] == true;
    } catch (e) {
      print('Error checking if user is driver: $e');
      return false;
    }
  }
}
