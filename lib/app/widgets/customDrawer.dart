import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF424b54)),
            currentAccountPicture: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://avatars3.githubusercontent.com/u/32771322?s=460&v=4",
                    ),
                  )),
            ),
            accountEmail: Text(
              "singhalpratik037@gmail.com",
              style: TextStyle(fontSize: 16),
            ),
            accountName: Text(
              "Pratik Singhal",
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