// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DatabaseHelper1 {
//   static final DatabaseHelper1 _instance = DatabaseHelper1._internal();
//   static Database? _database;

//   factory DatabaseHelper1() {
//     return _instance;
//   }

//   DatabaseHelper1._internal();

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, 'id_verification.db');

//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) {
//         return db.execute(
//           'CREATE TABLE id_cards(id INTEGER PRIMARY KEY AUTOINCREMENT, image_path TEXT, extracted_text TEXT)',
//         );
//       },
//     );
//   }

//   Future<void> insertIDCard(String imagePath, String extractedText) async {
//     final db = await database;
//     await db.insert(
//       'id_cards',
//       {'image_path': imagePath, 'extracted_text': extractedText},
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   Future<List<Map<String, dynamic>>> getIDCards() async {
//     final db = await database;
//     return await db.query('id_cards');
//   }
// }
