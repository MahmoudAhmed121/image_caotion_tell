import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../main_screen/main_screen.dart';

class Auth {
  Auth._();
  final User? user = FirebaseAuth.instance.currentUser;
  static final Auth _instant = Auth._();
  static Auth get instant => _instant;

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    Get.off(MainScreen(),
        duration: Duration(seconds: 2), transition: Transition.fade);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
