import 'package:flutter/material.dart';

class AddMenuItem extends StatelessWidget {
  const AddMenuItem({Key? key}) : super(key: key);
  static const String id = 'add_menu_item';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Item')),
    );
  }
}
