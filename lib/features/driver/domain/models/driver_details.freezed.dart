// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DriverDetails _$DriverDetailsFromJson(Map<String, dynamic> json) {
  return _DriverDetails.fromJson(json);
}

/// @nodoc
mixin _$DriverDetails {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String get phoneNumber => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  DateTime get dateOfBirth => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'license_number')
  String get licenseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'license_expiry_date')
  DateTime get licenseExpiryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_type')
  String get vehicleType => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_registration_number')
  String get vehicleRegistrationNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_insurance_expiry')
  DateTime get vehicleInsuranceExpiry => throw _privateConstructorUsedError;
  @JsonKey(name: 'street_address')
  String get streetAddress => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'zip_code')
  String get zipCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_photo_url')
  String? get profilePhotoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'license_photo_url')
  String? get licensePhotoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'insurance_photo_url')
  String? get insurancePhotoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_verified')
  bool get isVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this DriverDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DriverDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DriverDetailsCopyWith<DriverDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverDetailsCopyWith<$Res> {
  factory $DriverDetailsCopyWith(
          DriverDetails value, $Res Function(DriverDetails) then) =
      _$DriverDetailsCopyWithImpl<$Res, DriverDetails>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'full_name') String fullName,
      @JsonKey(name: 'phone_number') String phoneNumber,
      String email,
      @JsonKey(name: 'date_of_birth') DateTime dateOfBirth,
      String gender,
      @JsonKey(name: 'license_number') String licenseNumber,
      @JsonKey(name: 'license_expiry_date') DateTime licenseExpiryDate,
      @JsonKey(name: 'vehicle_type') String vehicleType,
      @JsonKey(name: 'vehicle_registration_number')
      String vehicleRegistrationNumber,
      @JsonKey(name: 'vehicle_insurance_expiry')
      DateTime vehicleInsuranceExpiry,
      @JsonKey(name: 'street_address') String streetAddress,
      String city,
      String state,
      @JsonKey(name: 'zip_code') String zipCode,
      @JsonKey(name: 'profile_photo_url') String? profilePhotoUrl,
      @JsonKey(name: 'license_photo_url') String? licensePhotoUrl,
      @JsonKey(name: 'insurance_photo_url') String? insurancePhotoUrl,
      @JsonKey(name: 'is_verified') bool isVerified,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$DriverDetailsCopyWithImpl<$Res, $Val extends DriverDetails>
    implements $DriverDetailsCopyWith<$Res> {
  _$DriverDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DriverDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? dateOfBirth = null,
    Object? gender = null,
    Object? licenseNumber = null,
    Object? licenseExpiryDate = null,
    Object? vehicleType = null,
    Object? vehicleRegistrationNumber = null,
    Object? vehicleInsuranceExpiry = null,
    Object? streetAddress = null,
    Object? city = null,
    Object? state = null,
    Object? zipCode = null,
    Object? profilePhotoUrl = freezed,
    Object? licensePhotoUrl = freezed,
    Object? insurancePhotoUrl = freezed,
    Object? isVerified = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      licenseExpiryDate: null == licenseExpiryDate
          ? _value.licenseExpiryDate
          : licenseExpiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleRegistrationNumber: null == vehicleRegistrationNumber
          ? _value.vehicleRegistrationNumber
          : vehicleRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleInsuranceExpiry: null == vehicleInsuranceExpiry
          ? _value.vehicleInsuranceExpiry
          : vehicleInsuranceExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime,
      streetAddress: null == streetAddress
          ? _value.streetAddress
          : streetAddress // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoUrl: freezed == profilePhotoUrl
          ? _value.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      licensePhotoUrl: freezed == licensePhotoUrl
          ? _value.licensePhotoUrl
          : licensePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      insurancePhotoUrl: freezed == insurancePhotoUrl
          ? _value.insurancePhotoUrl
          : insurancePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DriverDetailsImplCopyWith<$Res>
    implements $DriverDetailsCopyWith<$Res> {
  factory _$$DriverDetailsImplCopyWith(
          _$DriverDetailsImpl value, $Res Function(_$DriverDetailsImpl) then) =
      __$$DriverDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'full_name') String fullName,
      @JsonKey(name: 'phone_number') String phoneNumber,
      String email,
      @JsonKey(name: 'date_of_birth') DateTime dateOfBirth,
      String gender,
      @JsonKey(name: 'license_number') String licenseNumber,
      @JsonKey(name: 'license_expiry_date') DateTime licenseExpiryDate,
      @JsonKey(name: 'vehicle_type') String vehicleType,
      @JsonKey(name: 'vehicle_registration_number')
      String vehicleRegistrationNumber,
      @JsonKey(name: 'vehicle_insurance_expiry')
      DateTime vehicleInsuranceExpiry,
      @JsonKey(name: 'street_address') String streetAddress,
      String city,
      String state,
      @JsonKey(name: 'zip_code') String zipCode,
      @JsonKey(name: 'profile_photo_url') String? profilePhotoUrl,
      @JsonKey(name: 'license_photo_url') String? licensePhotoUrl,
      @JsonKey(name: 'insurance_photo_url') String? insurancePhotoUrl,
      @JsonKey(name: 'is_verified') bool isVerified,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$DriverDetailsImplCopyWithImpl<$Res>
    extends _$DriverDetailsCopyWithImpl<$Res, _$DriverDetailsImpl>
    implements _$$DriverDetailsImplCopyWith<$Res> {
  __$$DriverDetailsImplCopyWithImpl(
      _$DriverDetailsImpl _value, $Res Function(_$DriverDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DriverDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? dateOfBirth = null,
    Object? gender = null,
    Object? licenseNumber = null,
    Object? licenseExpiryDate = null,
    Object? vehicleType = null,
    Object? vehicleRegistrationNumber = null,
    Object? vehicleInsuranceExpiry = null,
    Object? streetAddress = null,
    Object? city = null,
    Object? state = null,
    Object? zipCode = null,
    Object? profilePhotoUrl = freezed,
    Object? licensePhotoUrl = freezed,
    Object? insurancePhotoUrl = freezed,
    Object? isVerified = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$DriverDetailsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      licenseExpiryDate: null == licenseExpiryDate
          ? _value.licenseExpiryDate
          : licenseExpiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleRegistrationNumber: null == vehicleRegistrationNumber
          ? _value.vehicleRegistrationNumber
          : vehicleRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleInsuranceExpiry: null == vehicleInsuranceExpiry
          ? _value.vehicleInsuranceExpiry
          : vehicleInsuranceExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime,
      streetAddress: null == streetAddress
          ? _value.streetAddress
          : streetAddress // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoUrl: freezed == profilePhotoUrl
          ? _value.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      licensePhotoUrl: freezed == licensePhotoUrl
          ? _value.licensePhotoUrl
          : licensePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      insurancePhotoUrl: freezed == insurancePhotoUrl
          ? _value.insurancePhotoUrl
          : insurancePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverDetailsImpl implements _DriverDetails {
  const _$DriverDetailsImpl(
      {this.id,
      @JsonKey(name: 'full_name') required this.fullName,
      @JsonKey(name: 'phone_number') required this.phoneNumber,
      required this.email,
      @JsonKey(name: 'date_of_birth') required this.dateOfBirth,
      required this.gender,
      @JsonKey(name: 'license_number') required this.licenseNumber,
      @JsonKey(name: 'license_expiry_date') required this.licenseExpiryDate,
      @JsonKey(name: 'vehicle_type') required this.vehicleType,
      @JsonKey(name: 'vehicle_registration_number')
      required this.vehicleRegistrationNumber,
      @JsonKey(name: 'vehicle_insurance_expiry')
      required this.vehicleInsuranceExpiry,
      @JsonKey(name: 'street_address') required this.streetAddress,
      required this.city,
      required this.state,
      @JsonKey(name: 'zip_code') required this.zipCode,
      @JsonKey(name: 'profile_photo_url') this.profilePhotoUrl,
      @JsonKey(name: 'license_photo_url') this.licensePhotoUrl,
      @JsonKey(name: 'insurance_photo_url') this.insurancePhotoUrl,
      @JsonKey(name: 'is_verified') this.isVerified = false,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$DriverDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverDetailsImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @override
  final String email;
  @override
  @JsonKey(name: 'date_of_birth')
  final DateTime dateOfBirth;
  @override
  final String gender;
  @override
  @JsonKey(name: 'license_number')
  final String licenseNumber;
  @override
  @JsonKey(name: 'license_expiry_date')
  final DateTime licenseExpiryDate;
  @override
  @JsonKey(name: 'vehicle_type')
  final String vehicleType;
  @override
  @JsonKey(name: 'vehicle_registration_number')
  final String vehicleRegistrationNumber;
  @override
  @JsonKey(name: 'vehicle_insurance_expiry')
  final DateTime vehicleInsuranceExpiry;
  @override
  @JsonKey(name: 'street_address')
  final String streetAddress;
  @override
  final String city;
  @override
  final String state;
  @override
  @JsonKey(name: 'zip_code')
  final String zipCode;
  @override
  @JsonKey(name: 'profile_photo_url')
  final String? profilePhotoUrl;
  @override
  @JsonKey(name: 'license_photo_url')
  final String? licensePhotoUrl;
  @override
  @JsonKey(name: 'insurance_photo_url')
  final String? insurancePhotoUrl;
  @override
  @JsonKey(name: 'is_verified')
  final bool isVerified;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'DriverDetails(id: $id, fullName: $fullName, phoneNumber: $phoneNumber, email: $email, dateOfBirth: $dateOfBirth, gender: $gender, licenseNumber: $licenseNumber, licenseExpiryDate: $licenseExpiryDate, vehicleType: $vehicleType, vehicleRegistrationNumber: $vehicleRegistrationNumber, vehicleInsuranceExpiry: $vehicleInsuranceExpiry, streetAddress: $streetAddress, city: $city, state: $state, zipCode: $zipCode, profilePhotoUrl: $profilePhotoUrl, licensePhotoUrl: $licensePhotoUrl, insurancePhotoUrl: $insurancePhotoUrl, isVerified: $isVerified, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.licenseExpiryDate, licenseExpiryDate) ||
                other.licenseExpiryDate == licenseExpiryDate) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.vehicleRegistrationNumber,
                    vehicleRegistrationNumber) ||
                other.vehicleRegistrationNumber == vehicleRegistrationNumber) &&
            (identical(other.vehicleInsuranceExpiry, vehicleInsuranceExpiry) ||
                other.vehicleInsuranceExpiry == vehicleInsuranceExpiry) &&
            (identical(other.streetAddress, streetAddress) ||
                other.streetAddress == streetAddress) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.profilePhotoUrl, profilePhotoUrl) ||
                other.profilePhotoUrl == profilePhotoUrl) &&
            (identical(other.licensePhotoUrl, licensePhotoUrl) ||
                other.licensePhotoUrl == licensePhotoUrl) &&
            (identical(other.insurancePhotoUrl, insurancePhotoUrl) ||
                other.insurancePhotoUrl == insurancePhotoUrl) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        fullName,
        phoneNumber,
        email,
        dateOfBirth,
        gender,
        licenseNumber,
        licenseExpiryDate,
        vehicleType,
        vehicleRegistrationNumber,
        vehicleInsuranceExpiry,
        streetAddress,
        city,
        state,
        zipCode,
        profilePhotoUrl,
        licensePhotoUrl,
        insurancePhotoUrl,
        isVerified,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of DriverDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverDetailsImplCopyWith<_$DriverDetailsImpl> get copyWith =>
      __$$DriverDetailsImplCopyWithImpl<_$DriverDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverDetailsImplToJson(
      this,
    );
  }
}

