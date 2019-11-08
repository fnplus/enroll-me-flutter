import 'package:enroll_me/app/models/userDetailsModel.dart';
import 'package:flutter/material.dart';
class ProfilePageHeader extends StatelessWidget {
  final User user;

  const ProfilePageHeader({Key key, this.user}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        CircleAvatar(
          child: user.avatar!= null ? Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(user.avatar))),
          ): Text(user.name[0].toUpperCase()),
          radius: 40,
          backgroundColor: Colors.yellow,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                user.name,
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
            user.email,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
