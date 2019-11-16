import 'package:enroll_me/app/services/authenticationService.dart';
import 'package:enroll_me/app/ui/pages/createMeetup.dart';
import 'package:enroll_me/app/ui/pages/emailSignInPage.dart';
import 'package:enroll_me/app/ui/pages/emailSignUpPage.dart';
import 'package:enroll_me/app/ui/pages/geekForm.dart';
import 'package:enroll_me/app/ui/pages/homePage.dart';
import 'package:enroll_me/app/ui/pages/loadingPage.dart';
import 'package:enroll_me/app/ui/pages/signUpPage.dart';
import 'package:enroll_me/app/ui/pages/userDetailsView.dart';
import 'package:enroll_me/app/widgets/loadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnrollMe extends StatefulWidget {
  @override
  _EnrollMeState createState() => _EnrollMeState();
}

class _EnrollMeState extends State<EnrollMe> {
  AuthenticationService _authenticationService;

  @override
  void initState() {
    _authenticationService = AuthenticationService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthenticationService>(
            builder: (_) => _authenticationService,
          ),
        ],
        child: MaterialApp(
          title: 'Enroll Me',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.cyan,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData.dark(),
          // home: CreateMeetupPage(),
          initialRoute: '/',
          routes: {
            '/': (context) => LoadingPage(authService: _authenticationService),
            '/signup': (context) => SignUpPage(),
            '/homePage': (context) => HomePage(),
            '/userDetails': (context) => UserDetailsView(),
            '/geekForm': (context) => GeekForm(),
            '/emailPage': (context) => EmailSignInPage(),
            '/emailSignUp': (context) => EmailSignUpPage(),
            '/create' :(context) => CreateMeetupPage()
          },
        ),
      ),
    );
  }
}
