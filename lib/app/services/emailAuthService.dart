import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enroll_me/app/ui/pages/signUpPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  final databaseReference = Firestore.instance;

  Future<bool> signIn(String email, String password) async {
    try {
      AuthResult result = await (_auth.signInWithEmailAndPassword(email: email, password: password));
      _user = result.user;
      print(_user.displayName);
          DocumentReference ref =
              await databaseReference.collection("users").add({
            'uid': _user.uid,
            'email': _user.email,
            'name': _user.displayName,
          });
      return true;
    } catch (e) {
      print("Error Signing in" + e.toString());
      return false;
    }
  }

  Future<SignUpPage> signOut() async {
    try{
      _auth.signOut();
      return SignUpPage();
    }catch(e){
      print("Error signing out" + e.toString());
      return null;
    }
  }
}
