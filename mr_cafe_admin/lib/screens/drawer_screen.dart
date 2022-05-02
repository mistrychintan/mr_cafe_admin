import 'package:flutter/material.dart';
import 'package:mr_cafe_admin/constant.dart';
import 'package:mr_cafe_admin/screens/menu_screen.dart';
import 'package:mr_cafe_admin/screens/offers_screen.dart';
import 'package:mr_cafe_admin/screens/setting_screen.dart';

import 'package:mr_cafe_admin/widget/drawer_list.dart';

import 'orders_screen.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: kBackgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/prifile.png'),
                  ),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(width: 1, color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1, color: Colors.black54, spreadRadius: 2)
                  ],
                ),
              ),
            ),
            Text(
              'Chintan Mistry',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * .06,
              ),
            ),
            divider,
            DrawerList(
              icon: Icons.app_registration_outlined,
              title: 'All Orders',
              onpress: () {
                Navigator.pushReplacementNamed(context, OrdersPage.id);
              },
            ),
            divider,
            DrawerList(
              icon: Icons.list_alt,
              title: 'Menu',
              onpress: () {
                Navigator.pushReplacementNamed(context, MenuPage.id);
              },
            ),
            divider,
            DrawerList(
              icon: Icons.local_offer_outlined,
              title: 'Daily Offers',
              onpress: () {
                Navigator.pushReplacementNamed(
                  context,
                  OfferScreen.id,
                );
              },
            ),
            divider,
            DrawerList(
              icon: Icons.settings,
              title: 'Setting',
              onpress: () {
                Navigator.pushReplacementNamed(context, SettingPage.id);
              },
            ),
          ],
        )
        // child: Container(
        //   width: MediaQuery.of(context).size.width * .7,
        //   color: kBackgroundColor,
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       SizedBox(
        //         height: MediaQuery.of(context).size.height * .04,
        //       ),
        //       Container(
        //         decoration: BoxDecoration(
        //           shape: BoxShape.circle,
        //           color: Colors.white,
        //           border: Border.all(width: 1, color: Colors.white),
        //           boxShadow: [
        //             BoxShadow(
        //                 blurRadius: 1, color: Colors.black54, spreadRadius: 2)
        //           ],
        //         ),
        //         child: CircleAvatar(
        //           backgroundImage: AssetImage('assets/prifile.png'),
        //           backgroundColor: kBackgroundColor,
        //           radius: MediaQuery.of(context).size.width * 0.2,
        //         ),
        //       ),
        //       // SizedBox(
        //       //   height: MediaQuery.of(context).size.height * 0.03,
        //       // ),
        //       Text(
        //         'Chintan Mistry',
        //         style:
        //             TextStyle(fontSize: MediaQuery.of(context).size.width * .06),
        //       ),
        //       // SizedBox(
        //       //   height: MediaQuery.of(context).size.height * 0.08,
        //       // ),
        //       divider,
        //       DrawerList(
        //         icon: Icons.app_registration_outlined,
        //         title: 'All Orders',
        //         onpress: () {
        //           Navigator.pushNamed(context, OrdersPage.id);
        //         },
        //       ),
        //       divider,
        //       DrawerList(
        //         icon: Icons.list_alt,
        //         title: 'Menu',
        //         onpress: () {
        //           Navigator.pushNamed(context, OrdersPage.id);
        //         },
        //       ),
        //       divider,
        //       DrawerList(
        //         icon: Icons.local_offer_outlined,
        //         title: 'Daily Offers',
        //         onpress: () {
        //           Navigator.pushNamed(context, OrdersPage.id);
        //         },
        //       ),
        //       divider,
        //       DrawerList(
        //         icon: Icons.settings,
        //         title: 'Setting',
        //         onpress: () {
        //           Navigator.pushNamed(context, OrdersPage.id);
        //         },
        //       ),
        //       SizedBox(
        //         height: MediaQuery.of(context).size.height * 0.02,
        //       )
        //     ],
        //   ),
        // ),
        );
  }
}
