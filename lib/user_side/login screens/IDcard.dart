import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class IdCardVerificationScreen extends StatefulWidget {
  @override
  _IdCardVerificationScreenState createState() =>
      _IdCardVerificationScreenState();
}

class _IdCardVerificationScreenState
    extends State<IdCardVerificationScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idCardNumberController =
      TextEditingController();
  final TextEditingController _entryDateController = TextEditingController();
  final TextEditingController _expiryDateController =
      TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveDataToDatabase(BuildContext context) async {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please pick an image')),
      );
      return;
    }

    // Prepare data to save into database
    Map<String, dynamic> row = {
      'imagePath': _image!.path,
      'name': _nameController.text,
      'idCardNumber': _idCardNumberController.text,
      'entryDate': _entryDateController.text,
      'expiryDate': _expiryDateController.text,
    };

    // Save data into database
    await DatabaseHelper1.instance.insertIdCard(row);

    // Clear form fields and image after saving
    _nameController.clear();
    _idCardNumberController.clear();
    _entryDateController.clear();
    _expiryDateController.clear();
    setState(() {
      _image = null;
    });

    // Show confirmation dialog or navigate to another screen
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Saved Successfully'),
          content: Text('Data saved to database.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ID Card Verification'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _image == null
                ? GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add_a_photo,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      _image!,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
            SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _idCardNumberController,
              decoration: InputDecoration(
                labelText: 'ID Card Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _entryDateController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Entry Date',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context, _entryDateController),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _expiryDateController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Expiry Date',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context, _expiryDateController),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveDataToDatabase(context),
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text = picked.toIso8601String().split('T').first; // Format date as needed
    }
  }
}

class DatabaseHelper1 {
  static final DatabaseHelper1 instance = DatabaseHelper1._instance();
  static Database? _db;

  DatabaseHelper1._instance();

  String idCardTable = 'idCardTable';
  String colId = 'id';
  String colImagePath = 'imagePath';
  String colName = 'name';
  String colIdCardNumber = 'idCardNumber';
  String colEntryDate = 'entryDate';
  String colExpiryDate = 'expiryDate';

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, 'idCard.db');
    final idCardDb =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return idCardDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $idCardTable(
        $colId INTEGER PRIMARY KEY AUTOINCREMENT,
        $colImagePath TEXT,
        $colName TEXT,
        $colIdCardNumber TEXT,
        $colEntryDate TEXT,
        $colExpiryDate TEXT
      )
    ''');
  }

  Future<int> insertIdCard(Map<String, dynamic> row) async {
    Database? db = await this.db;
    final int result = await db!.insert(idCardTable, row);
    return result;
  }
}

void main() {
  runApp(MaterialApp(
    home: IdCardVerificationScreen(),
  ));
}

