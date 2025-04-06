import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:uber_clone/core/config/app_config.dart';

class LocationSearchField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(LatLng location, String name) onLocationSelected;

  const LocationSearchField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onLocationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          prefixIcon: const Icon(Icons.location_on_outlined, size: 20),
        ),
        onChanged: (value) async {
          if (value.isEmpty) return;

          final places = GoogleMapsPlaces(apiKey: AppConfig.googleMapsApiKey);
          final response = await places.autocomplete(
            value,
            types: ['address', 'establishment'],
            components: [Component(Component.country, 'in')],
          );

          if (response.isOkay && response.predictions.isNotEmpty) {
            final details = await places
                .getDetailsByPlaceId(response.predictions[0].placeId!);
            if (details.isOkay) {
              final location = details.result.geometry!.location;
              onLocationSelected(
                LatLng(location.lat, location.lng),
                details.result.formattedAddress ?? '',
              );
              controller.text = details.result.formattedAddress ?? '';
            }
          }
        },
      ),
    );
  }
}
