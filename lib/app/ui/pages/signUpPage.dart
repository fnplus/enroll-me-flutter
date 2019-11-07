import 'package:enroll_me/app/widgets/emailSignUp.dart';
import 'package:enroll_me/app/widgets/fbSignUpBtn.dart';
import 'package:enroll_me/app/widgets/googleSignUpBtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  
  @override
  void initState() {
  
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 3, milliseconds: 5),
      vsync: this,
    );
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    animationController.forward();
  }

  @override
      void dispose() {
        animationController.dispose();
        super.dispose();
      }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 200,
            child: SvgPicture.asset("assets/images/welcome.svg"),
          ),
          FadeTransition(
            opacity:
                animationController.drive(CurveTween(curve: Curves.easeOut)),
            child: Container(
              child: Text(
                "Enroll Me In!",
                style: TextStyle(
                  fontFamily: "Product-Sans",
                  fontSize: 65,
                  color: Color(0xFF424b54),
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Hero(
            tag: "he",
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FBSignUpBtn(),
                SizedBox(
                  height: 20,
                ),

                //TODO: Setup Login Flow Method for all three Buttons
                GoogleSignUpBtn(),
                SizedBox(
                  height: 20,
                ),
                EmailSignUpBtn()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
