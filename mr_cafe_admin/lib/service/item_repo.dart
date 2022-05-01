import 'package:mr_cafe_admin/screens/add_category_screen.dart';
import 'package:mr_cafe_admin/service/item_model.dart';
import 'package:sqflite/sqflite.dart';

class ItemRepo {
  void CreateTable(Database? db) {
    db?.execute(
        'CREATE TABLE ITEM(image BLOB,itemname TEXT PRIMARY KEY, category TEXT,price INTEGER, description TEXT)');
  }

  Future<List<ItemModel>> getItem(Database? db) async {
    var dbClient = await db;
    final List<Map<String, dynamic>> maps = await dbClient!.query(TABLENAME);
    return maps.map((e) => ItemModel.fromMap(e)).toList();
  }
}
