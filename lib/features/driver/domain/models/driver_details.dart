import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_details.freezed.dart';
part 'driver_details.g.dart';

@freezed
class DriverDetails with _$DriverDetails {
  const factory DriverDetails({
    required String id,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    required String email,
    @JsonKey(name: 'date_of_birth') required DateTime dateOfBirth,
    required String gender,
    @JsonKey(name: 'license_number') required String licenseNumber,
    @JsonKey(name: 'license_expiry_date') required DateTime licenseExpiryDate,
    @JsonKey(name: 'vehicle_type') required String vehicleType,
    @JsonKey(name: 'vehicle_registration_number')
    required String vehicleRegistrationNumber,
    @JsonKey(name: 'vehicle_insurance_expiry')
    required DateTime vehicleInsuranceExpiry,
    @JsonKey(name: 'street_address') required String streetAddress,
    required String city,
    required String state,
    @JsonKey(name: 'zip_code') required String zipCode,
    @JsonKey(name: 'profile_photo_url') required String profilePhotoUrl,
    @JsonKey(name: 'license_photo_url') required String licensePhotoUrl,
    @JsonKey(name: 'insurance_photo_url') required String insurancePhotoUrl,
    @JsonKey(name: 'is_verified') @Default(false) bool isVerified,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _DriverDetails;

  factory DriverDetails.fromJson(Map<String, dynamic> json) =>
      _$DriverDetailsFromJson(json);
}
