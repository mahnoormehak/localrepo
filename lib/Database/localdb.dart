// <<<<<<< HEAD
// // ignore_for_file: avoid_print, unused_element
// =======
// >>>>>>> d34cf9279b94f2760c354f3b1da40a48d181d321

// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// // database creation
// <<<<<<< HEAD
// Database? _database;

// class LocalDatabase {
//   Future get database async {
//     if (_database != null) return _database;
// =======


// class LocalDatabase {
//  static Database? _database;
  
  
//   Future<Database> get database async {
//     if (_database != null) return _database!;
// >>>>>>> d34cf9279b94f2760c354f3b1da40a48d181d321
//     _database = await _initializeDB('Local.db');
//     return _database!;
//   }

// <<<<<<< HEAD
//   Future _initializeDB(String filepath) async {
// =======
//   // ignore: dead_code, dead_code
//   Future<Database> _initializeDB(String filepath) async {
// >>>>>>> d34cf9279b94f2760c354f3b1da40a48d181d321
//     final dbpath = await getDatabasesPath();
//     final path = join(dbpath,filepath );

// <<<<<<< HEAD
//   Future _createDB(Database db, int version) async {
//     await db.execute(
//         // table creation name Localdata
//         '''
// create table Localdata(
//  id INTEGER PRIMARY KEY,
// =======
//     return openDatabase(path, version: 1, onCreate:_createDB,
//      onUpgrade: _upgradeDB,  );

 
// }

//   Future<void> _createDB(Database db, int newVersion) async {
    
    
//     {await db.execute('''

//       CREATE TABLE IF NOT EXISTS Localdata(
//         id INTEGER PRIMARY KEY,
// >>>>>>> d34cf9279b94f2760c354f3b1da40a48d181d321
//         Name TEXT NOT NULL,
//         description TEXT,
//         price REAL,
//         availability INTEGER,
//         image BLOB
//       )
//     ''');

// <<<<<<< HEAD
// )
// ''');
//   }

// // insertion into database for rent o sell screen

//   Future<String> addDataLocally({
//     required String name,
//     required String description,
//     required double price,
//     required int availability,
//   }) async {
//     try {
//       final db = await database;
//       await db!.insert('Localdata', {
//         'Name': name,
//         'description': description,
//         'price': price,
//         'availability': availability,
//       });
//       print('$name Added to Database Successfully');
//       return 'added'; // Return a value on success
//     } catch (e) {
//       print('Error adding data locally: $e');
//       return 'error'; // Return a value in case of error
//     }
//   }

// //fetch the data and display into the uploadscreen1 screen
//   Future<List<Map<String, dynamic>>?> fetchDataLocally() async {
//     try {
//       final db = await database;
//       final result = await db!.query('Localdata');
// =======
    
    
//     }
//   }
//   // Upgrade database (if needed)
//   static Future<void> _upgradeDB(Database db, int oldVersion, int newVersion) async {
   
//   }


//   Future<String> addDataLocally({
//     required String name,
//     required String description,
//     required double price,
//     required int availability,
//    //  Uint8List? image, // Add image parameter
//   }) async {
//     try {
//       final db = await database;
//       await db.insert('Localdata', {
//         'Name': name,
//         'description': description,
//         'price': price,
//         'availability': availability,
        
//       });
//       print('$name Added to Database Successfully');
//       return 'added'; // Return a value on success
//     } catch (e) {
//       print('Error adding data locally: $e');
//       return 'error'; // Return a value in case of error
//     }
//   }

//   Future<List<Map<String, dynamic>>?> fetchDataLocally() async {
//     try {
//       final db = await database;
//       final result = await db.query('Localdata');
// >>>>>>> d34cf9279b94f2760c354f3b1da40a48d181d321
//       print('Data fetched successfully: $result'); // Print the fetched data
//       return result; // Return the fetched data
//     } catch (e) {
//       print('Error fetching data locally: $e');
//       throw Exception('Failed to fetch data locally: $e');
//     }
//   }

