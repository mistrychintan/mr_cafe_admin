import 'package:flutter/material.dart';
import 'package:mr_cafe_admin/constant.dart';
import 'package:mr_cafe_admin/screens/drawer_screen.dart';

import 'package:mr_cafe_admin/screens/new_order_screen.dart';

import 'package:mr_cafe_admin/screens/ongoing_order_screen.dart';
import 'package:mr_cafe_admin/screens/past_order_screen.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);
  static const String id = 'orders';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: kDarkColor,
              indicatorColor: kDarkColor,
              tabs: [
                Tab(
                  text: "New Order",
                ),
                Tab(
                  text: "Ongoing Order",
                ),
                Tab(
                  text: "Past Orders",
                ),
              ]),
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
        body: const TabBarView(children: [
          NewOrderScreen(),
          OngoingOrderScreen(),
          PastOrderScreen()
        ]),
      ),
    );
  }
}
