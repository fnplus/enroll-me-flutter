import 'package:enroll_me/app/widgets/customCard.dart';
import 'package:enroll_me/app/widgets/customDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.45;
    double height = MediaQuery.of(context).size.width * 0.50;
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "MEET UP",
          style: TextStyle(
            // color: Color(0xFF424b54), 
            color: Colors.white,
            fontSize: 25,
            letterSpacing: 5),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.graduationCap),
            // color: Color(0xFF424b54),
            onPressed: () {
              Navigator.of(context).pushNamed("/userDetails");
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ClipPath(
                    clipper: WaveClipperTwo(),
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.30,
                        color: Colors.cyan),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: SvgPicture.asset("assets/images/homepage.svg"),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                CustomCard(
                  height: height,
                  width: width,
                  code: 0xFFfcd0a1,
                  isDark: false,
                  text: "Meetups Planned",
                  imageName: 'teamwork.svg',
                  routeName: null,
                  heroTag: 'planned',
                ),
                CustomCard(
                  code: 0xFF0b3c49,
                  height: height,
                  isDark: true,
                  text: "Create Meetups",
                  width: width,
                  imageName: 'create-meetup.svg',
                  routeName: '/create',
                  heroTag: 'create',
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomCard(
                  code: 0xFF401f3e,
                  height: height,
                  isDark: true,
                  text: "Join Meetups",
                  width: width,
                  imageName: 'teamwork.svg',
                  routeName: null,
                  heroTag: 'join',
                ),
                CustomCard(
                  code: 0xFFd8d4f2,
                  height: height,
                  isDark: false,
                  text: "Something",
                  width: width,
                  imageName: 'card.svg',
                  routeName: null,
                  heroTag: 'something',
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ],
        ),
      ),
    );
  }
}
