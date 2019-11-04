import 'package:enroll_me/app/services/googleAuthenticationService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

enum Status { Uninitialised, Authenticated, Authenticating, Unauthenticated }

class UserRepository extends ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialised;
  final GoogleAuthenticationService gAuth = GoogleAuthenticationService();

  UserRepository.instance() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onAuthStateChanged);
  }
  
  Status get staus => _status;
  FirebaseUser get user => _user;

  Future<bool> gSignIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await gAuth.handleGoogleSignIn();
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }


  // copied from https://medium.com/flutter-community/flutter-firebase-login-using-provider-package-54ee4e5083c7
  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onAuthStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
    }
    notifyListeners();
  }
}
