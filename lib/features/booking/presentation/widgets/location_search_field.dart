import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:uber_clone/core/config/app_config.dart';

class LocationSearchField extends StatefulWidget {
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
  State<LocationSearchField> createState() => _LocationSearchFieldState();
}

class _LocationSearchFieldState extends State<LocationSearchField> {
  final _places = GoogleMapsPlaces(apiKey: AppConfig.googleMapsApiKey);
  List<Prediction> _predictions = [];
  bool _isLoading = false;
  final FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus && _predictions.isNotEmpty) {
        _showOverlay();
      } else {
        _removeOverlay();
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _showOverlay() {
    if (_overlayEntry != null) {
      _removeOverlay();
    }

    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 5),
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.3,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: _predictions.length,
                itemBuilder: (context, index) {
                  final prediction = _predictions[index];
                  return InkWell(
                    onTap: () {
                      _selectPlace(prediction);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 20,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              prediction.description ?? '',
                              style: const TextStyle(fontSize: 14),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Future<void> _searchPlaces(String query) async {
    if (query.isEmpty) {
      setState(() {
        _predictions = [];
        _isLoading = false;
      });
      _removeOverlay();
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await _places.autocomplete(
        query,
        types: ['address'],
        components: [Component(Component.country, 'in')],
      );

      if (!response.isOkay) {
        throw Exception('Failed to get places: ${response.errorMessage}');
      }

      setState(() {
        _predictions = response.predictions;
        _isLoading = false;
      });

      // Show overlay if we have predictions and the text field is focused
      if (_predictions.isNotEmpty && _focusNode.hasFocus) {
        _showOverlay();
      }
    } catch (e) {
      print('Error searching places: $e');
      setState(() => _isLoading = false);
    }
  }

  Future<void> _selectPlace(Prediction prediction) async {
    try {
      _removeOverlay();
      setState(() => _isLoading = true);

      final details = await _places.getDetailsByPlaceId(prediction.placeId!);
      if (!mounted) return;

      if (details.isOkay) {
        final location = details.result.geometry!.location;
        final address =
            details.result.formattedAddress ?? prediction.description ?? '';

        // Update the text field
        widget.controller.text = address;

        // Notify the parent about the selection
        widget.onLocationSelected(
          LatLng(location.lat, location.lng),
          address,
        );

        // Clear predictions
        setState(() {
          _predictions = [];
          _isLoading = false;
        });
      } else {
        print('Error getting place details: ${details.errorMessage}');
        setState(() => _isLoading = false);
      }
    } catch (e) {
      print('Error selecting place: $e');
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () {
            // Ensure the text field gets focus when tapped
            if (!_focusNode.hasFocus) {
              FocusScope.of(context).requestFocus(_focusNode);
            }
          },
          child: TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              prefixIcon: const Icon(
                Icons.location_on_outlined,
                size: 20,
                color: Colors.grey,
              ),
              suffixIcon: _isLoading
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    )
                  : null,
            ),
            onChanged: _searchPlaces,
          ),
        ),
      ),
    );
  }
}
