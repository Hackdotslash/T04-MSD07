// import 'package:Learn1/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
// import 'package:Learn1/google_signin.dart';
import '../HomePage.dart';
import 'email_login.dart';
import 'email_signup.dart';
import 'google_signin.dart';

class SignUp extends StatelessWidget {
  final String title = "Sign Up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
          backgroundColor: Color.fromRGBO(14, 49, 80, 1),
          centerTitle: true,
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Image.asset(
                  "assets/logo.png",
                  width: 137,
                  height: 137,
                )),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Aarogya Care",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'Roboto')),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: SignInButton(
                  Buttons.Email,
                  text: "Sign up with Email",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EmailSignUp()),
                    );
                  },
                )),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: SignInButton(
                Buttons.Google,
                text: "Sign up with Google",
                onPressed: () {
                  signInWithGoogle().then(
                    (result) {
                      if (result != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return HomePage();
                            },
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SizedBox(width: 60),
                    Text("Already have an account?"),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EmailLogIn()),
                        );
                      },
                      child: Text('Login',
                          style: new TextStyle(
                            color: Color.fromRGBO(14, 49, 80, 1),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ))
          ]),
        ));
  }
}
