import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GithubBtn extends StatelessWidget {
  const GithubBtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, 'homePage');
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.10,
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
            color: Color(0xFF211F1F), borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.github,
              color: Colors.white,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(4.0),
            //   child: Text(
            //     "Continue with Github",
            //     style: TextStyle(
            //         fontFamily: "Product-Sans",
            //         color: Colors.white,
            //         fontSize: 18),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
