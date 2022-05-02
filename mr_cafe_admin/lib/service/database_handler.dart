import 'package:mr_cafe_admin/service/item_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DatabaseHandler {
  static Database? _database;
  Future<Database?> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await initDatabse();
    return _database;
  }

  initDatabse() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'item.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE item (image BLOB,itemname TEXT PRIMARY KEY, category TEXT,price INTEGER, description TEXT)');
  }

  Future<ItemModel> insert(ItemModel itemModel) async {
    var dbClient = await db;
    await dbClient?.insert('item', itemModel.toMap());
    return itemModel;
  }

  Future<List<ItemModel>> getItemList() async {
    var dbClient = await db;
    final List<Map<String, dynamic>> queryResult =
        await dbClient!.query('item');
    return queryResult.map((e) => ItemModel.fromMap(e)).toList();
  }
}
