import 'package:areadr/layers/blocs/states/auth_states.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthCubit extends Cubit<AuthState> {
  User? user = FirebaseAuth.instance.currentUser;

  FirebaseAuth? _firebaseAuth;
  GoogleSignIn? _googleSignIn;

  AuthCubit() : super(AuthInitial());

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn!.signIn();
      if (googleUser == null) {
        emit(const AuthFailure(error: "Authentication Error"));
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await _firebaseAuth!.signInWithCredential(credential);

      emit(AuthSuccess(uid: userCredential.user!.toString()));
    } catch (e) {
      emit(
          AuthFailure(error: "Failed to sign in with Google: ${e.toString()}"));
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth!.signOut();
      await _googleSignIn!.signOut();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthFailure(error: "Failed to sign out: ${e.toString()}"));
    }
  }
}
