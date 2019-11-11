import 'package:enroll_me/app/services/authenticationService.dart';
import 'package:enroll_me/app/widgets/materialCard.dart';
import 'package:enroll_me/app/widgets/profilePageHeader.dart';
import 'package:enroll_me/app/widgets/profileSettingsCard.dart';
import 'package:enroll_me/app/widgets/scoreCard.dart';
import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';
import 'package:provider/provider.dart';

class UserDetailsView extends StatefulWidget {
  @override
  _UserDetailsViewState createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  @override
  Widget build(BuildContext context) {
    var service = Provider.of<AuthenticationService>(context);
    return Hero(
      tag: "he",
          child: SplitColorBackground(
        topLeftCornerRadius: 20,
        topRightCornerRadius: 20,
        appBar: AppBar(
          title: Text(
            "PROFILE",
            style: TextStyle(letterSpacing: 3),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.pushNamed(context, '/geekForm');
              },
            )
          ],
        ),
        headerColor: Colors.indigo,
        headerFlex: 3,
        bodyFlex: 6,
        header: ProfilePageHeader(user: service.loggedInUser),
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
                  child: ScoreCard(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: MaterialCardWidget(
                  child: ProfileSettingsCard(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}