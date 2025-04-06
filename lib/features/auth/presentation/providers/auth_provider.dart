import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:logger/logger.dart';

part 'auth_provider.g.dart';

final logger = Logger();

@riverpod
class Auth extends _$Auth {
  @override
  AuthState build() {
    _setupAuthStateListener();
    return const AuthState();
  }

  void _setupAuthStateListener() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      logger.i('Auth state changed: ${user?.email ?? 'No user'}');
      state = AuthState(user: user, isLoading: false);
    });
  }

  Future<void> signInWithGoogle() async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      logger.i('Starting Google Sign In process');

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      logger.i(
          'Google Sign In completed: ${googleUser?.email ?? 'No user selected'}');

      if (googleUser == null) {
        logger.w('Google Sign In cancelled by user');
        state = state.copyWith(isLoading: false);
        return;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      logger.i('Got Google auth tokens');

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      logger.i('Firebase auth completed: ${userCredential.user?.email}');
    } catch (e) {
      logger.e('Error during Google Sign In: $e');
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> signOut() async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      logger.i('Starting sign out process');

      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();

      logger.i('Sign out completed successfully');
    } catch (e) {
      logger.e('Error during sign out: $e');
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}

class AuthState {
  final User? user;
  final bool isLoading;
  final String? error;

  const AuthState({
    this.user,
    this.isLoading = false,
    this.error,
  });

  AuthState copyWith({
    User? user,
    bool? isLoading,
    String? error,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
