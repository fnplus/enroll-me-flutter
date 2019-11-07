import 'package:enroll_me/app/services/emailAuthService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmailSignInPage extends StatefulWidget {
  @override
  _EmailSignInPageState createState() => _EmailSignInPageState();
}

class _EmailSignInPageState extends State<EmailSignInPage> {
  TextEditingController _email = TextEditingController();

  TextEditingController _pass = TextEditingController();
  EmailAuthService _eAuth;

  @override
  void initState() { 
    _eAuth = EmailAuthService();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("EMAIL LOGIN",
            style: TextStyle(
              color: Color(0xFF424b54),
              letterSpacing: 5,
              fontSize: 25,
            )),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: SvgPicture.asset("assets/images/emailLogin.svg")),
            DataField(
              heading: 'Email',
              icon: Icons.email,
              controller: _email,
            ),
            DataField(
              heading: 'Password',
              icon: Icons.vpn_key,
              controller: _pass,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: RaisedButton(
                onPressed: () async {
                  print("Email " + _email.text);
                  print("Password " + _pass.text);
                  try {
                    bool result = await _eAuth.signIn(_email.text, _pass.text);
                    print(result);
                    if (result) {
                      print("Registered");
                    }
                  } catch (e) {
                    print("Error " + e.toString());
                  }
                },
                elevation: 3,
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
                color: Color(0xFF401f3e),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataField extends StatelessWidget {
  final String heading;
  final IconData icon;
  final TextEditingController controller;

  const DataField({Key key, this.heading, this.icon, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        obscureText: heading == "Password" ? true : false,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              gapPadding: 20,
              borderSide: BorderSide(
                color: Color(0xFF401f3e),
              ),
              borderRadius: BorderRadius.circular(20)),
          labelText: heading,
          labelStyle: TextStyle(color: Color(0xFF401f3e), fontSize: 18),
          alignLabelWithHint: true,
          prefixIcon: Icon(
            icon,
            color: Color(0xFF401f3e),
          ),
          border: OutlineInputBorder(
            gapPadding: 20,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
