import 'package:areadr/layers/blocs/states/auth_states.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<AuthState> {
  User? user = FirebaseAuth.instance.currentUser;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // Initialize Google Sign-In and Firebase Auth
  final GoogleSignIn _googleSignIn = GoogleSignIn(
      // scopes: [
      //   'https://www.googleapis.com/auth/userinfo.profile',
      //   'https://www.googleapis.com/auth/contacts.readonly',
      // ],
      );

  AuthCubit() : super(AuthInitial());

  Future<void> signInWithGoogle(bool isNewLogin) async {
    emit(AuthLoading());
    try {
      // Save the isNewLogin state in SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('newLogin', isNewLogin);

      // Perform the Google sign-in process
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.idToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(authCredential);

        emit(AuthSuccess(uid: userCredential.user!.toString()));
      }

      // Emit the success state with the user UID
    } catch (e) {
      emit(const AuthFailure(error: "Failed to sign in with Google"));
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(const AuthFailure(error: "Failed to sign out"));
    }
  }
}
