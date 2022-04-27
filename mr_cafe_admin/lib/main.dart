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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: kBackgroundColor,
          appBarTheme: AppBarTheme(
              backgroundColor: kBackgroundColor,
              elevation: 0,
              toolbarHeight: 60,
              centerTitle: true,
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
              iconTheme: IconThemeData(color: Colors.black, size: 25)),
          buttonTheme: ButtonThemeData(buttonColor: Color(0xFFD4A056))),
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
