import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uber_clone/features/ride/data/services/ride_service.dart';

final rideServiceProvider = Provider<RideService>((ref) {
  return RideService();
});
