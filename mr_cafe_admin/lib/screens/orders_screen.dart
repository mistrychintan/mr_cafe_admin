import 'package:flutter/material.dart';
import 'package:mr_cafe_admin/constant.dart';
import 'package:mr_cafe_admin/screens/drawer_screen.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);
  static const String id = 'orders';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order's"),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: Icon(
                Icons.menu,
              ));
        }),
      ),
      drawer: DrawerPage(),
    );
  }
}
