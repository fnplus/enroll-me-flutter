import 'package:flutter/material.dart';

class LoadingScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              height: 2.5,
              child: LinearProgressIndicator(
                backgroundColor: Color(0xffd8d4f2),
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff401f3e)),
              ),
            ),
          )),
          SizedBox(height: 20),
          Text(
            "LOADING",
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 3,
                fontSize: 20,
                fontFamily: 'Product-Sans'),
          ),
        ],
      ),
    );
  }
}
