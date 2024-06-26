import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:localrepo/chat/model/chatUser.dart'; // Ensure you import your Message class
// Import the Message class

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'chat_database.db');
    return await openDatabase(
      path,
      version: 2, // Increment version if you're adding a new table
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE chats (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        sender TEXT NOT NULL,
        receiver TEXT NOT NULL,
        message TEXT NOT NULL,
        dateTime TEXT NOT NULL
      )
      ''');
    await db.execute('''
      CREATE TABLE messages (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        toId TEXT NOT NULL,
        fromId TEXT NOT NULL,
        msg TEXT NOT NULL,
        sent TEXT NOT NULL,
        read TEXT NOT NULL,
        type TEXT NOT NULL
      )
      ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
      CREATE TABLE messages (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        toId TEXT NOT NULL,
        fromId TEXT NOT NULL,
        msg TEXT NOT NULL,
        sent TEXT NOT NULL,
        read TEXT NOT NULL,
        type TEXT NOT NULL
      )
      ''');
    }
  }

  Future<void> insertChat(Chat chat) async {
    final db = await database;
    await db.insert(
      'chats',
      chat.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Chat>> getChatList() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('chats');

    return List.generate(maps.length, (i) {
      return Chat.fromMap(maps[i]);
    });
  }

  Future<void> deleteChat(int id) async {
    final db = await database;
    await db.delete(
      'chats',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> insertMessage(Message message) async {
    final db = await database;
    await db.insert(
      'messages',
      message.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Message>> getMessageList() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('messages');

    return List.generate(maps.length, (i) {
      return Message.fromMap(maps[i]);
    });
  }

  Future<List<Map<String, dynamic>>> getMessageMapList() async {
    final db = await database;
    return await db.query('messages');
  }
}

class Chat {
  final String sender;
  final String receiver;
  final String message;
  final String dateTime;

  Chat({
    required this.sender,
    required this.receiver,
    required this.message,
    required this.dateTime,
  });

  // To convert a Chat object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'sender': sender,
      'receiver': receiver,
      'message': message,
      'dateTime': dateTime,
    };
  }

  // To convert a Map object into a Chat object
  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      sender: map['sender'],
      receiver: map['receiver'],
      message: map['message'],
      dateTime: map['dateTime'],
    );
  }
}



// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:localrepo/chat/model/chatUser.dart'; // Ensure you import your Message class

// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper._internal();
//   factory DatabaseHelper() => _instance;
//   static Database? _database;

//   DatabaseHelper._internal();

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     String path = join(await getDatabasesPath(), 'chat_database.db');
//     return await openDatabase(
//       path,
//       version: 2, // Increment version if you're adding a new table
//       onCreate: _onCreate,
//       onUpgrade: _onUpgrade,
//     );
//   }

//   Future<void> _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE chats (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         sender TEXT NOT NULL,
//         receiver TEXT NOT NULL,
//         message TEXT NOT NULL,
//         dateTime TEXT NOT NULL
//       )
//       ''');
//     await db.execute('''
//       CREATE TABLE messages (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         toId TEXT NOT NULL,
//         fromId TEXT NOT NULL,
//         msg TEXT NOT NULL,
//         sent TEXT NOT NULL,
//         read TEXT NOT NULL,
//         type TEXT NOT NULL
//       )
//       ''');
//   }

//   Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
//     if (oldVersion < 2) {
//       await db.execute('''
//       CREATE TABLE messages (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         toId TEXT NOT NULL,
//         fromId TEXT NOT NULL,
//         msg TEXT NOT NULL,
//         sent TEXT NOT NULL,
//         read TEXT NOT NULL,
//         type TEXT NOT NULL
//       )
//       ''');
//     }
//   }

//   Future<void> insertChat(Chat chat) async {
//     final db = await database;
//     await db.insert(
//       'chats',
//       chat.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   Future<List<Chat>> getChatList() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('chats');

//     return List.generate(maps.length, (i) {
//       return Chat.fromMap(maps[i]);
//     });
//   }

//   Future<void> deleteChat(int id) async {
//     final db = await database;
//     await db.delete(
//       'chats',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }

//   Future<void> insertMessage(Message message) async {
//     final db = await database;
//     await db.insert(
//       'messages',
//       message.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   Future<List<Map<String, dynamic>>> getMessageMapList() async {
//     final db = await database;
//     return await db.query('messages');
//   }
// }



// class Chat {
//   final String sender;
//   final String receiver;
//   final String message;
//   final String dateTime;

//   Chat({
//     required this.sender,
//     required this.receiver,
//     required this.message,
//     required this.dateTime,
//   });

//   // To convert a Chat object into a Map object
//   Map<String, dynamic> toMap() {
//     return {
//       'sender': sender,
//       'receiver': receiver,
//       'message': message,
//       'dateTime': dateTime,
//     };
//   }

//   // To convert a Map object into a Chat object
//   factory Chat.fromMap(Map<String, dynamic> map) {
//     return Chat(
//       sender: map['sender'],
//       receiver: map['receiver'],
//       message: map['message'],
//       dateTime: map['dateTime'],
//     );
//   }
// }



// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:localrepo/chat/model/chatUser.dart'; // Ensure you import your Message class

// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper._internal();
//   factory DatabaseHelper() => _instance;
//   static Database? _database;

//   DatabaseHelper._internal();

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     String path = join(await getDatabasesPath(), 'chat_database.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _onCreate,
//     );
//   }

//   Future<void> _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE chats (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         sender TEXT NOT NULL,
//         receiver TEXT NOT NULL,
//         message TEXT NOT NULL,
//         dateTime TEXT NOT NULL
//       )
//       ''');
//   }

//   Future<void> insertChat(Chat chat) async {
//     final db = await database;
//     await db.insert(
//       'chats',
//       chat.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   Future<List<Chat>> getChatList() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('chats');

//     return List.generate(maps.length, (i) {
//       return Chat.fromMap(maps[i]);
//     });
//   }

//   Future<void> deleteChat(int id) async {
//     final db = await database;
//     await db.delete(
//       'chats',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }

//   Future<void> insertMessage(Message message) async {
//     final db = await database;
//     await db.insert(
//       'messages',
//       message.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   Future<List<Map<String, dynamic>>> getMessageMapList() async {
//     final db = await database;
//     return await db.query('messages');
//   }
// }






// import 'dart:async';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseHelper {
//   static final DatabaseHelper _databaseHelper = DatabaseHelper._createInstance(); // Singleton DatabaseHelper
//   static Database? _database; // Singleton Database

//   String chatTable = 'chat_table';
//   String colId = 'id';
//   String colSender = 'sender';
//   String colReceiver = 'receiver';
//   String colMessage = 'message';
//   String colDateTime = 'dateTime';

//   DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

//   factory DatabaseHelper() {
//     return _databaseHelper;
//   }

//   Future<Database> get database async {
//     _database ??= await initializeDatabase();
//     return _database!;
//   }

//   Future<Database> initializeDatabase() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = '${directory.path}/chats.db';

//     var chatsDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
//     return chatsDatabase;
//   }

//   void _createDb(Database db, int newVersion) async {
//     await db.execute(
//       'CREATE TABLE $chatTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colSender TEXT, $colReceiver TEXT, $colMessage TEXT, $colDateTime TEXT)',
//     );
//   }

//   // Fetch Operation: Get all chat messages from database
//   Future<List<Map<String, dynamic>>> getChatMapList() async {
//     Database db = await database;
//     var result = await db.query(chatTable, orderBy: '$colDateTime ASC');
//     return result;
//   }

//   // Insert Operation: Insert a Chat object to database
//   Future<int> insertChat(Chat chat) async {
//     Database db = await database;
//     var result = await db.insert(chatTable, chat.toMap());
//     return result;
//   }

//   // Update Operation: Update a Chat object and save it to database
//   Future<int> updateChat(Chat chat) async {
//     var db = await database;
//     var result = await db.update(chatTable, chat.toMap(), where: '$colId = ?', whereArgs: [chat.id]);
//     return result;
//   }

//   // Delete Operation: Delete a Chat object from database
//   Future<int> deleteChat(int id) async {
//     var db = await database;
//     int result = await db.rawDelete('DELETE FROM $chatTable WHERE $colId = $id');
//     return result;
//   }

//   // Get number of Chat objects in database
//   Future<int> getCount() async {
//     Database db = await database;
//     List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $chatTable');
//     int? result = Sqflite.firstIntValue(x);
//     return result ?? 0;
//   }

//   // Get the 'Map List' [ List<Map> ] and convert it to 'Chat List' [ List<Chat> ]
//   Future<List<Chat>> getChatList() async {
//     var chatMapList = await getChatMapList(); // Get 'Map List' from database
//     int count = chatMapList.length; // Count the number of map entries in db table

//     List<Chat> chatList = [];
//     // For loop to create a 'Chat List' from a 'Map List'
//     for (int i = 0; i < count; i++) {
//       chatList.add(Chat.fromMapObject(chatMapList[i]));
//     }

//     return chatList;
//   }
// }

// class Chat {
//   int? id;
//   String sender;
//   String receiver;
//   String message;
//   String dateTime;

//   Chat({
//     required this.sender,
//     required this.receiver,
//     required this.message,
//     required this.dateTime,
//     this.id,
//   });

//   Chat.withId(this.id, this.sender, this.receiver, this.message, this.dateTime);

//   int? get getId => id;

//   String get getSender => sender;

//   String get getReceiver => receiver;

//   String get getMessage => message;

//   String get getDateTime => dateTime;

//   set setSender(String newSender) {
//     if (newSender.length <= 255) {
//       sender = newSender;
//     }
//   }

//   set setReceiver(String newReceiver) {
//     if (newReceiver.length <= 255) {
//       receiver = newReceiver;
//     }
//   }

//   set setMessage(String newMessage) {
//     if (newMessage.length <= 255) {
//       message = newMessage;
//     }
//   }

//   set setDateTime(String newDateTime) {
//     dateTime = newDateTime;
//   }

//   // Convert a Chat object into a Map object
//   Map<String, dynamic> toMap() {
//     var map = <String, dynamic>{};
//     if (id != null) {
//       map['id'] = id;
//     }
//     map['sender'] = sender;
//     map['receiver'] = receiver;
//     map['message'] = message;
//     map['dateTime'] = dateTime;

//     return map;
//   }

//   // Extract a Chat object from a Map object
//   Chat.fromMapObject(Map<String, dynamic> map) {
//     id = map['id'];
//     sender = map['sender'];
//     receiver = map['receiver'];
//     message = map['message'];
//     dateTime = map['dateTime'];
//   }
// }


// import 'package:sqflite/sqflite.dart';
// import 'package:localrepo/chat/model/chatUser.dart';

// class DatabaseHelper {
//   static DatabaseHelper _databaseHelper = DatabaseHelper._createInstance();
//   static Database? _database;

//   String messageTable = 'message_table';
//   String colId = 'id';
//   String colToId = 'toId';
//   String colFromId = 'fromId';
//   String colMsg = 'msg';
//   String colSent = 'sent';
//   String colRead = 'read';
//   String colType = 'type';

//   DatabaseHelper._createInstance();

//   factory DatabaseHelper() => _databaseHelper;

//   Future<Database?> get database async {
//     if (_database == null) {
//       _database = await initializeDatabase();
//     }
//     return _database;
//   }

//   Future<Database> initializeDatabase() async {
//     String path = await getDatabasesPath() + 'chat.db';
//     var chatDatabase =
//         await openDatabase(path, version: 1, onCreate: _createDb);
//     return chatDatabase;
//   }

//   void _createDb(Database db, int newVersion) async {
//     await db.execute(
//       'CREATE TABLE $messageTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colToId TEXT, $colFromId TEXT, $colMsg TEXT, $colSent TEXT, $colRead TEXT, $colType TEXT)',
//     );
//   }

//   Future<List<Map<String, dynamic>>> getMessageMapList() async {
//     Database? db = await database;
//     if (db != null) {
//       var result = await db.query(messageTable, orderBy: '$colId ASC');
//       return result;
//     } else {
//       return [];
//     }
//   }

//   Future<int> insertMessage(Message message) async {
//     Database? db = await database;
//     if (db != null) {
//       var result = await db.insert(messageTable, message.toMap());
//       return result;
//     } else {
//       return 0;
//     }
//   }

//   Future<int> updateMessage(Message message) async {
//     Database? db = await database;
//     if (db != null) {
//       var result = await db.update(
//         messageTable,
//         message.toMap(),
//         where: '$colId = ?',
//         whereArgs: [message.id],
//       );
//       return result;
//     } else {
//       return 0;
//     }
//   }

//   Future<int> deleteMessage(int id) async {
//     Database? db = await database;
//     if (db != null) {
//       int result =
//           await db.rawDelete('DELETE FROM $messageTable WHERE $colId = $id');
//       return result;
//     } else {
//       return 0;
//     }
//   }
// }

// import 'package:localrepo/chat/model/chatUser.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseHelper {
//   static DatabaseHelper _databaseHelper;
//   static Database? _database;


//   String messageTable = 'message_table';
//   String colId = 'id';
//   String colToId = 'toId';
//   String colFromId = 'fromId';
//   String colMsg = 'msg';
//   String colSent = 'sent';
//   String colRead = 'read';
//   String colType = 'type';

//   DatabaseHelper._createInstance();

//   factory DatabaseHelper() {
//     if (_databaseHelper == null) {
//       _databaseHelper = DatabaseHelper._createInstance();
//     }
//     return _databaseHelper;
//   }

//   Future<Database?> get database async {
//   if (_database == null) {
//     _database = await initializeDatabase();
//   }
//   return _database;
// }


//   Future<Database> initializeDatabase() async {
//     String path = await getDatabasesPath() + 'chat.db';
//     var chatDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
//     return chatDatabase;
//   }

//   void _createDb(Database db, int newVersion) async {
//     await db.execute(
//       'CREATE TABLE $messageTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colToId TEXT, $colFromId TEXT, $colMsg TEXT, $colSent TEXT, $colRead TEXT, $colType TEXT)',
//     );
//   }

//   Future<List<Map<String, dynamic>>> getMessageMapList() async {
//     Database db = await this.database;
//     var result = await db.query(messageTable, orderBy: '$colId ASC');
//     return result;
//   }

//   Future<int> insertMessage(Message message) async {
//     Database db = await this.database;
//     var result = await db.insert(messageTable, message.toMap());
//     return result;
//   }

//   Future<int> updateMessage(Message message) async {
//     var db = await this.database;
//     var result = await db.update(
//       messageTable,
//       message.toMap(),
//       where: '$colId = ?',
//       whereArgs: [message.id],
//     );
//     return result;
//   }

//   Future<int> deleteMessage(int id) async {
//     var db = await this.database;
//     int result = await db.rawDelete('DELETE FROM $messageTable WHERE $colId = $id');
//     return result;
//   }
// }
