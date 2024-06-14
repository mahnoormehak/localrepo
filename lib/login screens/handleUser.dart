
import 'package:flutter/material.dart';
import 'package:localrepo/Database/authentication.dart';
//import 'package:your_app_name_here/db_helper.dart'; // Adjust the import based on your project structure

class UserHandleScreen extends StatefulWidget {
  @override
  _UserHandleScreenState createState() => _UserHandleScreenState();
}

class _UserHandleScreenState extends State<UserHandleScreen> {
  List<Map<String, dynamic>> userDataList = [];
  bool isLoading = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchAllUsersData();
  }

  Future<void> fetchAllUsersData() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      List<Map<String, dynamic>> data = await DBHelper.fetchAllUsersData();
      setState(() {
        userDataList = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profiles'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: fetchAllUsersData,
          )
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(child: Text('Error: $errorMessage'))
              : userDataList.isEmpty
                  ? Center(child: Text('No user data found.'))
                  : ListView.builder(
                      itemCount: userDataList.length,
                      itemBuilder: (context, index) {
                        final userData = userDataList[index];
                        return UserInfoContainer(
                          key: ValueKey(userData['id']),
                          userData: userData,
                        );
                      },
                    ),
    );
  }
}

class UserInfoContainer extends StatelessWidget {
  final Map<String, dynamic> userData;

  const UserInfoContainer({
    Key? key,
    required this.userData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name: ${userData['firstName'] ?? ''} ${userData['lastName'] ?? ''}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Email: ${userData['email'] ?? ''}',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            'Phone: ${userData['phone'] ?? ''}',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
