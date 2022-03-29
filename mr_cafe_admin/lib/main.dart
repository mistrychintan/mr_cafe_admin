import 'package:flutter/material.dart';
import 'package:mr_cafe_admin/constant.dart';
import 'package:mr_cafe_admin/screens/splash_screen.dart';
import 'package:mr_cafe_admin/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      initialRoute: SplashScreen.id,
    routes: {
      SplashScreen.id :(context) => SplashScreen(),
      WelcomeScreen.id:(context) => WelcomeScreen(),
    },
    );
  }
}
