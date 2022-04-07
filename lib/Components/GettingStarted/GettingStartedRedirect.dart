import 'package:concordia_oracle/Components/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/Authentication/Login/Login.dart';
import 'GettingStarted.dart';


class GettingStartedRedirect extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AuthenticationProvider auth = Provider.of<AuthenticationProvider>(context);
    if (auth.currentUser != null) {
      return HomePage();
    } else {
      return GettingStarted();
    }
  }
}

