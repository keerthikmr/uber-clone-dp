import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uber_clone/core/config/supabase_config.dart';

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
    SupabaseConfig.client.auth.onAuthStateChange.listen((data) {
      logger.i('Auth state changed: ${data.session?.user.email ?? 'No user'}');
      state = AuthState(user: data.session?.user, isLoading: false);
    });
  }

  Future<void> signInWithGoogle() async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      logger.i('Starting Google Sign In process');

      final response = await SupabaseConfig.client.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: 'uberclone://login-callback/',
      );

      if (!response) {
        logger.w('Google Sign In failed');
        state = state.copyWith(
          isLoading: false,
          error: 'Failed to sign in with Google',
        );
        return;
      }

      logger.i('Google Sign In completed successfully');
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

      await SupabaseConfig.client.auth.signOut();

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
