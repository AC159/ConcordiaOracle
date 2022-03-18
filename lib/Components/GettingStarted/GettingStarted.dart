import 'package:flutter/material.dart';

class GettingStarted extends StatefulWidget {
  const GettingStarted({Key? key}) : super(key: key);

  @override
  _GettingStartedState createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                child: Image(image: AssetImage('assets/images/back_to_school_banner.png')),
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)
                            )
                        ),
                        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18)),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor)
                    ),
                    child: Text('Sign up'),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/login');
                    },
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Have an account? ',
                        style: TextStyle(
                            fontSize: 18
                        ),
                      ),
                      TextButton(
                        child: Text('Login', style: TextStyle(fontSize: 18)),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/login');
                        }
                      )
                    ]
                )
              ]
            )
          ]
        )
      )
    );
  }
}

