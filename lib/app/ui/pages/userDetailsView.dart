import 'package:enroll_me/app/widgets/materialCard.dart';
import 'package:enroll_me/app/widgets/profileSettingsCard.dart';
import 'package:enroll_me/app/widgets/scoreCard.dart';
import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';

class UserDetailsView extends StatefulWidget {
  @override
  _UserDetailsViewState createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  @override
  Widget build(BuildContext context) {
    return SplitColorBackground(
      topLeftCornerRadius: 20,
      topRightCornerRadius: 20,
      appBar: AppBar(
        title: Text(
          "PROFILE",
          style: TextStyle(letterSpacing: 3),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          )
        ],
      ),
      headerColor: Colors.indigo,
      headerFlex: 2,
      bodyFlex: 5,
      header: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          CircleAvatar(
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://avatars3.githubusercontent.com/u/32771322?s=460&v=4"))),
            ),
            radius: 40,
            backgroundColor: Colors.yellow,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Pratik Singhal",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.done,
                  size: 15,
                ),
                radius: 10,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "singhalpratik037@gmail.com",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
//***************************************** */
      //BODY STARTS HERE
//***************************************** */
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Center(
              child: MaterialCardWidget(
                child: ProfileSettingsCard(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: MaterialCardWidget(
                child: ScoreCard(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
