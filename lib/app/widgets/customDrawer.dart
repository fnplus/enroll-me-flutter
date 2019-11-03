import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class CustomDrawer extends StatelessWidget {
  final FirebaseUser user;

  const CustomDrawer({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF424b54)),
            currentAccountPicture: CircleAvatar(child: Image.network(user.photoUrl),),
            accountEmail: Text(
              user.email,
              style: TextStyle(fontSize: 16),
            ),
            accountName: Text(
              user.displayName,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(FontAwesomeIcons.peopleCarry),
                  title: Text(
                    "Meetups Planned",
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.group_work),
                  title: Text(
                    "Create a Meetup",
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.group_add),
                  title: Text(
                    "Join a Meetup",
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.signOutAlt),
                  title: Text(
                    "Sign Out",
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}