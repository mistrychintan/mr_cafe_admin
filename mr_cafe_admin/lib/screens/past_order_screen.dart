import 'package:flutter/material.dart';

import '../constant.dart';
import 'new_order_Screen.dart';

class PastOrderScreen extends StatelessWidget {
  const PastOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.black, style: BorderStyle.solid)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  UperBody(),
                  MiddelBody(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order Status: Order Delivered",
                          style: TextStyle(fontSize: 15.0, color: Colors.green),
                          textAlign: TextAlign.center,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "View Details",
                            style: TextStyle(color: kDarkColor),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: kBackgroundColor,
                              side: BorderSide(color: kDarkColor)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
    ;
  }
}

class UperBody extends StatelessWidget {
  const UperBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: kDarkColor.withOpacity(0.3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.delivery_dining,
            size: 35,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Chintan Mistry",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text("Today At 12:30 AM", style: TextStyle(fontSize: 10.0))
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * .345),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order id: 45",
                  style: TextStyle(fontSize: 12.0),
                ),
                Text("Total: 150", style: TextStyle(fontSize: 12.0))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MiddelBody extends StatelessWidget {
  const MiddelBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: Text(item[index])),
              Expanded(child: Text("Qty: ${qty[index]}")),
              Expanded(child: Text("Total: ${price[index]}"))
            ],
          );
        },
      ),
    );
  }
}
