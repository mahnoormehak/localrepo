// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// Database? _database;
// class DBHelper {
//   static Database? _database;
//   static const String tableName = 'UserRegistration';
//   static const String columnId = 'id';
//   static const String columnFirstName = 'firstName';
//   static const String columnLastName = 'lastName';
//   static const String columnEmail = 'email';
//   static const String columnPassword = 'password';
//   static const String columnPhone = 'phone';

//   // Open the database
//   static Future open() async {
//     if (_database== null) {
//       _database = await openDatabase(
//         join(await getDatabasesPath(), 'my_database.db'),
//         onCreate: (db, version) {
//           return db.execute('''
//             CREATE TABLE IF NOT EXISTS $tableName(
//               $columnId INTEGER PRIMARY KEY,
//               $columnFirstName TEXT NOT NULL,
//               $columnLastName TEXT,
//               $columnEmail TEXT,
//               $columnPassword TEXT,
//               $columnPhone TEXT
//             )
//           ''');
//         },
//         version: 1,
//       );
//     }
//   }


//    // Insert user registration data and fetch the most recent user data
//   static Future<Map<String, dynamic>> insertAndFetchUser(Map<String, dynamic> data) async {
//     await open();
//       // Convert phone number to integer
//   if (data['phone'] != null) {
//     data['phone'] = int.parse(data['phone']);
//   }
//   // Validate password strength
//   String password = data['password'];
//   if (password != null && password.length < 8) {
//     //throw Exception('Password must be at least 8 characters long');
//   }
//     await _database?.insert(tableName, data,
//         conflictAlgorithm: ConflictAlgorithm.replace);
//     return fetchUserData();
//   }

//   // Fetch first name, last name, and phone number
//   static Future<Map<String, dynamic>> fetchUserData() async {
//     await open();
//     List<Map<String, dynamic>> result =
//         await _database!.query(tableName, columns: [
//       columnFirstName,
//       columnLastName,
//       columnPhone,
//       columnEmail,
      
//     ], orderBy: '$columnId DESC', limit: 1);
//     if (result.isNotEmpty) {
//       return result.first;
//     } else {
//       return {};
//     }
//   }
//    // Fetch user data
//   static Future<Map<String, dynamic>> AuthenticateUser(String email) async {
//     await open();
//     List<Map<String, dynamic>> result = await _database!.query(
//       tableName,
//       columns: [columnEmail, columnPassword],
//       where: '$columnEmail = ?',
//       whereArgs: [email],
//       orderBy: '$columnId DESC',
//       limit: 1,
//     );
//     if (result.isNotEmpty) {
//       return result.first;
//     } else {
//       return {};
//     }
//   }
// // static Future<void> updatePassword(String newPassword, String confPassword) async {
// //   // Check if newPassword and confirmPassword match
// //   if (newPassword == confPassword) {
// //     print('Updating password in the database...');
// //     await open();
// //     await _database?.update(
// //       tableName,
// //       {columnPassword: newPassword},
// //       where: '$columnEmail = ?',
// //     );
// //     print('Password updated successfully!');
// //   } else {
// //     throw Exception('Passwords do not match.');
// //   }
// // }
// static Future<void> updatePassword(String newPassword) async {
//   // Update the password in your database
//   // This is just a placeholder, replace it with your actual implementation
//   await DBHelper.updatePassword(newPassword);
// }


//    // Delete user data
//   static Future<void> deleteUserData() async {
//     await open();
//     await _database?.delete(tableName);
//   }
// }


