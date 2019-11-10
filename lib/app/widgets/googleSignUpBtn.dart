import 'package:enroll_me/app/services/authenticationService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class GoogleSignUpBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _authService = Provider.of<AuthenticationService>(context);
    return GestureDetector(
      onTap: ()  async{
        await _authService.handleGoogleSignIn();
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
