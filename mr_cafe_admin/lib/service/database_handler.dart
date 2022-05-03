import 'package:mr_cafe_admin/service/item_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DatabaseHandler {
  static Database? _database;
  static final DatabaseHandler _databaseHandler = DatabaseHandler._internal();
  DatabaseHandler._internal();
  factory DatabaseHandler() {
    return _databaseHandler;
  }

  Future<Database?> openDB() async {
    _database = await openDatabase(join(await getDatabasesPath(), 'item.db'));
    return _database;
  }

  void createTable(Database? db) {
    db?.execute(
        'CREATE TABLE IF NOT EXISTs item (id INTEGER PRIMARY KEY,itemname TEXT, category TEXT,price INTEGER, description TEXT)');
  }

  Future<List<ItemModel>> getItem() async {
    _database = await openDB();
    final List<Map<String, dynamic>> maps = await _database!.query('item');
    print(maps.map((e) => ItemModel.fromMap(e)).toList());

    return maps.map((e) => ItemModel.fromMap(e)).toList();
  }

  // late Future<List<ItemModel>> _item;
  // Future<List<ItemModel>> get item => _item;
  // Future<Database?> get db async {
  //   if (_database != null) {
  //     return _database;
  //   }
  //   _database = await initDatabse();
  //   return _database;
  // }

  // initDatabse() async {
  //   io.Directory documentDirectory = await getApplicationDocumentsDirectory();
  //   String path = join(documentDirectory.path, 'item.db');
  //   var db = await openDatabase(
  //     path,
  //     version: 1,
  //     onCreate: _onCreate,
  //   );
  // }

  // _onCreate(Database db, int version) async {
  //   await db.execute(
  //       'CREATE TABLE item (image TEXT,itemname TEXT PRIMARY KEY, category TEXT,price INTEGER, description TEXT)');
  // }

  // Future<ItemModel> insert(ItemModel itemModel) async {
  //   var dbClient = await db;
  //   await dbClient?.insert('item', itemModel.toMap());
  //   print("insert data");
  //   return itemModel;
  // }

  // Future<List<ItemModel>> getItemList() async {
  //   var dbClient = await db;
  //   final List<Map<String, dynamic>> queryResult =
  //       await dbClient!.query('item');
  //   return queryResult.map((e) => ItemModel.fromMap(e)).toList();
  // }

  // Future<List<ItemModel>> getData() async {
  //   _item = getItemList();
  //   return _item;
  // }
}
