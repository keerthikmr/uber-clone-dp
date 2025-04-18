// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RideDetailsImpl _$$RideDetailsImplFromJson(Map<String, dynamic> json) =>
    _$RideDetailsImpl(
      id: json['id'] as String?,
      driverId: json['driver_id'] as String,
      fromLocation: json['from_location'] as String,
      toLocation: json['to_location'] as String,
      availableSeats: (json['available_seats'] as num).toInt(),
      startTime: DateTime.parse(json['start_time'] as String),
      estimatedDuration: (json['estimated_duration'] as num).toInt(),
      pricePerSeat: (json['price_per_seat'] as num).toDouble(),
      notes: json['notes'] as String?,
      status: json['status'] as String? ?? 'available',
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      driverName: json['driverName'] as String?,
    );

Map<String, dynamic> _$$RideDetailsImplToJson(_$RideDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driver_id': instance.driverId,
      'from_location': instance.fromLocation,
      'to_location': instance.toLocation,
      'available_seats': instance.availableSeats,
      'start_time': instance.startTime.toIso8601String(),
      'estimated_duration': instance.estimatedDuration,
      'price_per_seat': instance.pricePerSeat,
      'notes': instance.notes,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'driverName': instance.driverName,
    };
