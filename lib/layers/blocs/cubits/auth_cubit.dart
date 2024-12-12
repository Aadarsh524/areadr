import 'package:areadr/layers/blocs/states/auth_states.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<AuthState> {
  User? user = FirebaseAuth.instance.currentUser;

  FirebaseAuth? _firebaseAuth;
  GoogleSignIn? _googleSignIn;

  AuthCubit() : super(AuthInitial());

  Future<void> signInWithGoogle(bool isNewLogin) async {
    emit(AuthLoading());
    try {
      // Save the isNewLogin state in SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('newLogin', isNewLogin);

      // Perform the Google sign-in process
      final GoogleSignInAccount? googleUser = await _googleSignIn!.signIn();

      // If the user cancels the sign-in
      if (googleUser == null) {
        emit(const AuthFailure(error: "Authentication Error"));
        return;
      }

      // Get authentication details from the Google user
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create credentials using the Google authentication data
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Check if this is a new login or an existing login
      if (isNewLogin) {
        // Logic for handling new user account creation
        // For now, we'll proceed with the usual sign-in process for new users as well.
        // You may add additional actions here (e.g., saving new user data to Firestore or Firebase Database)
      }

      // Sign in with Firebase using the Google credentials
      final userCredential =
          await _firebaseAuth!.signInWithCredential(credential);

      // Emit the success state with the user UID
      emit(AuthSuccess(uid: userCredential.user!.toString()));
    } catch (e) {
      emit(const AuthFailure(error: "Failed to sign in with Google"));
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth!.signOut();
      await _googleSignIn!.signOut();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(const AuthFailure(error: "Failed to sign out"));
    }
  }
}
