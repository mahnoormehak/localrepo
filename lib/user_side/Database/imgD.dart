import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "images.db";
  static final _databaseVersion = 1;

  static final table = 'images';
  static final columnId = '_id';
  static final columnImagePath = 'image_path';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnImagePath TEXT
          )
          ''');
  }

  // Insert a row into the database
  Future<int> insert(String imagePath) async {
    Database db = await database;
    return await db.insert(table, {columnImagePath: imagePath});
  }

  // Query all rows in the database
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await database;
    return await db.query(table);
  }

  // Delete all rows in the database
  Future<void> deleteAllRows() async {
    Database db = await database;
    await db.delete(table);
  }

  // Get the latest image path from the database
  Future<String?> getLatestImagePath() async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query(table,
        columns: [columnImagePath],
        orderBy: "$columnId DESC",
        limit: 1);
    if (result.isNotEmpty) {
      return result.first[columnImagePath] as String?;
    }
    return null;
  }
}
