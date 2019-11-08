import 'package:enroll_me/app/services/authenticationService.dart';
import 'package:enroll_me/app/ui/pages/emailSignInPage.dart';
import 'package:enroll_me/app/ui/pages/emailSignUpPage.dart';
import 'package:enroll_me/app/ui/pages/homePage.dart';
import 'package:enroll_me/app/ui/pages/signUpPage.dart';
import 'package:enroll_me/app/widgets/loadingScreen.dart';
import 'package:flutter/material.dart';


//this page is to verify the auth state of the user and then open the appropriate screen.
//loading screen widget has the loading indicator which is displayed.
class LoadingPage extends StatefulWidget {
  final AuthenticationService authService;

  const LoadingPage({Key key, this.authService}) : super(key: key);
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Widget viewWidget = LoadingScreenWidget();
  AuthenticationService _authService;
  @override
  void initState() {
    _authService = this.widget.authService;
    super.initState();
    if(mounted){
      _authService.authStateSubject.listen((AuthState authState){
        print(authState);
        if(authState == AuthState.Unauthenticated){
          setState(() {
            viewWidget = SignUpPage();
          });
        }else if(authState == AuthState.Processing){
          setState(() {
            viewWidget = LoadingScreenWidget();
          });
        } else if(authState == AuthState.SignUpWithEmail){
          setState(() {
            viewWidget= EmailSignUpPage();
          });
        } else if(authState == AuthState.SignInWithEmail){
          setState(() {
            viewWidget= EmailSignInPage();
          });
        }
        else{
          setState(() {
            viewWidget = HomePage();
          });
        }
      });

    }

    _authService.autoAuthenticateUser();
  }

  @override
  void dispose() {
    super.dispose();
    _authService.authStateSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return viewWidget;
  }
}
