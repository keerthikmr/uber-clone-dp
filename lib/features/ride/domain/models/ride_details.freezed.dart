// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ride_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RideDetails _$RideDetailsFromJson(Map<String, dynamic> json) {
  return _RideDetails.fromJson(json);
}

/// @nodoc
mixin _$RideDetails {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_id')
  String get driverId => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_location')
  String get fromLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_location')
  String get toLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_seats')
  int get availableSeats => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  DateTime get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimated_duration')
  int get estimatedDuration => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_per_seat')
  double get pricePerSeat => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get driverName => throw _privateConstructorUsedError;

  /// Serializes this RideDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RideDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RideDetailsCopyWith<RideDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RideDetailsCopyWith<$Res> {
  factory $RideDetailsCopyWith(
          RideDetails value, $Res Function(RideDetails) then) =
      _$RideDetailsCopyWithImpl<$Res, RideDetails>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'driver_id') String driverId,
      @JsonKey(name: 'from_location') String fromLocation,
      @JsonKey(name: 'to_location') String toLocation,
      @JsonKey(name: 'available_seats') int availableSeats,
      @JsonKey(name: 'start_time') DateTime startTime,
      @JsonKey(name: 'estimated_duration') int estimatedDuration,
      @JsonKey(name: 'price_per_seat') double pricePerSeat,
      String? notes,
      String status,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      String? driverName});
}

/// @nodoc
class _$RideDetailsCopyWithImpl<$Res, $Val extends RideDetails>
    implements $RideDetailsCopyWith<$Res> {
  _$RideDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RideDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? driverId = null,
    Object? fromLocation = null,
    Object? toLocation = null,
    Object? availableSeats = null,
    Object? startTime = null,
    Object? estimatedDuration = null,
    Object? pricePerSeat = null,
    Object? notes = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? driverName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      fromLocation: null == fromLocation
          ? _value.fromLocation
          : fromLocation // ignore: cast_nullable_to_non_nullable
              as String,
      toLocation: null == toLocation
          ? _value.toLocation
          : toLocation // ignore: cast_nullable_to_non_nullable
              as String,
      availableSeats: null == availableSeats
          ? _value.availableSeats
          : availableSeats // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      estimatedDuration: null == estimatedDuration
          ? _value.estimatedDuration
          : estimatedDuration // ignore: cast_nullable_to_non_nullable
              as int,
      pricePerSeat: null == pricePerSeat
          ? _value.pricePerSeat
          : pricePerSeat // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RideDetailsImplCopyWith<$Res>
    implements $RideDetailsCopyWith<$Res> {
  factory _$$RideDetailsImplCopyWith(
          _$RideDetailsImpl value, $Res Function(_$RideDetailsImpl) then) =
      __$$RideDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'driver_id') String driverId,
      @JsonKey(name: 'from_location') String fromLocation,
      @JsonKey(name: 'to_location') String toLocation,
      @JsonKey(name: 'available_seats') int availableSeats,
      @JsonKey(name: 'start_time') DateTime startTime,
      @JsonKey(name: 'estimated_duration') int estimatedDuration,
      @JsonKey(name: 'price_per_seat') double pricePerSeat,
      String? notes,
      String status,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      String? driverName});
}

