import 'package:enroll_me/app/ui/pages/homepage.dart';
import 'package:enroll_me/app/ui/pages/userDetailsView.dart';
import 'package:flutter/material.dart';

class EnrollMe extends StatelessWidget {
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
      initialRoute: '/userDetails',
      routes: {
        '/' : (context) {
          return HomePage();
        },
        '/userDetails' : (context) {
          return UserDetailsView();
        }
      },
    );
  }
}