// <<<<<<< HEAD
//   //delete the data
//   Future<void> deleteDataLocally(int id) async {
//     try {
//       final db = await database;
//       await db!.delete('Localdata', where: 'id = ?', whereArgs: [id]);
// =======
//   Future<void> deleteDataLocally(int id) async {
//     try {
//       final db = await database;
//       await db.delete('Localdata', where: 'id = ?', whereArgs: [id]);
// >>>>>>> d34cf9279b94f2760c354f3b1da40a48d181d321
//       print('Data with ID $id deleted successfully');
//     } catch (e) {
//       print('Error deleting data: $e');
//     }
//   }
// <<<<<<< HEAD
// // Future<void> updateDataLocally(int id, String newName, String newDescription, double newPrice, int newAvailability) async {
// //     try {
// //       final db = await database;
// //       await db!.update(
// //         'Localdata',
// //         {
// //           'Name': newName,
// //           'description': newDescription,
// //           'price': newPrice,
// //           'availability': newAvailability,
// //         },
// //         where: 'id = ?',
// //         whereArgs: [id],
// //       );
// //       print('Data updated successfully');
// //     } catch (e) {
// //       print('Error updating data: $e');
// //     }
// //   }
// =======
// >>>>>>> d34cf9279b94f2760c354f3b1da40a48d181d321

//   Future<void> updateItemLocally({
//     required int id,
//     required String name,
//     required String description,
//     required double price,
//     required int availability,
//   }) async {
// <<<<<<< HEAD
//     // Here you should implement the logic to update the item in your local database.
//     // This can vary depending on the database package you're using (e.g., sqflite, hive, etc.).

//     // For example, if you're using sqflite, you might do something like this:

//     // Open the database
//     final db = _database;

//     // Ensure db is not null before calling update
//     db?.update(
//       'Localdata',
//       {
//         'Name': name,
//         'description': description,
//         'price': price,
//         'availability': availability,
//       },
//       where: 'id = ?',
//       whereArgs: [id],
//     );
// // Create a new table for storing user profile data
//     Future<void> createProfileTable(Database db, int version) async {
//       await db.execute('''
//       CREATE TABLE UserProfile(
//         id INTEGER PRIMARY KEY,
//         fullName TEXT NOT NULL,
//         lastName TEXT,
//         email TEXT,
//         password TEXT,
//         phoneNumber TEXT,
//         country TEXT
//       )
//       ''');
//     }

//     // Insert user profile data into the UserProfile table
//     Future<String> addProfileDataLocally({
//       required String fullName,
//       required String lastName,
//       required String email,
//       required String password,
//       required String phoneNumber,
//       required String country,
//     }) async {
//       try {
//         final db = await database;
//         await db!.insert('UserProfile', {
//           'fullName': fullName,
//           'lastName': lastName,
//           'email': email,
//           'password': password,
//           'phoneNumber': phoneNumber,
//           'country': country,
//         });
//         print('Profile data added to database successfully');
//         return 'added';
//       } catch (e) {
//         print('Error adding profile data locally: $e');
//         return 'error';
//       }
//     }

// // Fetch user profile data from the UserProfile table
//     Future<Map<String, dynamic>?> fetchProfileDataLocally() async {
//       try {
//         final db = await database;
//         final List<Map<String, dynamic>> result =
//             await db!.query('UserProfile');
//         if (result.isNotEmpty) {
//           print('Profile data fetched successfully');
//           return result.first;
//         } else {
//           print('No profile data found');
//           return null;
//         }
//       } catch (e) {
//         print('Error fetching profile data locally: $e');
//         return null;
//       }
//     }

// // Update user profile data in the UserProfile table
//     Future<void> updateProfileDataLocally({
//       required int id,
//       required String fullName,
//       required String lastName,
//       required String email,
//       required String password,
//       required String phoneNumber,
//       required String country,
//     }) async {
//       try {
//         final db = await database;
//         await db!.update(
//           'UserProfile',
//           {
//             'fullName': fullName,
//             'lastName': lastName,
//             'email': email,
//             'password': password,
//             'phoneNumber': phoneNumber,
//             'country': country,
//           },
//           where: 'id = ?',
//           whereArgs: [id],
//         );
//         print('Profile data updated successfully');
//       } catch (e) {
//         print('Error updating profile data: $e');
//       }
//     }
//   }
// =======
//     try {
//       final db = await database;
//       await db.update(
//         'Localdata',
//         {
//           'Name': name,
//           'description': description,
//           'price': price,
//           'availability': availability,
//         },
//         where: 'id = ?',
//         whereArgs: [id],
//       );
//       print('Item with ID $id updated successfully');
//     } catch (e) {
//       print('Error updating item: $e');
//     }
//   }

//   addUserRegistration({required String email, required String firstName, required String lastName, required String password, required String phone}) {}

// >>>>>>> d34cf9279b94f2760c354f3b1da40a48d181d321
// }
