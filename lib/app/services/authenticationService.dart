import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enroll_me/app/models/userDetailsModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/subjects.dart';

enum AuthState {
  Unauthenticated,
  Processing,
  Authenticated,
  SignInWithEmail,
  SignUpWithEmail
}

class AuthenticationService extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  // FirebaseUser _user;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final CollectionReference userDb = FirebaseFirestore.instance.collection('users');

  User _loggedInUser;

  //get current instance of user
  User get loggedInUser => _loggedInUser;

  PublishSubject<AuthState> _authStateSubject = PublishSubject();

  // get current auth state
  PublishSubject<AuthState> get authStateSubject => _authStateSubject;

  // the state should be unauthenticated when the service is initialized by default
  AuthenticationService() {
    _authStateSubject.add(AuthState.Unauthenticated);
  }

  // Check if a user login is already present and auto-authenticate
  Future autoAuthenticateUser() async {
    // Change auth state to processing
    _authStateSubject.add(AuthState.Processing);
    FirebaseUser user = await _auth.currentUser();
    if (user != null) {
      await processFirestoreEntryOfUser(user);
    }
    // Update authState
    updateAuthState();
  }

  Future processFirestoreEntryOfUser(FirebaseUser user) async {
    Map userData;

    // Check if user exists in collection
    QuerySnapshot checkQuery =
        await userDb.where('uid', isEqualTo: user.uid).limit(1).getDocuments();

    final List<DocumentSnapshot> results = checkQuery.documents;

    if (results.length == 1)
      userData = results[0].data;
    else {
      Map<String, dynamic> userDbEntry = {
        'uid': user.uid,
        'name': user.displayName,
        'email': user.email,
        'avatar': user.photoUrl,
        'isEmailVerified': user.isEmailVerified
      };

      DocumentReference entryRef = await userDb.add(userDbEntry);
      DocumentSnapshot docSnap = await entryRef.snapshots().first;
      userData = docSnap.data;
    }

    if (userData['uid'] != null) {
      _loggedInUser = User.fromMap(userData);
      notifyListeners();
    }
  }

  //Email sign in function
  Future signInWithEmail(String email, String password) async {
    try {
      _authStateSubject.add(AuthState.Processing);
      AuthResult result = await (_auth.signInWithEmailAndPassword(
          email: email, password: password));
      FirebaseUser user = result.user;
      print(user.displayName);
      await processFirestoreEntryOfUser(user);
      updateAuthState();
    } catch (e) {
      print("Error Signing in" + e.toString());
      updateAuthState();
    }
  }

  //Email sign up function
  Future signUpWithEmail(String name, String email, String pass) async {
    try {
      _authStateSubject.add(AuthState.Processing);
      FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      ))
          .user;

      print("Signed up: " + user.email);

      UserUpdateInfo userUpdateInfo = UserUpdateInfo();

      userUpdateInfo.displayName = name;
      await user.updateProfile(userUpdateInfo);
      print("After updating the profile: ");
      print(user.displayName);

      await user.reload();
      user = await _auth.currentUser();
      //(referred from https://stackoverflow.com/questions/50986191/flutter-firebase-auth-updateprofile-method-is-not-working)

      print("After reloading the profile: ");
      print(user.displayName);
      // await user.sendEmailVerification();

      // user.isEmailVerified
      //     ?
      await processFirestoreEntryOfUser(user);
      // : print("Email Not verified"); //TODO: Handle the not verified condition

      updateAuthState();
    } catch (e) {
      print("Error Signing in: " + e.toString());
      updateAuthState();
    }
  }

  Future verifyEmail() async {
    FirebaseUser user = await _auth.currentUser();
    await user.sendEmailVerification();
  }

  Future resetPass(String email) async {
    _authStateSubject.add(AuthState.Processing);
    await _auth.sendPasswordResetEmail(email: email);
    updateSubjectToEmailAuth(false);
  }

  // GOOGLE SIGN IN FUNCTION

  Future handleGoogleSignIn() async {
    try {
      _authStateSubject.add(AuthState.Processing);
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

      // Check and add user into firestore users collection
      await processFirestoreEntryOfUser(user);
      updateAuthState();
    } catch (e) {
      print("Error caught: " + e.toString() + " Yes until here");
      updateAuthState();
    }
  }

  Future signOut() async {
    try {
      _authStateSubject.add(AuthState.Processing);

      if (await _googleSignIn.isSignedIn()) _googleSignIn.signOut();
      _auth.signOut();
      _loggedInUser = null;
      updateAuthState();
    } catch (e) {
      print("Error signing out" + e.toString());
      updateAuthState();
    }
  }

  void updateAuthState() {
    // Update Auth state accordingly
    if (_loggedInUser != null)
      _authStateSubject.add(AuthState.Authenticated);
    else
      _authStateSubject.add(AuthState.Unauthenticated);
  }

  void updateSubjectToEmailAuth(bool isSignUp) {
    if (isSignUp) {
      _authStateSubject.add(AuthState.SignUpWithEmail);
    } else {
      _authStateSubject.add(AuthState.SignInWithEmail);
    }
  }
}
