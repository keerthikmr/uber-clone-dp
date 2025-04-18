import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uber_clone/features/driver/domain/models/driver_details.dart';
import 'package:uber_clone/features/driver/domain/services/driver_service.dart';
import 'package:uber_clone/features/auth/presentation/providers/auth_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uber_clone/core/config/supabase_config.dart';

part 'driver_registration_provider.freezed.dart';

@freezed
class DriverRegistrationState with _$DriverRegistrationState {
  const factory DriverRegistrationState({
    @Default(false) bool isLoading,
    String? error,
    DriverDetails? driverDetails,
  }) = _DriverRegistrationState;
}

final driverRegistrationProvider =
    StateNotifierProvider<DriverRegistrationNotifier, DriverRegistrationState>(
  (ref) => DriverRegistrationNotifier(ref),
);

class DriverRegistrationNotifier
    extends StateNotifier<DriverRegistrationState> {
  final Ref _ref;
  final _driverService = DriverService();
  final _supabase = SupabaseConfig.client;

  DriverRegistrationNotifier(this._ref)
      : super(const DriverRegistrationState());

  Future<void> registerDriver(DriverDetails details) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      print('Starting driver registration process...');

      // First, ensure the drivers table exists
      await _driverService.ensureDriversTableExists();
      print('Drivers table existence checked');

      // Get the current user
      final authState = _ref.read(authProvider);
      if (authState.user == null) {
        throw Exception('User not authenticated');
      }

      // Update user metadata to mark them as a driver
      await _supabase.auth.updateUser(
        UserAttributes(
          data: {
            'is_driver': true,
            'full_name': details.fullName,
          },
        ),
      );
      print('User metadata updated');

      // Insert the driver details into the drivers table
      final response = await _supabase
          .from('drivers')
          .insert(details.toJson())
          .select()
          .single();
      print('Driver details inserted into database');

      state = state.copyWith(
        isLoading: false,
        driverDetails: DriverDetails.fromJson(response),
      );
    } catch (e, stackTrace) {
      print('Error during driver registration: $e');
      print('Stack trace: $stackTrace');
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      rethrow;
    }
  }
}
