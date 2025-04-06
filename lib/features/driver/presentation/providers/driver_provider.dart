import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uber_clone/features/driver/domain/models/driver.dart';

part 'driver_provider.g.dart';

@riverpod
class DriverProvider extends _$DriverProvider {
  @override
  DriverState build() {
    return const DriverState();
  }

  Future<void> registerDriver({
    required String name,
    required String phone,
    required String vehicleModel,
    required String vehicleNumber,
    required File licenseImage,
  }) async {
    try {
      state = state.copyWith(isLoading: true);

      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception('User not authenticated');

      // Upload license image
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('driver_licenses')
          .child('${user.uid}.jpg');

      await storageRef.putFile(licenseImage);
      final licenseUrl = await storageRef.getDownloadURL();

      // Create driver document
      final driver = Driver(
        id: user.uid,
        name: name,
        phone: phone,
        vehicleModel: vehicleModel,
        vehicleNumber: vehicleNumber,
        licenseImageUrl: licenseUrl,
        isApproved: false,
        createdAt: DateTime.now(),
      );

      // Save to Firestore
      await FirebaseFirestore.instance
          .collection('drivers')
          .doc(user.uid)
          .set(driver.toJson());

      state = state.copyWith(
        driver: driver,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      rethrow;
    }
  }
}

class DriverState {
  final Driver? driver;
  final bool isLoading;
  final String? error;

  const DriverState({
    this.driver,
    this.isLoading = false,
    this.error,
  });

  DriverState copyWith({
    Driver? driver,
    bool? isLoading,
    String? error,
  }) {
    return DriverState(
      driver: driver ?? this.driver,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
