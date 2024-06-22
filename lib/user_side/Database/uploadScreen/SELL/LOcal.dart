import 'dart:typed_data';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDB2 {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initializeDB('CustomDB.db'); // Change database name here
    return _database!;
  }

  Future<Database> _initializeDB(String filepath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);

    return openDatabase(path, version: 1, onCreate: _createDB, onUpgrade: _upgradeDB);
  }

  Future<void> _createDB(Database db, int newVersion) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS Localdata(
        id INTEGER PRIMARY KEY,
        Name TEXT NOT NULL,
        description TEXT,
        price REAL,
        availability INTEGER,
        image BLOB
      )
    ''');
  }

  Future<void> _upgradeDB(Database db, int oldVersion, int newVersion) async {
    // Handle database upgrade here if needed
  }

  Future<String> addDataLocally1({
    required String name,
    required String description,
    required double price,
    required int availability,
    // Uint8List? image, // Add image parameter
  }) async {
    try {
      final db = await database;
      await db.insert('Localdata', {
        'Name': name,
        'description': description,
        'price': price,
        'availability': availability,
        // 'image': image, // Save image data to the database
      });
      print('$name Added to Database Successfully');
      return 'added'; // Return a value on success
    } catch (e) {
      print('Error adding data locally: $e');
      return 'error'; // Return a value in case of error
    }
  }

  Future<List<String>> getDeviceNames() async {
    final db = await database;
    final List<Map<String, dynamic>> devices = await db.query('Localdata');
    return devices.map((device) => device['Name'] as String).toList();
  }

  Future<List<Map<String, dynamic>>?> fetchDataLocally1() async {
    try {
      final db = await database;
      final result = await db.query('Localdata');
      print('Data fetched successfully: $result'); // Print the fetched data
      return result; // Return the fetched data
    } catch (e) {
      print('Error fetching data locally: $e');
      throw Exception('Failed to fetch data locally: $e');
    }
  }

  Future<void> deleteDataLocally1(int id) async {
    try {
      final db = await database;
      await db.delete('Localdata', where: 'id = ?', whereArgs: [id]);
      print('Data with ID $id deleted successfully');
    } catch (e) {
      print('Error deleting data: $e');
    }
  }

  Future<void> updateItemLocally1({
    required int id,
    required String name,
    required String description,
    required double price,
    required int availability,
    Uint8List? imageData,
  }) async {
    try {
      final db = await database;
      await db.update(
        'Localdata',
        {
          'Name': name,
          'description': description,
          'price': price,
          'availability': availability,
          'image': imageData,
        },
        where: 'id = ?',
        whereArgs: [id],
      );
      print('Item with ID $id updated successfully');
    } catch (e) {
      print('Error updating item: $e');
    }
  }

  void addUserRegistration({required String email, required String firstName, required String lastName, required String password, required String phone}) {
    // Implement user registration logic here
  }
}
