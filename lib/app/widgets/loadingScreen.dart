import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class LoadingScreenWidget extends StatefulWidget {
  @override
  _LoadingScreenWidgetState createState() => _LoadingScreenWidgetState();
}

class _LoadingScreenWidgetState extends State<LoadingScreenWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfcd0a1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SpinKitFoldingCube(
                controller: AnimationController(
                    vsync: this, duration: const Duration(milliseconds: 1200)),
                color: Color(0xff401f3e),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "LOADING",
            style: TextStyle(
                color: Color(0xFF0b3c49),
                letterSpacing: 3,
                fontSize: 20,
                fontFamily: 'Product-Sans'),
          ),
        ],
      ),
    );
  }
}