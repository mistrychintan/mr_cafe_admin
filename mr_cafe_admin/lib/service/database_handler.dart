import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  static Database? _database;
  static final DatabaseHandler _databaseHandler = DatabaseHandler._internal();
  DatabaseHandler._internal();

  factory DatabaseHandler() {
    return _databaseHandler;
  }
  Future<Database?> openDB() async {
    _database = await openDatabase(join(await getDatabasesPath(), 'items.db'));
    return _database;
  }
}
