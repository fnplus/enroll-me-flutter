import 'package:enroll_me/app/widgets/customDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateMeetupPage extends StatefulWidget {
  @override
  _CreateMeetupPageState createState() => _CreateMeetupPageState();
}

class _CreateMeetupPageState extends State<CreateMeetupPage> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'create',
      child: Scaffold(
        // drawer: CustomDrawer(),
        appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: Colors.yellow,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Create Meetup",
            style: TextStyle(
                // color: Color(0xFF424b54),
                color: Colors.black,
                fontSize: 25,
                letterSpacing: 5),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    ClipPath(
                      clipper: WaveClipperTwo(),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.31,
                        color: Colors.yellow,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      alignment: Alignment.topCenter,
                      // color: Colors.yellow,
                      child:
                          SvgPicture.asset("assets/images/create-meetup.svg"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
