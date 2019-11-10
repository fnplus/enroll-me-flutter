import 'package:enroll_me/app/services/authenticationService.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _authService = Provider.of<AuthenticationService>(context);
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            onDetailsPressed: () {
              //TODO: Navigate to page where user can update their details
            },
            decoration: BoxDecoration(color: Color(0xFF424b54)),
            currentAccountPicture: CircleAvatar(
              child: Container(
                child: _authService.loggedInUser.avatar != null
                    ? Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    _authService.loggedInUser.avatar),
                                fit: BoxFit.fill)),
                      )
                    : Text(_authService.loggedInUser.name[0].toUpperCase()),
              ),
            ),
            accountEmail: Text(
              _authService.loggedInUser.email,
              style: TextStyle(fontSize: 16),
            ),
            accountName: Text(
              _authService.loggedInUser.name != null
                  ? _authService.loggedInUser.name
                  : "User ",
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
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: Text("Sign out"),
                              content:
                                  Text("Are you sure you want to sign out?"),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                FlatButton(
                                  child: Text("Yes"),
                                  onPressed: () {
                                    _authService.signOut();
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ));
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
