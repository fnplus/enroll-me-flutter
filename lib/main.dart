import 'package:enroll_me/app/enrollme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  initializeDefault();
  runApp(EnrollMe());
}

Future<void> initializeDefault() async {
  FirebaseApp app = await Firebase.initializeApp();
}
