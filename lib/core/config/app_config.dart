import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get googleMapsApiKey => dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';
  
  static Map<String, String> get firebaseConfig => {
    'apiKey': dotenv.env['FIREBASE_API_KEY'] ?? '',
    'appId': dotenv.env['FIREBASE_APP_ID'] ?? '',
    'messagingSenderId': dotenv.env['FIREBASE_MESSAGING_SENDER_ID'] ?? '',
    'projectId': dotenv.env['FIREBASE_PROJECT_ID'] ?? '',
    'storageBucket': dotenv.env['FIREBASE_STORAGE_BUCKET'] ?? '',
  };

  // App-wide constants
  static const String appName = 'Uber Clone';
  static const String appVersion = '1.0.0';
  
  // API endpoints
  static const String baseUrl = 'https://api.example.com';
  
  // Timeouts
  static const int connectionTimeout = 30000;
  static const int receiveTimeout = 30000;
  
  // Cache configuration
  static const int maxCacheAge = 7; // days
  static const int maxCacheSize = 50; // MB
  
  // Map configuration
  static const double defaultLatitude = 37.7749;
  static const double defaultLongitude = -122.4194;
  static const double defaultZoom = 15.0;
} 