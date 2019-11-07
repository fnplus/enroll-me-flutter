import 'package:enroll_me/app/services/emailAuthService.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmailSignUpBtn extends StatelessWidget {
  final String email,password;
  const EmailSignUpBtn({Key key, this.email, this.password}) : super(key: key);
  final bool signIn = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/emailPage');
      //   if(await EmailAuthService().signIn(email, password)){
          
      //   }
      //   else{
      //     Navigator.pop(context);
      //   }
        
      // },
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.70,
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
            color: Color(0xFF401f3e), borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.mailBulk,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "Sign up with Email",
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
