import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enroll_me/app/services/googleAuthenticationService.dart';
import 'package:enroll_me/app/ui/pages/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoogleSignUpBtn extends StatelessWidget {
  final databaseReference = Firestore.instance;
  FirebaseUser user;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final gAuth = Provider.of<GoogleAuthenticationService>(context);

        FirebaseUser result = await gAuth.handleGoogleSignIn();

        if (result == null) {
          print("Error Signing in. Try again");
        } else {
          print("User receieved: " + result.displayName);
          user = result;
          DocumentReference ref =
              await databaseReference.collection("users").add({
            'uid': result.uid,
            'email': result.email,
            'name': result.displayName,
          }).then((_) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePage(
                  user: user,
                ),
              ),
            );
          });
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.70,
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
            color: Colors.blue[600], borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://images.theconversation.com/files/93616/original/image-20150902-6700-t2axrz.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1000&fit=clip",
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "Sign up with Google",
                style: TextStyle(
                    fontFamily: "Product-Sans",
                    color: Colors.white,
                    fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
