import 'package:enroll_me/app/ui/pages/signUpPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthenticationService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;

      print("Signed In " + user.displayName);

      return user;
    } catch (e) {
      print("Error caught: " +e.toString() + " Yes until here");
      return null;
    }
  }

  Future<SignUpPage> handleGoogleSignOut() async{
    await FirebaseAuth.instance.signOut();
    await _googleSignIn.signOut();
    return SignUpPage();
    //code reference from https://stackoverflow.com/questions/45079459/how-to-signout-a-user-in-flutter-with-firebase-authentication

  }
}
