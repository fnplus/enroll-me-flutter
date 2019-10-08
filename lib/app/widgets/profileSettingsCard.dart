import 'package:flutter/material.dart';
class ProfileSettingsCard extends StatelessWidget {
  const ProfileSettingsCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}