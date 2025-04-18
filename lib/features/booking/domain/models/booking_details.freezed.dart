// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookingDetails _$BookingDetailsFromJson(Map<String, dynamic> json) {
  return _BookingDetails.fromJson(json);
}

/// @nodoc
mixin _$BookingDetails {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'ride_id')
  String get rideId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_id')
  String get driverId => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_location')
  String get fromLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_location')
  String get toLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  DateTime get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'seats_booked')
  int get seatsBooked => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price')
  double get totalPrice => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false, name: 'payment_id')
  String? get paymentId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false, name: 'payment_time')
  DateTime? get paymentTime => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_paid')
  bool get isPaid => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  List<PassengerDetails>? get passengers => throw _privateConstructorUsedError;

  /// Serializes this BookingDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookingDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingDetailsCopyWith<BookingDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingDetailsCopyWith<$Res> {
  factory $BookingDetailsCopyWith(
          BookingDetails value, $Res Function(BookingDetails) then) =
      _$BookingDetailsCopyWithImpl<$Res, BookingDetails>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'ride_id') String rideId,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'driver_id') String driverId,
      @JsonKey(name: 'from_location') String fromLocation,
      @JsonKey(name: 'to_location') String toLocation,
      @JsonKey(name: 'start_time') DateTime startTime,
      @JsonKey(name: 'seats_booked') int seatsBooked,
      @JsonKey(name: 'total_price') double totalPrice,
      String status,
      @JsonKey(includeIfNull: false, name: 'payment_id') String? paymentId,
      @JsonKey(includeIfNull: false, name: 'payment_time')
      DateTime? paymentTime,
      String? notes,
      @JsonKey(name: 'is_paid') bool isPaid,
      @JsonKey(includeIfNull: false) List<PassengerDetails>? passengers});
}

/// @nodoc
class _$BookingDetailsCopyWithImpl<$Res, $Val extends BookingDetails>
    implements $BookingDetailsCopyWith<$Res> {
  _$BookingDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rideId = null,
    Object? userId = null,
    Object? driverId = null,
    Object? fromLocation = null,
    Object? toLocation = null,
    Object? startTime = null,
    Object? seatsBooked = null,
    Object? totalPrice = null,
    Object? status = null,
    Object? paymentId = freezed,
    Object? paymentTime = freezed,
    Object? notes = freezed,
    Object? isPaid = null,
    Object? passengers = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rideId: null == rideId
          ? _value.rideId
          : rideId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
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
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      seatsBooked: null == seatsBooked
          ? _value.seatsBooked
          : seatsBooked // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentTime: freezed == paymentTime
          ? _value.paymentTime
          : paymentTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isPaid: null == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      passengers: freezed == passengers
          ? _value.passengers
          : passengers // ignore: cast_nullable_to_non_nullable
              as List<PassengerDetails>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingDetailsImplCopyWith<$Res>
    implements $BookingDetailsCopyWith<$Res> {
  factory _$$BookingDetailsImplCopyWith(_$BookingDetailsImpl value,
          $Res Function(_$BookingDetailsImpl) then) =
      __$$BookingDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'ride_id') String rideId,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'driver_id') String driverId,
      @JsonKey(name: 'from_location') String fromLocation,
      @JsonKey(name: 'to_location') String toLocation,
      @JsonKey(name: 'start_time') DateTime startTime,
      @JsonKey(name: 'seats_booked') int seatsBooked,
      @JsonKey(name: 'total_price') double totalPrice,
      String status,
      @JsonKey(includeIfNull: false, name: 'payment_id') String? paymentId,
      @JsonKey(includeIfNull: false, name: 'payment_time')
      DateTime? paymentTime,
      String? notes,
      @JsonKey(name: 'is_paid') bool isPaid,
      @JsonKey(includeIfNull: false) List<PassengerDetails>? passengers});
}

