// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DatabaseHelper {
//   static final _databaseName = "messages_database.db";
//   static final _databaseVersion = 1;

//   static final table = 'messages';

//   static final columnId = '_id';
//   static final columnSenderId = 'sender_id'; // New column for sender ID
//   static final columnReceiverId = 'receiver_id'; // New column for receiver ID
//   static final columnText = 'text';
//   static final columnTimestamp = 'timestamp';

//   DatabaseHelper._privateConstructor();
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

//   static Database? _database;

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   _initDatabase() async {
//     String path = join(await getDatabasesPath(), _databaseName);
//     return await openDatabase(path,
//         version: _databaseVersion, onCreate: _onCreate);
//   }

//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//           CREATE TABLE $table (
//             $columnId INTEGER PRIMARY KEY,
//             $columnSenderId INTEGER NOT NULL,
//             $columnReceiverId INTEGER NOT NULL,
//             $columnText TEXT NOT NULL,
//             $columnTimestamp INTEGER NOT NULL
//           )
//           ''');
//   }

//   Future<int> insert(Map<String, dynamic> row) async {
//     Database db = await instance.database;
//     return await db.insert(table, row);
//   }

//   Future<List<Map<String, dynamic>>> queryAllRows({required int senderId, required int receiverId}) async {
//     Database db = await instance.database;
//     return await db.query(table, where: '$columnSenderId = ? AND $columnReceiverId = ?', whereArgs: [senderId, receiverId]);
//   }
// }

// class Message {
//   int? id;
//   int senderId;
//   int receiverId;
//   String text;
//   int timestamp;

//   Message({this.id, required this.senderId, required this.receiverId, required this.text, required this.timestamp});

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'senderId': senderId,
//       'receiverId': receiverId,
//       'text': text,
//       'timestamp': timestamp,
//     };
//   }

//   factory Message.fromMap(Map<String, dynamic> map) {
//     return Message(
//       id: map['id'],
//       senderId: map['senderId'],
//       receiverId: map['receiverId'],
//       text: map['text'],
//       timestamp: map['timestamp'],
//     );
//   }
// }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Messaging',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ChatScreen(),
//     );
//   }
// }

// // class ChatScreen extends StatefulWidget {
// //   @override
// //   _ChatScreenState createState() => _ChatScreenState();
// // }

// // class _ChatScreenState extends State<ChatScreen> {
// //   final TextEditingController _textController = TextEditingController();
// //   late Future<List<Message>> _messagesFuture;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _messagesFuture = _loadMessages();
// //   }

// //   Future<List<Message>> _loadMessages() async {
// //     List<Map<String, dynamic>> queryRows =
// //         await DatabaseHelper.instance.queryAllRows(
// //             senderId: 1, receiverId: 2); // Simulating messages between users 1 and 2
// //     return queryRows.map((row) => Message.fromMap(row)).toList();
// //   }

// //   void _sendMessage() async {
// //     String text = _textController.text;
// //     if (text.isNotEmpty) {
// //       Message message = Message(
// //           senderId: 1,
// //           receiverId: 2,
// //           text: text,
// //           timestamp: DateTime.now().millisecondsSinceEpoch); // Simulating user 1 sending a message to user 2
// //       await DatabaseHelper.instance.insert(message.toMap());
// //       setState(() {
// //         _messagesFuture = _loadMessages();
// //       });
// //       _textController.clear();
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Flutter Messaging'),
// //       ),
// //       body: Column(
// //         children: <Widget>[
// //           Expanded(
// //             child: FutureBuilder(
// //               future: _messagesFuture,
// //               builder: (context, AsyncSnapshot<List<Message>> snapshot) {
// //                 if (snapshot.connectionState == ConnectionState.waiting) {
// //                   return Center(
// //                     child: CircularProgressIndicator(),
// //                   );
// //                 }
// //                 if (snapshot.hasError) {
// //                   return Center(
// //                     child: Text('Error: ${snapshot.error}'),
// //                   );
// //                 }
// //                 List<Message> messages = snapshot.data!;
// //                 return ListView.builder(
// //                   itemCount: messages.length,
// //                   itemBuilder: (context, index) {
// //                     return ListTile(
// //                       title: Text(messages[index].text),
// //                       subtitle: Text(DateTime.fromMillisecondsSinceEpoch(
// //                               messages[index].timestamp)
// //                           .toString()),
// //                     );
// //                   },
// //                 );
// //               },
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Row(
// //               children: <Widget>[
// //                 Expanded(
// //                   child: TextField(
// //                     controller: _textController,
// //                     decoration: InputDecoration(
// //                       hintText: 'Enter your message...',
// //                     ),
// //                   ),
// //                 ),
// //                 IconButton(
// //                   icon: Icon(Icons.send),
// //                   onPressed: _sendMessage,
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// class ChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _textController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Messaging'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: StreamBuilder(
//               stream: _loadMessagesStream(),
//               builder: (context, AsyncSnapshot<List<Message>> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 if (snapshot.hasError) {
//                   return Center(
//                     child: Text('Error: ${snapshot.error}'),
//                   );
//                 }
//                 List<Message> messages = snapshot.data!;
//                 return ListView.builder(
//                   itemCount: messages.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(messages[index].text),
//                       subtitle: Text(DateTime.fromMillisecondsSinceEpoch(messages[index].timestamp).toString()),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: TextField(
//                     controller: _textController,
//                     decoration: InputDecoration(
//                       hintText: 'Enter your message...',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: _sendMessage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Stream<List<Message>> _loadMessagesStream() async* {
//     while (true) {
//       List<Map<String, dynamic>> queryRows =
//           await DatabaseHelper.instance.queryAllRows(
//               senderId: 1, receiverId: 2); // Simulating messages between users 1 and 2
//       yield queryRows.map((row) => Message.fromMap(row)).toList();
//       await Future.delayed(Duration(seconds: 1)); // Update messages every 1 second (for demonstration)
//     }
//   }

//   Future<void> _sendMessage() async {
//     String text = _textController.text;
//     if (text.isNotEmpty) {
//       Message message = Message(
//           senderId: 1,
//           receiverId: 2,
//           text: text,
//           timestamp: DateTime.now().millisecondsSinceEpoch); // Simulating user 1 sending a message to user 2
//       await DatabaseHelper.instance.insert(message.toMap());
//       _textController.clear();
//     }
//   }
// }
