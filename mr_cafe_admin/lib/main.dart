import 'package:flutter/material.dart';
import 'package:mr_cafe_admin/constant.dart';
import 'package:mr_cafe_admin/screens/add_category_screen.dart';
import 'package:mr_cafe_admin/screens/add_menu_item.dart';
import 'package:mr_cafe_admin/screens/offers_screen.dart';
import 'package:mr_cafe_admin/screens/menu_screen.dart';
import 'package:mr_cafe_admin/screens/orders_screen.dart';
import 'package:mr_cafe_admin/screens/setting_screen.dart';
import 'package:mr_cafe_admin/screens/splash_screen.dart';
import 'package:mr_cafe_admin/screens/welcome_screen.dart';

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
        appBarTheme: AppBarTheme(
            backgroundColor: kDarkColor,
            elevation: 0.0,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.white)),
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        OfferScreen.id: (context) => OfferScreen(),
        OrdersPage.id: (context) => OrdersPage(),
        MenuPage.id: (context) => MenuPage(),
        SettingPage.id: (context) => SettingPage(),
        AddCategory.id: (context) => AddCategory(),
        AddMenuItem.id: (context) => AddMenuItem(),
      },
    );
  }
}
