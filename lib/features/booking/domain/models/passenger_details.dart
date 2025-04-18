import 'package:freezed_annotation/freezed_annotation.dart';

part 'passenger_details.freezed.dart';
part 'passenger_details.g.dart';

@freezed
class PassengerDetails with _$PassengerDetails {
  const factory PassengerDetails({
    String? id,
    @JsonKey(name: 'booking_id') required String bookingId,
    @JsonKey(name: 'full_name') required String fullName,
    required int age,
    required String gender,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _PassengerDetails;

  factory PassengerDetails.fromJson(Map<String, dynamic> json) =>
      _$PassengerDetailsFromJson(json);
}
