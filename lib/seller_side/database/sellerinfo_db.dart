import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'your_database.db');

    return await openDatabase(
      path,
      version: 2, // Incremented database version
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT,
            password TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS addresses (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id INTEGER,
            business_address TEXT,
            warehouse_address TEXT,
            return_address TEXT,
            FOREIGN KEY (user_id) REFERENCES users (id)
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS id_cards (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id INTEGER,
            id_name TEXT,
            id_number TEXT,
            front_image_path TEXT,
            back_image_path TEXT,
            FOREIGN KEY (user_id) REFERENCES users (id)
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS bank_info (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id INTEGER,
            bank_name TEXT,
            account_holder_name TEXT,
            account_number TEXT,
            branch_code TEXT,
            iban TEXT,
            FOREIGN KEY (user_id) REFERENCES users (id)
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS profile_images (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id INTEGER,
            image_path TEXT,
            FOREIGN KEY (user_id) REFERENCES users (id)
          )
        ''');
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        if (oldVersion < 2) {
          // Perform database upgrades for version 2
          await db.execute('''
            CREATE TABLE IF NOT EXISTS profile_images (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              user_id INTEGER,
              image_path TEXT,
              FOREIGN KEY (user_id) REFERENCES users (id)
            )
          ''');
        }
        // Add more upgrade logic here for future versions
      },
    );
  }

  // Insert user details and get user id
  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    int userId = await db.insert('users', user);
    return userId;
  }

  Future<Map<String, dynamic>?> getUserById(int userId) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query('users', where: 'id = ?', whereArgs: [userId]);
    return result.isNotEmpty ? result.first : null;
  }

  // Insert address details
  Future<void> insertAddress(Map<String, dynamic> address) async {
    final db = await database;
    await db.insert('addresses', address);
  }

  // Insert ID card details
  Future<void> insertIdCard(Map<String, dynamic> idCard) async {
    final db = await database;
    await db.insert('id_cards', idCard);
  }

  // Insert bank information
  Future<void> insertBankInfo(Map<String, dynamic> bankInfo) async {
    final db = await database;
    await db.insert('bank_info', bankInfo);
  }

  // Insert profile image
  Future<void> insertProfileImage(int userId, String imagePath) async {
    final db = await database;
    await db.insert('profile_images', {'user_id': userId, 'image_path': imagePath});
  }

  // Get the latest profile image path for a user
  Future<String?> getLatestImagePath(int userId) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'profile_images',
      where: 'user_id = ?',
      whereArgs: [userId],
      orderBy: 'id DESC',
      limit: 1,
    );
    return result.isNotEmpty ? result.first['image_path'] : null;
  }

  Future<Map<String, dynamic>> getUserData(int userId) async {
    Database db = await database;

    final List<Map<String, dynamic>> user = await db.query('users', where: 'id = ?', whereArgs: [userId]);
    final List<Map<String, dynamic>> address = await db.query('addresses', where: 'user_id = ?', whereArgs: [userId]);
    final List<Map<String, dynamic>> idCard = await db.query('id_cards', where: 'user_id = ?', whereArgs: [userId]);
    final List<Map<String, dynamic>> bankInfo = await db.query('bank_info', where: 'user_id = ?', whereArgs: [userId]);

    return {
      'user': user.isNotEmpty ? user.first : null,
      'address': address.isNotEmpty ? address.first : null,
      'idCard': idCard.isNotEmpty ? idCard.first : null,
      'bankInfo': bankInfo.isNotEmpty ? bankInfo.first : null,
    };
  }

  Future<bool> loginUser({required String email, required String password}) async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    return result.isNotEmpty;
  }

  Future<bool> validateIdCard({required String idNumber}) async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'id_cards',
      where: 'id_number = ?',
      whereArgs: [idNumber],
    );

    return result.isNotEmpty;
  }
}
