// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DriverDetailsImpl _$$DriverDetailsImplFromJson(Map<String, dynamic> json) =>
    _$DriverDetailsImpl(
      id: json['id'] as String,
      fullName: json['full_name'] as String,
      phoneNumber: json['phone_number'] as String,
      email: json['email'] as String,
      dateOfBirth: DateTime.parse(json['date_of_birth'] as String),
      gender: json['gender'] as String,
      licenseNumber: json['license_number'] as String,
      licenseExpiryDate: DateTime.parse(json['license_expiry_date'] as String),
      vehicleType: json['vehicle_type'] as String,
      vehicleRegistrationNumber: json['vehicle_registration_number'] as String,
      vehicleInsuranceExpiry:
          DateTime.parse(json['vehicle_insurance_expiry'] as String),
      streetAddress: json['street_address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      zipCode: json['zip_code'] as String,
      profilePhotoUrl: json['profile_photo_url'] as String,
      licensePhotoUrl: json['license_photo_url'] as String,
      insurancePhotoUrl: json['insurance_photo_url'] as String,
      isVerified: json['is_verified'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$DriverDetailsImplToJson(_$DriverDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'date_of_birth': instance.dateOfBirth.toIso8601String(),
      'gender': instance.gender,
      'license_number': instance.licenseNumber,
      'license_expiry_date': instance.licenseExpiryDate.toIso8601String(),
      'vehicle_type': instance.vehicleType,
      'vehicle_registration_number': instance.vehicleRegistrationNumber,
      'vehicle_insurance_expiry':
          instance.vehicleInsuranceExpiry.toIso8601String(),
      'street_address': instance.streetAddress,
      'city': instance.city,
      'state': instance.state,
      'zip_code': instance.zipCode,
      'profile_photo_url': instance.profilePhotoUrl,
      'license_photo_url': instance.licensePhotoUrl,
      'insurance_photo_url': instance.insurancePhotoUrl,
      'is_verified': instance.isVerified,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
