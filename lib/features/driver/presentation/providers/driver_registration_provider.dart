import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uber_clone/features/driver/data/services/driver_service.dart';
import 'package:uber_clone/features/driver/domain/models/driver_details.dart';
import 'package:uber_clone/features/driver/domain/services/driver_service.dart';

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
  (ref) => DriverRegistrationNotifier(),
);

class DriverRegistrationNotifier
    extends StateNotifier<DriverRegistrationState> {
  DriverRegistrationNotifier() : super(const DriverRegistrationState());

  final _driverService = DriverService();

  Future<void> registerDriver(DriverDetails details) async {
    try {
      print('Starting driver registration process...');
      print('Driver details: ${details.toJson()}');

      state = state.copyWith(isLoading: true, error: null);
      print('State updated to loading...');

      final result = await _driverService.registerDriver(details);
      print('Driver registration result: $result');

      if (result != null) {
        print('Registration successful!');
        state = state.copyWith(
          isLoading: false,
          driverDetails: result,
        );
      } else {
        print('Registration failed - no result returned');
        state = state.copyWith(
          isLoading: false,
          error: 'Failed to register driver',
        );
      }
    } catch (e, stackTrace) {
      print('Error during driver registration: $e');
      print('Stack trace: $stackTrace');
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}
