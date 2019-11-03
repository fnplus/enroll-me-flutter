import 'package:enroll_me/app/ui/pages/geekForm.dart';
import 'package:enroll_me/app/ui/pages/homePage.dart';
import 'package:enroll_me/app/ui/pages/loadingPage.dart';
import 'package:enroll_me/app/ui/pages/signUpPage.dart';
import 'package:enroll_me/app/ui/pages/userDetailsView.dart';
import 'package:flutter/material.dart';

class EnrollMe extends StatefulWidget {
  @override
  _EnrollMeState createState() => _EnrollMeState();
}

class _EnrollMeState extends State<EnrollMe> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enroll Me',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) {
          return LoadingPage();
        },
        '/signup': (context) {
          return SignUpPage();
        },
        'homePage': (context) {
          return HomePage();
        },
        '/userDetails': (context) {
          return UserDetailsView();
        },
        '/geekForm': (context) {
          return GeekForm();
        },
      },
    );
  }
}
