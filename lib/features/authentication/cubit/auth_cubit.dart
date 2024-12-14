import 'package:areadr/features/authentication/cubit/auth_states.dart';
import 'package:areadr/features/authentication/services/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;

  // Pass AuthService as a dependency
  AuthCubit({AuthService? authService})
      : _authService = authService ?? AuthService(), // Default instance
        super(AuthInitial());

  /// Sign in with Google
  Future<void> signInWithGoogle(bool isNewLogin) async {
    emit(AuthLoading());
    try {
      final UserCredential? userCredential =
          await _authService.signInWithGoogle(isNewLogin);

      if (userCredential != null) {
        emit(AuthSuccess(uid: userCredential.user!.uid));
      } else {
        emit(const AuthFailure(error: "Google Sign-In was cancelled"));
      }
    } catch (e) {
      emit(const AuthFailure(error: "Failed to sign in with Google"));
    }
  }

  /// Sign out user
  Future<void> signOut() async {
    try {
      await _authService.signOut();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(const AuthFailure(error: "Failed to sign out"));
    }
  }
}
