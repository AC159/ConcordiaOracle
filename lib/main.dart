import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'Providers/Authentication/Login/Login.dart';
import 'Routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthenticationProvider>(create: (_) => new AuthenticationProvider())
          ],
        builder: (context, child) {
            return new MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              onGenerateRoute: Routes.generateRoute,
            );
        },
      )
  );
}
