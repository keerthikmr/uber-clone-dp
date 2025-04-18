// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingDetailsImpl _$$BookingDetailsImplFromJson(Map<String, dynamic> json) =>
    _$BookingDetailsImpl(
      id: json['id'] as String,
      rideId: json['ride_id'] as String,
      userId: json['user_id'] as String,
      driverId: json['driver_id'] as String,
      fromLocation: json['from_location'] as String,
      toLocation: json['to_location'] as String,
      startTime: DateTime.parse(json['start_time'] as String),
      seatsBooked: (json['seats_booked'] as num).toInt(),
      totalPrice: (json['total_price'] as num).toDouble(),
      status: json['status'] as String,
      paymentId: json['payment_id'] as String?,
      paymentTime: json['payment_time'] == null
          ? null
          : DateTime.parse(json['payment_time'] as String),
      notes: json['notes'] as String?,
      isPaid: json['is_paid'] as bool? ?? false,
      passengers: (json['passengers'] as List<dynamic>?)
          ?.map((e) => PassengerDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BookingDetailsImplToJson(
        _$BookingDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ride_id': instance.rideId,
      'user_id': instance.userId,
      'driver_id': instance.driverId,
      'from_location': instance.fromLocation,
      'to_location': instance.toLocation,
      'start_time': instance.startTime.toIso8601String(),
      'seats_booked': instance.seatsBooked,
      'total_price': instance.totalPrice,
      'status': instance.status,
      if (instance.paymentId case final value?) 'payment_id': value,
      if (instance.paymentTime?.toIso8601String() case final value?)
        'payment_time': value,
      'notes': instance.notes,
      'is_paid': instance.isPaid,
      if (instance.passengers case final value?) 'passengers': value,
    };
