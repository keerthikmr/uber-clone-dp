import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uber_clone/features/driver/domain/models/driver_details.dart';

part 'driver_registration_state.freezed.dart';

@freezed
class DriverRegistrationState with _$DriverRegistrationState {
  const factory DriverRegistrationState({
    DriverDetails? driver,
    @Default(false) bool isLoading,
    String? error,
  }) = _DriverRegistrationState;
}
