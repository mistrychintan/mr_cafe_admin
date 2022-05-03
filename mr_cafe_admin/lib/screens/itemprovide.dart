import 'package:flutter/material.dart';
import 'package:mr_cafe_admin/service/database_handler.dart';
import 'package:mr_cafe_admin/service/item_model.dart';

import '../service/item_model.dart';

class ItemProvider with ChangeNotifier {
  DatabaseHandler databaseHandler = DatabaseHandler();
  late Future<List<ItemModel>> _item;
  Future<List<ItemModel>> get item => _item;
  Future<List<ItemModel>> getData() async {
    _item = databaseHandler.getItem();
    return _item;
  }
}
