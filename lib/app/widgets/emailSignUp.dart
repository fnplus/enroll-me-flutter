import 'package:enroll_me/app/services/authenticationService.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class EmailSignUpBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var service = Provider.of<AuthenticationService>(context);
    return GestureDetector(
      onTap: () {
        service.updateSubjectToEmailAuth(false);
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
                "Sign in with Email",
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
