import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mr_cafe_admin/constant.dart';
import 'package:mr_cafe_admin/screens/add_category_screen.dart';
import 'package:mr_cafe_admin/screens/drawer_screen.dart';
import 'package:mr_cafe_admin/service/database_handler.dart';
import 'package:mr_cafe_admin/service/image_utility.dart';
import 'package:mr_cafe_admin/service/item_model.dart';
import 'package:mr_cafe_admin/screens/itemprovide.dart';
import 'package:mr_cafe_admin/widget/itemcard.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  MenuPage({Key? key}) : super(key: key);
  static const String id = 'menu_screen';

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<ItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
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
      // drawer: DrawerPage(),
      // body: ITEMLIST.isEmpty
      // ? Text("data ")
      // : ListView.builder(
      //     itemCount: ITEMLIST.length,
      //     itemBuilder: (context, index) {
      //       return ItemCard(
      //           title: ITEMLIST[index]['itemname'],
      //           image:
      //               Utility.imageFromBase64String(ITEMLIST[index]['image']),
      //           price: ITEMLIST[index]['price']);
      //     },
      //   ),
      // body: FutureBuilder(
      //   // builder: (context, snapshot) {},
      // ),
      body: Column(
        children: [
          FutureBuilder(
            future: item.getData(),
            builder: (context, AsyncSnapshot<List<ItemModel>> snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ItemCard(
                          title: snapshot.data![index].itemname.toString(),
                          image: Image.memory(base64Decode(
                              snapshot.data![index].image.toString())),
                          price: snapshot.data![index].price.toString());
                    },
                  ),
                );
              } else {
                return Text("No Data");
              }
            },
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .02),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, AddCategory.id);
          },
          child: Text(
            'Add Menu Item',
            style: TextStyle(fontSize: 18.0),
          ),
          style: ElevatedButton.styleFrom(
            primary: kButtonColor,
            fixedSize: Size(MediaQuery.of(context).size.width * 0.5,
                MediaQuery.of(context).size.width * 0.13),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