/// @nodoc
class __$$RideDetailsImplCopyWithImpl<$Res>
    extends _$RideDetailsCopyWithImpl<$Res, _$RideDetailsImpl>
    implements _$$RideDetailsImplCopyWith<$Res> {
  __$$RideDetailsImplCopyWithImpl(
      _$RideDetailsImpl _value, $Res Function(_$RideDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RideDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? driverId = null,
    Object? fromLocation = null,
    Object? toLocation = null,
    Object? availableSeats = null,
    Object? startTime = null,
    Object? estimatedDuration = null,
    Object? pricePerSeat = null,
    Object? notes = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? driverName = freezed,
  }) {
    return _then(_$RideDetailsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      fromLocation: null == fromLocation
          ? _value.fromLocation
          : fromLocation // ignore: cast_nullable_to_non_nullable
              as String,
      toLocation: null == toLocation
          ? _value.toLocation
          : toLocation // ignore: cast_nullable_to_non_nullable
              as String,
      availableSeats: null == availableSeats
          ? _value.availableSeats
          : availableSeats // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      estimatedDuration: null == estimatedDuration
          ? _value.estimatedDuration
          : estimatedDuration // ignore: cast_nullable_to_non_nullable
              as int,
      pricePerSeat: null == pricePerSeat
          ? _value.pricePerSeat
          : pricePerSeat // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RideDetailsImpl implements _RideDetails {
  const _$RideDetailsImpl(
      {this.id,
      @JsonKey(name: 'driver_id') required this.driverId,
      @JsonKey(name: 'from_location') required this.fromLocation,
      @JsonKey(name: 'to_location') required this.toLocation,
      @JsonKey(name: 'available_seats') required this.availableSeats,
      @JsonKey(name: 'start_time') required this.startTime,
      @JsonKey(name: 'estimated_duration') required this.estimatedDuration,
      @JsonKey(name: 'price_per_seat') required this.pricePerSeat,
      this.notes,
      this.status = 'available',
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      this.driverName});

  factory _$RideDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RideDetailsImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'driver_id')
  final String driverId;
  @override
  @JsonKey(name: 'from_location')
  final String fromLocation;
  @override
  @JsonKey(name: 'to_location')
  final String toLocation;
  @override
  @JsonKey(name: 'available_seats')
  final int availableSeats;
  @override
  @JsonKey(name: 'start_time')
  final DateTime startTime;
  @override
  @JsonKey(name: 'estimated_duration')
  final int estimatedDuration;
  @override
  @JsonKey(name: 'price_per_seat')
  final double pricePerSeat;
  @override
  final String? notes;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  final String? driverName;

  @override
  String toString() {
    return 'RideDetails(id: $id, driverId: $driverId, fromLocation: $fromLocation, toLocation: $toLocation, availableSeats: $availableSeats, startTime: $startTime, estimatedDuration: $estimatedDuration, pricePerSeat: $pricePerSeat, notes: $notes, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, driverName: $driverName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RideDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.fromLocation, fromLocation) ||
                other.fromLocation == fromLocation) &&
            (identical(other.toLocation, toLocation) ||
                other.toLocation == toLocation) &&
            (identical(other.availableSeats, availableSeats) ||
                other.availableSeats == availableSeats) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.estimatedDuration, estimatedDuration) ||
                other.estimatedDuration == estimatedDuration) &&
            (identical(other.pricePerSeat, pricePerSeat) ||
                other.pricePerSeat == pricePerSeat) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      driverId,
      fromLocation,
      toLocation,
      availableSeats,
      startTime,
      estimatedDuration,
      pricePerSeat,
      notes,
      status,
      createdAt,
      updatedAt,
      driverName);

  /// Create a copy of RideDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RideDetailsImplCopyWith<_$RideDetailsImpl> get copyWith =>
      __$$RideDetailsImplCopyWithImpl<_$RideDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RideDetailsImplToJson(
      this,
    );
  }
}

abstract class _RideDetails implements RideDetails {
  const factory _RideDetails(
      {final String? id,
      @JsonKey(name: 'driver_id') required final String driverId,
      @JsonKey(name: 'from_location') required final String fromLocation,
      @JsonKey(name: 'to_location') required final String toLocation,
      @JsonKey(name: 'available_seats') required final int availableSeats,
      @JsonKey(name: 'start_time') required final DateTime startTime,
      @JsonKey(name: 'estimated_duration') required final int estimatedDuration,
      @JsonKey(name: 'price_per_seat') required final double pricePerSeat,
      final String? notes,
      final String status,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      final String? driverName}) = _$RideDetailsImpl;

  factory _RideDetails.fromJson(Map<String, dynamic> json) =
      _$RideDetailsImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'driver_id')
  String get driverId;
  @override
  @JsonKey(name: 'from_location')
  String get fromLocation;
  @override
  @JsonKey(name: 'to_location')
  String get toLocation;
  @override
  @JsonKey(name: 'available_seats')
  int get availableSeats;
  @override
  @JsonKey(name: 'start_time')
  DateTime get startTime;
  @override
  @JsonKey(name: 'estimated_duration')
  int get estimatedDuration;
  @override
  @JsonKey(name: 'price_per_seat')
  double get pricePerSeat;
  @override
  String? get notes;
  @override
  String get status;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  String? get driverName;

  /// Create a copy of RideDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RideDetailsImplCopyWith<_$RideDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
