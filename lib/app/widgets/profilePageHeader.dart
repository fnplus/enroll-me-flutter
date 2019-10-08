import 'package:flutter/material.dart';
class ProfilePageHeader extends StatelessWidget {
  const ProfilePageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
