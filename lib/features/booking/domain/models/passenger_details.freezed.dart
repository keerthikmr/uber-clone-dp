// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'passenger_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PassengerDetails _$PassengerDetailsFromJson(Map<String, dynamic> json) {
  return _PassengerDetails.fromJson(json);
}

/// @nodoc
mixin _$PassengerDetails {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'booking_id')
  String get bookingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PassengerDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PassengerDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PassengerDetailsCopyWith<PassengerDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassengerDetailsCopyWith<$Res> {
  factory $PassengerDetailsCopyWith(
          PassengerDetails value, $Res Function(PassengerDetails) then) =
      _$PassengerDetailsCopyWithImpl<$Res, PassengerDetails>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'booking_id') String bookingId,
      @JsonKey(name: 'full_name') String fullName,
      int age,
      String gender,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$PassengerDetailsCopyWithImpl<$Res, $Val extends PassengerDetails>
    implements $PassengerDetailsCopyWith<$Res> {
  _$PassengerDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PassengerDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bookingId = null,
    Object? fullName = null,
    Object? age = null,
    Object? gender = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$PassengerDetailsImplCopyWith<$Res>
    implements $PassengerDetailsCopyWith<$Res> {
  factory _$$PassengerDetailsImplCopyWith(_$PassengerDetailsImpl value,
          $Res Function(_$PassengerDetailsImpl) then) =
      __$$PassengerDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'booking_id') String bookingId,
      @JsonKey(name: 'full_name') String fullName,
      int age,
      String gender,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$PassengerDetailsImplCopyWithImpl<$Res>
    extends _$PassengerDetailsCopyWithImpl<$Res, _$PassengerDetailsImpl>
    implements _$$PassengerDetailsImplCopyWith<$Res> {
  __$$PassengerDetailsImplCopyWithImpl(_$PassengerDetailsImpl _value,
      $Res Function(_$PassengerDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PassengerDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bookingId = null,
    Object? fullName = null,
    Object? age = null,
    Object? gender = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PassengerDetailsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$PassengerDetailsImpl implements _PassengerDetails {
  const _$PassengerDetailsImpl(
      {this.id,
      @JsonKey(name: 'booking_id') required this.bookingId,
      @JsonKey(name: 'full_name') required this.fullName,
      required this.age,
      required this.gender,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$PassengerDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PassengerDetailsImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'booking_id')
  final String bookingId;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  final int age;
  @override
  final String gender;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PassengerDetails(id: $id, bookingId: $bookingId, fullName: $fullName, age: $age, gender: $gender, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PassengerDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, bookingId, fullName, age, gender, createdAt, updatedAt);

  /// Create a copy of PassengerDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PassengerDetailsImplCopyWith<_$PassengerDetailsImpl> get copyWith =>
      __$$PassengerDetailsImplCopyWithImpl<_$PassengerDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PassengerDetailsImplToJson(
      this,
    );
  }
}

abstract class _PassengerDetails implements PassengerDetails {
  const factory _PassengerDetails(
          {final String? id,
          @JsonKey(name: 'booking_id') required final String bookingId,
          @JsonKey(name: 'full_name') required final String fullName,
          required final int age,
          required final String gender,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$PassengerDetailsImpl;

  factory _PassengerDetails.fromJson(Map<String, dynamic> json) =
      _$PassengerDetailsImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'booking_id')
  String get bookingId;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  int get age;
  @override
  String get gender;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of PassengerDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PassengerDetailsImplCopyWith<_$PassengerDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