abstract class _DriverDetails implements DriverDetails {
  const factory _DriverDetails(
          {final String? id,
          @JsonKey(name: 'full_name') required final String fullName,
          @JsonKey(name: 'phone_number') required final String phoneNumber,
          required final String email,
          @JsonKey(name: 'date_of_birth') required final DateTime dateOfBirth,
          required final String gender,
          @JsonKey(name: 'license_number') required final String licenseNumber,
          @JsonKey(name: 'license_expiry_date')
          required final DateTime licenseExpiryDate,
          @JsonKey(name: 'vehicle_type') required final String vehicleType,
          @JsonKey(name: 'vehicle_registration_number')
          required final String vehicleRegistrationNumber,
          @JsonKey(name: 'vehicle_insurance_expiry')
          required final DateTime vehicleInsuranceExpiry,
          @JsonKey(name: 'street_address') required final String streetAddress,
          required final String city,
          required final String state,
          @JsonKey(name: 'zip_code') required final String zipCode,
          @JsonKey(name: 'profile_photo_url') final String? profilePhotoUrl,
          @JsonKey(name: 'license_photo_url') final String? licensePhotoUrl,
          @JsonKey(name: 'insurance_photo_url') final String? insurancePhotoUrl,
          @JsonKey(name: 'is_verified') final bool isVerified,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$DriverDetailsImpl;

  factory _DriverDetails.fromJson(Map<String, dynamic> json) =
      _$DriverDetailsImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  @JsonKey(name: 'phone_number')
  String get phoneNumber;
  @override
  String get email;
  @override
  @JsonKey(name: 'date_of_birth')
  DateTime get dateOfBirth;
  @override
  String get gender;
  @override
  @JsonKey(name: 'license_number')
  String get licenseNumber;
  @override
  @JsonKey(name: 'license_expiry_date')
  DateTime get licenseExpiryDate;
  @override
  @JsonKey(name: 'vehicle_type')
  String get vehicleType;
  @override
  @JsonKey(name: 'vehicle_registration_number')
  String get vehicleRegistrationNumber;
  @override
  @JsonKey(name: 'vehicle_insurance_expiry')
  DateTime get vehicleInsuranceExpiry;
  @override
  @JsonKey(name: 'street_address')
  String get streetAddress;
  @override
  String get city;
  @override
  String get state;
  @override
  @JsonKey(name: 'zip_code')
  String get zipCode;
  @override
  @JsonKey(name: 'profile_photo_url')
  String? get profilePhotoUrl;
  @override
  @JsonKey(name: 'license_photo_url')
  String? get licensePhotoUrl;
  @override
  @JsonKey(name: 'insurance_photo_url')
  String? get insurancePhotoUrl;
  @override
  @JsonKey(name: 'is_verified')
  bool get isVerified;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of DriverDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DriverDetailsImplCopyWith<_$DriverDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
