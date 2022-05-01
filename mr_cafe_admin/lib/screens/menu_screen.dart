import 'package:flutter/material.dart';
import 'package:mr_cafe_admin/constant.dart';
import 'package:mr_cafe_admin/screens/add_category_screen.dart';
import 'package:mr_cafe_admin/screens/drawer_screen.dart';
import 'package:mr_cafe_admin/service/database_handler.dart';
import 'package:mr_cafe_admin/service/image_utility.dart';
import 'package:mr_cafe_admin/service/item_model.dart';
import 'package:mr_cafe_admin/widget/itemcard.dart';

class MenuPage extends StatelessWidget {
  MenuPage({Key? key}) : super(key: key);
  static const String id = 'menu_screen';
  DatabaseHandler databaseHandler = DatabaseHandler();

  @override
  Widget build(BuildContext context) {
    // var data = databaseHandler.getItemList();

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
      drawer: DrawerPage(),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Color(0xFF212325),
                  // color: kDarkColor,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,

                  // SkeletonAnimation method
                  children: <Widget>[
                    SizedBox(
                      width: 110.0,
                      height: 110.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: AssetImage("assets/capuccino.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, bottom: 5.0),
                              child: SizedBox(
                                // height: 25,
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  "Hot Coffee",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white70,
                                      fontFamily: 'Libre Baskerville'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15.0, right: 5),
                              child: Text(
                                '100/-',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15.0, right: 5.0, top: 5),
                                child: Text(
                                  'csdkha hk ahaghj gauga jhjgghfafdha jdgjyagyunjffjn k jkvnjkjn jufherufhreuihuiho re',
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          FutureBuilder(
              // future:data,
              builder: (context, AsyncSnapshot<ItemModel> snapshot) {
            return ItemCard(
              price: snapshot.data!.price.toString(),
              title: snapshot.data!.itemname,
              image: Utility.imageFromBase64String(snapshot.data!.image),
            );
          }),
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
