import 'package:flutter/material.dart';

import '../constant.dart';

class DrawerList extends StatelessWidget {
  const DrawerList(
      {Key? key,
      required this.icon,
      required this.title,
      required this.onpress})
      : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onpress,
      contentPadding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.13),
      leading: Icon(
        icon,
        size: 30,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 20.0),
      ),
      selectedColor: Colors.redAccent,
    );
  }
}
