import 'package:freezed_annotation/freezed_annotation.dart';

part 'ride_details.freezed.dart';
part 'ride_details.g.dart';

@freezed
class RideDetails with _$RideDetails {
  const factory RideDetails({
    String? id,
    @JsonKey(name: 'driver_id') required String driverId,
    @JsonKey(name: 'from_location') required String fromLocation,
    @JsonKey(name: 'to_location') required String toLocation,
    @JsonKey(name: 'available_seats') required int availableSeats,
    @JsonKey(name: 'start_time') required DateTime startTime,
    @JsonKey(name: 'estimated_duration') required int estimatedDuration,
    @JsonKey(name: 'price_per_seat') required double pricePerSeat,
    String? notes,
    @Default('available') String status,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    String? driverName,
  }) = _RideDetails;

  factory RideDetails.fromJson(Map<String, dynamic> json) =>
      _$RideDetailsFromJson(json);
}
