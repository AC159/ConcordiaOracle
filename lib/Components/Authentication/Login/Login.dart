import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';

import '../../../Providers/Authentication/Login/Login.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {

    AuthenticationProvider auth = Provider.of<AuthenticationProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Let's sign you up!")),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton(
                Buttons.GoogleDark,
                onPressed: () async {
                  await auth.signInWithGoogle();
                  Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (route) => false);
                }
              )
            ]
          )
        )
      )
    );
  }
}

