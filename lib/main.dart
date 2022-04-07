import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'Providers/Authentication/Login/Login.dart';
import 'Routes/router.dart';

const Color LIGHT_BLUE = Color(0xffB7E8FF);
const Color ALMOST_BLACK = Color(0xff222121);
const Color LIGHT_GREY = Color(0xff434343);

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
        }
      )
  );
}
