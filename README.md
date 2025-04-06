# Uber Clone

A modern Uber-like Flutter application with real-time location tracking, Google Maps integration, and Firebase backend.

## Features

- Google Authentication
- Real-time location tracking
- Interactive map interface
- Ride booking system
- Clean and modern UI
- Firebase integration

## Prerequisites

- Flutter SDK (latest stable version)
- Firebase account
- Google Maps API key
- Android Studio / VS Code
- Git

## Setup Instructions

1. Clone the repository:
```bash
git clone https://github.com/yourusername/uber-clone.git
cd uber-clone
```

2. Install dependencies:
```bash
flutter pub get
```

3. Configure Firebase:
   - Create a new Firebase project
   - Enable Authentication (Google Sign-in)
   - Add your Android and iOS apps in Firebase console
   - Download and add the configuration files:
     - Android: `google-services.json` to `android/app/`
     - iOS: `GoogleService-Info.plist` to `ios/Runner/`

4. Set up environment variables:
   - Create a `.env` file in the root directory
   - Add your API keys and Firebase configuration:
```
GOOGLE_MAPS_API_KEY=your_google_maps_api_key_here
FIREBASE_API_KEY=your_firebase_api_key_here
FIREBASE_APP_ID=your_firebase_app_id_here
FIREBASE_MESSAGING_SENDER_ID=your_firebase_messaging_sender_id_here
FIREBASE_PROJECT_ID=your_firebase_project_id_here
FIREBASE_STORAGE_BUCKET=your_firebase_storage_bucket_here
```

5. Generate required files:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

6. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── core/
│   ├── config/
│   ├── theme/
│   ├── utils/
│   └── widgets/
├── features/
│   ├── auth/
│   ├── booking/
│   └── driver/
└── shared/
    ├── models/
    ├── services/
    └── widgets/
```

## Architecture

This project follows clean architecture principles and is organized into features:

- **Core**: Contains application-wide configurations, themes, and utilities
- **Features**: Contains feature-specific code (auth, booking, driver)
- **Shared**: Contains shared models, services, and widgets

## State Management

The app uses Riverpod for state management, providing:

- Dependency injection
- State management
- Side effects handling
- Testability

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
