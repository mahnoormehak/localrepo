
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
class DatabaseHelp {
  static final DatabaseHelp instance = DatabaseHelp._instance();
  static Database? _db;

  DatabaseHelp._instance();

  String idCardTable = 'idCardTable';
  String colId = 'id';
  String colImagePath = 'imagePath';

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, 'idCard.db');
    final idCardDb = await openDatabase(path, version: 1, onCreate: _createDb);
    return idCardDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $idCardTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colImagePath TEXT)',
    );
  }

  Future<int> insertIdCard(Map<String, dynamic> row) async {
    Database? db = await this.db;
    final int result = await db!.insert(idCardTable, row);
    return result;
  }

  Future<List<Map<String, dynamic>>> getIdCardList() async {
    Database? db = await this.db;
    final List<Map<String, dynamic>> result = await db!.query(idCardTable);
    return result;
  }
}
