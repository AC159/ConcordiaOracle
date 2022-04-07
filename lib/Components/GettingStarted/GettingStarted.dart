import 'dart:async';
import 'package:concordia_oracle/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import '../../Providers/Authentication/Login/Login.dart';


class GettingStarted extends StatefulWidget {
  const GettingStarted({Key? key}) : super(key: key);

  @override
  _GettingStartedState createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {

  @override
  Widget build(BuildContext context) {

    AuthenticationProvider auth = Provider.of<AuthenticationProvider>(context);

    void showAlertDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(content: LinearProgressIndicator());
        });
    }

    void _launchURL(String url) async {
      if (!await launch(url)) throw 'Could not launch $url';
    }

    return Scaffold(
      body: Container(
        color: LIGHT_BLUE,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/images/concordia-oracle-logo-dark.png")),
            Column(
              children: [
                Text('Welcome to Concordia Oracle!', style: TextStyle(fontSize: 20, color: ALMOST_BLACK)),
                Text('Glad to see you back!', style: TextStyle(fontSize: 18, color: LIGHT_GREY))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SignInButton(
                    Buttons.GoogleDark,
                    onPressed: () async {
                      showAlertDialog(context);
                      await auth.signInWithGoogle();
                      Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (route) => false);
                    }
                ),
                SignInButton(
                    Buttons.Facebook,
                    onPressed: () async {
                      showAlertDialog(context);
                      Timer(Duration(seconds: 3), () => Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (route) => false));
                    }
                ),
                SignInButton(
                    Buttons.AppleDark,
                    onPressed: () async {
                      showAlertDialog(context);
                      Timer(Duration(seconds: 3), () => Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (route) => false));
                    }
                )
              ]
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                      text: TextSpan(
                          children: [
                            TextSpan(text: 'By signing in you agree to Concordia Oracle\'s ', style: TextStyle(color: ALMOST_BLACK, fontSize: 16)),
                            TextSpan(
                                text: 'terms of service',
                                style: TextStyle(color: Colors.lightBlue, fontSize: 16),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  String url = "https://www.websitepolicies.com/blog/privacy-policy-url-terms-service-url-facebook-app";
                                  _launchURL(url);
                                }
                            ),
                            TextSpan(text: ' and ', style: TextStyle(color: ALMOST_BLACK, fontSize: 16)),
                            TextSpan(
                                text: 'privacy policy',
                                style: TextStyle(color: Colors.lightBlue, fontSize: 16),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  String url = "https://www.freeprivacypolicy.com/blog/privacy-policy-url/";
                                  _launchURL(url);
                                }
                            )
                          ]
                      )
                  ),
                )
              ],
            )
          ]
        )
      )
    );
  }
}

