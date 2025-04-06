import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_clone/core/config/app_config.dart';
import 'package:uber_clone/core/theme/app_theme.dart';
import 'package:uber_clone/features/auth/presentation/providers/auth_provider.dart';
import 'package:uber_clone/features/booking/presentation/widgets/location_search_field.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/directions.dart' as gmw;
import 'package:uber_clone/core/utils/map_utils.dart';
import 'package:uber_clone/features/auth/presentation/screens/login_screen.dart';
import 'package:uber_clone/features/driver/presentation/screens/driver_registration_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GoogleMapController? _mapController;
  Position? _currentPosition;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  LatLng? _sourceLocation;
  LatLng? _destinationLocation;
  String? _sourceName;
  String? _destinationName;
  bool _isSearching = false;
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _searchFocusNode.addListener(_onSearchFocusChange);

    // Add listener for auth state changes
    Future.microtask(() {
      ref.listen(authProvider, (previous, next) {
        if (next.user == null && mounted) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false,
          );
        }
      });
    });
  }

  void _onSearchFocusChange() {
    if (!_searchFocusNode.hasFocus && !_isSearching) {
      setState(() {
        _isSearching = false;
      });
    }
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = position;
      _markers = {
        Marker(
          markerId: const MarkerId('current_location'),
          position: LatLng(position.latitude, position.longitude),
          infoWindow: const InfoWindow(title: 'Your Location'),
        ),
      };
    });

    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 15,
        ),
      ),
    );
  }

  Future<void> _drawRoute() async {
    if (_sourceLocation == null || _destinationLocation == null) return;

    final directions =
        gmw.GoogleMapsDirections(apiKey: AppConfig.googleMapsApiKey);
    final result = await directions.directionsWithLocation(
      gmw.Location(
          lat: _sourceLocation!.latitude, lng: _sourceLocation!.longitude),
      gmw.Location(
          lat: _destinationLocation!.latitude,
          lng: _destinationLocation!.longitude),
      travelMode: gmw.TravelMode.driving,
    );

    if (result.isOkay) {
      final points = result.routes[0].overviewPolyline.points;
      final coordinates = decodePolyline(points);

      setState(() {
        _polylines = {
          Polyline(
            polylineId: const PolylineId('route'),
            points: coordinates,
            color: Colors.blue,
            width: 5,
          ),
        };
      });

      final bounds = _getBounds(_sourceLocation!, _destinationLocation!);
      _mapController?.animateCamera(
        CameraUpdate.newLatLngBounds(bounds, 50),
      );
    }
  }

  LatLngBounds _getBounds(LatLng source, LatLng destination) {
    final southwest = LatLng(
      min(source.latitude, destination.latitude),
      min(source.longitude, destination.longitude),
    );
    final northeast = LatLng(
      max(source.latitude, destination.latitude),
      max(source.longitude, destination.longitude),
    );
    return LatLngBounds(southwest: southwest, northeast: northeast);
  }

  double min(double a, double b) => a < b ? a : b;
  double max(double a, double b) => a > b ? a : b;

  Widget _buildDrawer() {
    final user = ref.watch(authProvider).user;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(user?.displayName ?? 'User'),
            accountEmail: Text(user?.email ?? ''),
            currentAccountPicture: CircleAvatar(
              backgroundImage:
                  user?.photoURL != null && user!.photoURL!.isNotEmpty
                      ? NetworkImage(user.photoURL!)
                      : null,
              child: user?.photoURL == null || user!.photoURL!.isEmpty
                  ? const Icon(Icons.person)
                  : null,
            ),
            decoration: const BoxDecoration(
              color: AppTheme.primaryColor,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Your Trips'),
            onTap: () {
              // TODO: Implement trip history
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Payment'),
            onTap: () {
              // TODO: Implement payment settings
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // TODO: Implement settings
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_taxi_outlined),
            title: const Text('Register as Driver'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DriverRegistrationScreen(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sign Out'),
            onTap: () {
              Navigator.pop(context);
              ref.read(authProvider.notifier).signOut();
            },
          ),
        ],
      ),
    );
  }

  void _closeSearch() {
    setState(() {
      _isSearching = false;
      _searchFocusNode.unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _closeSearch();
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawer: _buildDrawer(),
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  _currentPosition?.latitude ?? AppConfig.defaultLatitude,
                  _currentPosition?.longitude ?? AppConfig.defaultLongitude,
                ),
                zoom: AppConfig.defaultZoom,
              ),
              onMapCreated: (controller) {
                _mapController = controller;
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              markers: _markers,
              polylines: _polylines,
              onTap: (_) => _closeSearch(),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 8,
              left: 8,
              right: 8,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                child: Card(
                  margin: EdgeInsets.zero,
                  child: Column(
                    children: [
                      Container(
                        height: 56,
                        padding: EdgeInsets.only(
                          left: _isSearching ? 0 : 0,
                          right: 8,
                        ),
                        child: Row(
                          children: [
                            if (!_isSearching) ...[
                              IconButton(
                                icon: const Icon(Icons.menu),
                                onPressed: () {
                                  _scaffoldKey.currentState?.openDrawer();
                                },
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  focusNode: _searchFocusNode,
                                  onTap: () {
                                    setState(() {
                                      _isSearching = true;
                                    });
                                  },
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    hintText: 'Where to?',
                                    prefixIcon: Icon(Icons.search),
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                  ),
                                ),
                              ),
                            ],
                            if (_isSearching) ...[
                              IconButton(
                                icon: const Icon(Icons.arrow_back),
                                onPressed: _closeSearch,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    LocationSearchField(
                                      hintText: 'Where from?',
                                      controller: _sourceController,
                                      onLocationSelected: (location, name) {
                                        setState(() {
                                          _sourceLocation = location;
                                          _sourceName = name;
                                          _markers = {
                                            ..._markers,
                                            Marker(
                                              markerId:
                                                  const MarkerId('source'),
                                              position: location,
                                              infoWindow:
                                                  InfoWindow(title: name),
                                            ),
                                          };
                                        });
                                      },
                                    ),
                                    const Divider(height: 1),
                                    LocationSearchField(
                                      hintText: 'Where to?',
                                      controller: _destinationController,
                                      onLocationSelected: (location, name) {
                                        setState(() {
                                          _destinationLocation = location;
                                          _destinationName = name;
                                          _markers = {
                                            ..._markers,
                                            Marker(
                                              markerId:
                                                  const MarkerId('destination'),
                                              position: location,
                                              infoWindow:
                                                  InfoWindow(title: name),
                                            ),
                                          };
                                          _drawRoute();
                                          _closeSearch();
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _mapController?.dispose();
    _sourceController.dispose();
    _destinationController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }
}
