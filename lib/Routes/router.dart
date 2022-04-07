import 'package:concordia_oracle/Components/GettingStarted/GettingStartedRedirect.dart';
import 'package:concordia_oracle/Components/HomePage.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments while calling Navigator.pushNamed
    final args = settings.arguments;

    if (settings.name == '/') {
      return new MaterialPageRoute(builder: (context) => GettingStartedRedirect());
    }
    else if (settings.name == '/homepage') {
      return new MaterialPageRoute(builder: (context) => HomePage());
    }
    else {
      return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return new MaterialPageRoute(builder: (context) => Scaffold(
        appBar: AppBar(title: Text('Sorry, an error occurred')),
        body: Center(
            child: Text(
                "404",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                )
            )
        )));
  }

}