/// @nodoc
class __$$BookingDetailsImplCopyWithImpl<$Res>
    extends _$BookingDetailsCopyWithImpl<$Res, _$BookingDetailsImpl>
    implements _$$BookingDetailsImplCopyWith<$Res> {
  __$$BookingDetailsImplCopyWithImpl(
      _$BookingDetailsImpl _value, $Res Function(_$BookingDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rideId = null,
    Object? userId = null,
    Object? driverId = null,
    Object? fromLocation = null,
    Object? toLocation = null,
    Object? startTime = null,
    Object? seatsBooked = null,
    Object? totalPrice = null,
    Object? status = null,
    Object? paymentId = freezed,
    Object? paymentTime = freezed,
    Object? notes = freezed,
    Object? isPaid = null,
    Object? passengers = freezed,
  }) {
    return _then(_$BookingDetailsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rideId: null == rideId
          ? _value.rideId
          : rideId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
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
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      seatsBooked: null == seatsBooked
          ? _value.seatsBooked
          : seatsBooked // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentTime: freezed == paymentTime
          ? _value.paymentTime
          : paymentTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isPaid: null == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      passengers: freezed == passengers
          ? _value._passengers
          : passengers // ignore: cast_nullable_to_non_nullable
              as List<PassengerDetails>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingDetailsImpl implements _BookingDetails {
  const _$BookingDetailsImpl(
      {required this.id,
      @JsonKey(name: 'ride_id') required this.rideId,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'driver_id') required this.driverId,
      @JsonKey(name: 'from_location') required this.fromLocation,
      @JsonKey(name: 'to_location') required this.toLocation,
      @JsonKey(name: 'start_time') required this.startTime,
      @JsonKey(name: 'seats_booked') required this.seatsBooked,
      @JsonKey(name: 'total_price') required this.totalPrice,
      required this.status,
      @JsonKey(includeIfNull: false, name: 'payment_id') this.paymentId,
      @JsonKey(includeIfNull: false, name: 'payment_time') this.paymentTime,
      this.notes,
      @JsonKey(name: 'is_paid') this.isPaid = false,
      @JsonKey(includeIfNull: false) final List<PassengerDetails>? passengers})
      : _passengers = passengers;

  factory _$BookingDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingDetailsImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'ride_id')
  final String rideId;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
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
  @JsonKey(name: 'start_time')
  final DateTime startTime;
  @override
  @JsonKey(name: 'seats_booked')
  final int seatsBooked;
  @override
  @JsonKey(name: 'total_price')
  final double totalPrice;
  @override
  final String status;
  @override
  @JsonKey(includeIfNull: false, name: 'payment_id')
  final String? paymentId;
  @override
  @JsonKey(includeIfNull: false, name: 'payment_time')
  final DateTime? paymentTime;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'is_paid')
  final bool isPaid;
  final List<PassengerDetails>? _passengers;
  @override
  @JsonKey(includeIfNull: false)
  List<PassengerDetails>? get passengers {
    final value = _passengers;
    if (value == null) return null;
    if (_passengers is EqualUnmodifiableListView) return _passengers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BookingDetails(id: $id, rideId: $rideId, userId: $userId, driverId: $driverId, fromLocation: $fromLocation, toLocation: $toLocation, startTime: $startTime, seatsBooked: $seatsBooked, totalPrice: $totalPrice, status: $status, paymentId: $paymentId, paymentTime: $paymentTime, notes: $notes, isPaid: $isPaid, passengers: $passengers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rideId, rideId) || other.rideId == rideId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.fromLocation, fromLocation) ||
                other.fromLocation == fromLocation) &&
            (identical(other.toLocation, toLocation) ||
                other.toLocation == toLocation) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.seatsBooked, seatsBooked) ||
                other.seatsBooked == seatsBooked) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.paymentTime, paymentTime) ||
                other.paymentTime == paymentTime) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            const DeepCollectionEquality()
                .equals(other._passengers, _passengers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      rideId,
      userId,
      driverId,
      fromLocation,
      toLocation,
      startTime,
      seatsBooked,
      totalPrice,
      status,
      paymentId,
      paymentTime,
      notes,
      isPaid,
      const DeepCollectionEquality().hash(_passengers));

  /// Create a copy of BookingDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingDetailsImplCopyWith<_$BookingDetailsImpl> get copyWith =>
      __$$BookingDetailsImplCopyWithImpl<_$BookingDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingDetailsImplToJson(
      this,
    );
  }
}

abstract class _BookingDetails implements BookingDetails {
  const factory _BookingDetails(
      {required final String id,
      @JsonKey(name: 'ride_id') required final String rideId,
      @JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'driver_id') required final String driverId,
      @JsonKey(name: 'from_location') required final String fromLocation,
      @JsonKey(name: 'to_location') required final String toLocation,
      @JsonKey(name: 'start_time') required final DateTime startTime,
      @JsonKey(name: 'seats_booked') required final int seatsBooked,
      @JsonKey(name: 'total_price') required final double totalPrice,
      required final String status,
      @JsonKey(includeIfNull: false, name: 'payment_id')
      final String? paymentId,
      @JsonKey(includeIfNull: false, name: 'payment_time')
      final DateTime? paymentTime,
      final String? notes,
      @JsonKey(name: 'is_paid') final bool isPaid,
      @JsonKey(includeIfNull: false)
      final List<PassengerDetails>? passengers}) = _$BookingDetailsImpl;

  factory _BookingDetails.fromJson(Map<String, dynamic> json) =
      _$BookingDetailsImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'ride_id')
  String get rideId;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
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
  @JsonKey(name: 'start_time')
  DateTime get startTime;
  @override
  @JsonKey(name: 'seats_booked')
  int get seatsBooked;
  @override
  @JsonKey(name: 'total_price')
  double get totalPrice;
  @override
  String get status;
  @override
  @JsonKey(includeIfNull: false, name: 'payment_id')
  String? get paymentId;
  @override
  @JsonKey(includeIfNull: false, name: 'payment_time')
  DateTime? get paymentTime;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'is_paid')
  bool get isPaid;
  @override
  @JsonKey(includeIfNull: false)
  List<PassengerDetails>? get passengers;

  /// Create a copy of BookingDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingDetailsImplCopyWith<_$BookingDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
