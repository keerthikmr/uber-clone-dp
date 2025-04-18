// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passenger_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PassengerDetailsImpl _$$PassengerDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$PassengerDetailsImpl(
      id: json['id'] as String?,
      bookingId: json['booking_id'] as String,
      fullName: json['full_name'] as String,
      age: (json['age'] as num).toInt(),
      gender: json['gender'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PassengerDetailsImplToJson(
        _$PassengerDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'booking_id': instance.bookingId,
      'full_name': instance.fullName,
      'age': instance.age,
      'gender': instance.gender,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
