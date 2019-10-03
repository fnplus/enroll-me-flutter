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
      headerColor: Colors.indigo,
      headerFlex: 2,
      bodyFlex: 5,
      header: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
            child: Text(
              "P",
              style: TextStyle(fontSize: 25),
            ),
            radius: 40,
            backgroundColor: Colors.lightGreenAccent,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Pratik Singhal",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ), //will be replaced by name of geek
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "singhalpratik037@gmail.com",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Center(
              child: Material(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              child: Column(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Profile Settings",
                        style: TextStyle(fontSize: 25, letterSpacing: 2),
                      ),
                    ),
                  ),
                  Divider(
                    endIndent: 40,
                    indent: 40,
                    color: Colors.black,
                  ),
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Verified",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Edit Profile",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Change Password",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Delete Account",
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
              height: 300,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          )),
        ],
      ),
    );
  }
}
