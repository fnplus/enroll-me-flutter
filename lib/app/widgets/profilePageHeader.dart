import 'package:enroll_me/app/models/userDetailsModel.dart';
import 'package:enroll_me/app/services/authenticationService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePageHeader extends StatelessWidget {
  final User user;

  const ProfilePageHeader({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _auth = Provider.of<AuthenticationService>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        CircleAvatar(
          child: user.avatar != null
              ? Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(user.avatar),
                    ),
                  ),
                )
              : Text(user.name[0].toUpperCase()),
          radius: 55,
          backgroundColor: Colors.yellow,
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            user.name,
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
        ),
        EmailRow(auth: _auth, user: user),
      ],
    );
  }
}

class EmailRow extends StatelessWidget {
  const EmailRow({
    Key key,
    @required AuthenticationService auth,
    @required this.user,
  })  : _auth = auth,
        super(key: key);

  final AuthenticationService _auth;
  final User user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        bool result = await _auth.verifyEmail();
        result
            ? Scaffold.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                content: Row(
                  children: <Widget>[
                    Icon(Icons.done),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Verification Email Sent Successfully to " + user.email,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ))
            : Scaffold.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Row(
                  children: <Widget>[
                    Icon(Icons.not_interested),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Cannot Send Email to " + user.email,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              user.email,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          if (user.isEmailVerified)
            CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(
                Icons.done,
                size: 15,
              ),
              radius: 10,
            )
          else
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.warning,
                color: Colors.black,
                size: 12,
              ),
              radius: 12,
            )
        ],
      ),
    );
  }
}
