import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uber_clone/features/booking/domain/models/passenger_details.dart';

part 'booking_details.freezed.dart';
part 'booking_details.g.dart';

@freezed
class BookingDetails with _$BookingDetails {
  const factory BookingDetails({
    required String id,
    @JsonKey(name: 'ride_id') required String rideId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'driver_id') required String driverId,
    @JsonKey(name: 'from_location') required String fromLocation,
    @JsonKey(name: 'to_location') required String toLocation,
    @JsonKey(name: 'start_time') required DateTime startTime,
    @JsonKey(name: 'seats_booked') required int seatsBooked,
    @JsonKey(name: 'total_price') required double totalPrice,
    required String status,
    @JsonKey(includeIfNull: false, name: 'payment_id') String? paymentId,
    @JsonKey(includeIfNull: false, name: 'payment_time') DateTime? paymentTime,
    String? notes,
    @JsonKey(name: 'is_paid') @Default(false) bool isPaid,
    @JsonKey(includeIfNull: false) List<PassengerDetails>? passengers,
  }) = _BookingDetails;

  factory BookingDetails.fromJson(Map<String, dynamic> json) =>
      _$BookingDetailsFromJson(json);
}
