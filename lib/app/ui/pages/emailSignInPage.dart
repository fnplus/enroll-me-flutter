import 'package:enroll_me/app/services/authenticationService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class EmailSignInPage extends StatefulWidget {
  @override
  _EmailSignInPageState createState() => _EmailSignInPageState();
}

class _EmailSignInPageState extends State<EmailSignInPage> {
  TextEditingController _email = TextEditingController();

  TextEditingController _pass = TextEditingController();

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<AuthenticationService>(context);
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
              child: new LoginBtn(
                  email: _email, pass: _pass, authService: authService),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              child: Text("New User? Sign up", style: TextStyle(fontSize: 18)),
              onTap: () async {
                authService.updateSubjectToEmailAuth(true);
              },
            ),
            SizedBox(
              height: 20,
            ),
            new ForgotPass(email: _email, authService: authService)
          ],
        ),
      ),
    );
  }
}

//LOGIN BUTTON
class LoginBtn extends StatelessWidget {
  const LoginBtn({
    Key key,
    @required TextEditingController email,
    @required TextEditingController pass,
    @required this.authService,
  })  : _email = email,
        _pass = pass,
        super(key: key);

  final TextEditingController _email;
  final TextEditingController _pass;
  final AuthenticationService authService;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      onPressed: () async {
        print("Email " + _email.text);
        print("Password " + _pass.text);
        if (_email.text.isNotEmpty && _pass.text.isNotEmpty) {
          await authService.signInWithEmail(_email.text, _pass.text);
        } 
        else if (_email.text.isEmpty && _pass.text.isEmpty) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Enter valid Email and Password"),
          ));
        } 
        else if (_email.text.isEmpty) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Please enter a valid Email ID"),
          ));
        } 
        else if (_pass.text.isEmpty) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Password cannot be empty"),
          ));
        }
      },
      elevation: 3,
      child: Text(
        "Login",
        style: TextStyle(color: Colors.white),
      ),
      color: Color(0xFF401f3e),
    );
  }
}

// FOGOT PASSWORD BUTTON
class ForgotPass extends StatelessWidget {
  const ForgotPass({
    Key key,
    @required TextEditingController email,
    @required this.authService,
  })  : _email = email,
        super(key: key);

  final TextEditingController _email;
  final AuthenticationService authService;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        "Forgot Password?",
        style: TextStyle(fontSize: 18),
      ),
      onTap: () async {
        if (_email.text.isNotEmpty) {
          await authService.resetPass(_email.text);
        } else {
          // Show snackbar if email field is not filled
          Scaffold.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.warning),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Please fill the Email ID",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
            duration: Duration(seconds: 3),
          ));
        }
      },
    );
  }
}

// REFACTORED TEXT FIELD FOR INPUT
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
