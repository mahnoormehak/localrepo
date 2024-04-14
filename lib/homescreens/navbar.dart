// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'dart:typed_data';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:localrepo/Database/authentication.dart';
import 'package:localrepo/Database/localdb.dart';
import 'package:localrepo/custom_widgets/button.dart';
import 'package:localrepo/custom_widgets/textfield.dart';
import 'package:localrepo/homescreens/agreement.dart';

import 'package:localrepo/login%20screens/login.dart';
import 'package:localrepo/login%20screens/signUP.dart';
import 'package:localrepo/onboarding_content/onboarding/screens/onboarding.dart';
// import 'package:localrepo/homescreens/contract.dart';

// import 'package:localrepo/login%20screens/login.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
  final TextEditingController searchcontroller= TextEditingController();
class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;
  final List<Widget> _screens = [
    // SearchScreen(), 
      Home(),
UploadDeviceScreen(),
    Categories(),
    Profile( ),
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.plus_one),
            label: 'Rent/Sell',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.purple,
        backgroundColor:Colors.white,
      ),
    );
  }
}





class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HometState();
}

class _HometState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('home screen '),),
       drawer: Drawer(
        child: Container(
          color: Colors.grey[200],
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.brown,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'EquiShare',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Welcome, User!',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.drag_indicator),
                title: Text('My products'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.wallet),
                title: Text('Wallet'),
                onTap: () {},
              ),
            
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About'),
                
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.policy_outlined),
                title: Text('Agreement'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContractPage()),
                  );
                },
              ),
               ListTile(
                leading: Icon(Icons.contact_emergency),
                title: Text('Contact Us ',
                //style: TextStyle(fontSize: 15),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => signup(),
                  ));
                },
              ), 
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Sign out '),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LOGIN(key: null,)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
body: Container(

)
      
    );
  }
}






class UploadDeviceScreen extends StatefulWidget {
  @override
  _UploadDeviceScreenState createState() => _UploadDeviceScreenState();
}

class _UploadDeviceScreenState extends State<UploadDeviceScreen> {
  FilePickerResult?result;
       File? _imageFile;
  String ? _filename;
  PlatformFile? pickedfile;
  bool isloading = false;
  File ? fileToDisplay;
  Uint8List? _image;
  File? selectedImage;
  final TextEditingController _deviceNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _rentPriceController = TextEditingController();
  final TextEditingController _availbilityController = TextEditingController();
    final TextEditingController _qualityController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // Fetch data when the screen initializes
    _fetchData();
  } 
  void dispose() {
    _deviceNameController.dispose();
    _descriptionController.dispose();
    _rentPriceController.dispose();
    _availbilityController.dispose();
    _qualityController.dispose();
  
     String deviceName = _deviceNameController.text;
    String description = _descriptionController.text;
    String rentPrice = _rentPriceController.text;
    String availability= _availbilityController.text;
    String quality = _qualityController.text;


    super.dispose();
  }
   Future<void> _fetchData() async {
    try {
      final data = await LocalDatabase().fetchDataLocally();
      setState(() {
        // Handle fetched data
      });
    } catch (e) {
      print('Error fetching data: $e');
      // Handle error
    }
  }

   


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
              appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 187, 98, 98),
      title: Center(child: Text('Rent or Sell',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),)),
      leading:  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new),) ,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.wallet),)
      ]),
      body: SingleChildScrollView(
        child: Stack(
          children: [
         
           Padding(
            
            padding: EdgeInsets.fromLTRB(20,30,20,30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

Container(
  height: 200,
width: 350,
decoration: BoxDecoration(
  color: Colors.grey[200],
  border: Border.all(color: Colors.black,width: 2),
  borderRadius: BorderRadius.circular(10),
   image: selectedImage != null ? DecorationImage(
      image: FileImage(selectedImage!),
      fit: BoxFit.cover,
    ) : null,
  ),
child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  
   IconButton(onPressed: (){
_pickProfileImage();
  }, icon: Icon(Icons.photo,size: 40,)),
   SizedBox(width: 10), // Adjust the spacing between the icon and the text
      Text(
        'Upload Image',
        style: TextStyle(fontSize: 20),
      ),
  ],
),
),

            SizedBox(height: 20,),
             Padding(
               padding: const EdgeInsets.all(12.0),
               child: Column(
                 children: [
                   TextFormField(
                        controller: _deviceNameController,
                        decoration: InputDecoration(
                          labelText: 'Device Name',
                          prefixIcon: Icon(Icons.production_quantity_limits,
                          color: const Color.fromARGB(255, 134, 43, 10),size:28 ,),
                            enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.orange, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.purple ,width: 3),
          ),
          filled: true,
          fillColor: Colors.white,
                          
                        ),
                      ),
                
                  SizedBox(height: 15,) ,
                  TextFormField(
                    maxLines: 4,
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                       prefixIcon: Icon(Icons.description,
                       color: const Color.fromARGB(255, 134, 43, 10),size:28 ,
                       ),
                     enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.orange, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.purple, width: 3),
          ),
          filled: true,
          fillColor: Colors.white,
                      
                    ),
                  ), 
                     SizedBox(height: 15,) ,
                  TextFormField(
                    controller: _rentPriceController,
                    decoration: InputDecoration(
                      labelText: 'Price',
                       prefixIcon: Icon(Icons.price_change_sharp,color: const Color.fromARGB(255, 134, 43, 10),size:28 ,),
                      enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.orange, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.purple, width: 3),
          ),
          filled: true,
          fillColor: Colors.white,
                    ),
                  ), 
                     SizedBox(height: 15,) ,
                  TextFormField(
                    controller: _availbilityController,
                    decoration: InputDecoration(
                      labelText: 'Availability',
                       prefixIcon: Icon(Icons.event_available,color: const Color.fromARGB(255, 134, 43, 10),size:28 ,),
                      enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.orange, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.purple, width: 3),
          ),
          filled: true,
          fillColor: Colors.white,
                    ),
                  ),
                    ],
               ),
             ), 
                
                   SizedBox(height: 20,) ,
                    
                     
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    CustomButton(text: 'Cancel', onPressed: (){
                      // Call the method to delete all data
           
                       _deviceNameController.clear();
            _descriptionController.clear();
            _rentPriceController.clear();
            _availbilityController.clear();
            _qualityController.clear();
           
            
            // Navigate to the HomeScreen or any other screen if needed
            //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
         
                    }),
                    
                      CustomButton(
            text: 'Upload',
            onPressed: () async { 
              double price = double.parse(_rentPriceController.text);
              int availability = int.parse(_availbilityController.text);
          
            String result =        await LocalDatabase().addDataLocally(
          name: _deviceNameController.text,
          description: _descriptionController.text,
          price: price,
          availability: availability,  
              );
             
            if (result == 'added') {
        // Fetch the data
        List<Map<String, dynamic>>? fetchedData = await LocalDatabase().fetchDataLocally();
        
        // Navigate to the screen where you want to display the fetched data
        if (fetchedData != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => uploadScreen1(fetchedData: fetchedData),
            ),
          );
        } else {
          // Handle case where fetched data is null
          print('Error: Fetched data is null');
        }
            } else {
        // Handle case where data addition failed
        print('Error: Data addition failed');
            } 
          
                       })
                    ],
                  ),
          
              ],
              
            ),
            
          ),
          ]
        ),
      ),
    );
  }
     Future<void> _pickProfileImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery, // Change to ImageSource.camera for camera access
    );

    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }
}








class uploadScreen1 extends StatefulWidget {
    final List<Map<String, dynamic>>? fetchedData;
  const uploadScreen1({Key? key, this.fetchedData}) : super(key: key);

  @override
  State<uploadScreen1> createState() => _uploadScreen1State();
}

class _uploadScreen1State extends State<uploadScreen1> {
   final LocalDatabase _localDatabase = LocalDatabase();
  List<Map<String, dynamic>>? _fetchedData;
  @override
  void initState() {
    super.initState();
   // Assign the fetched data from the widget's property to the local variable
    _fetchedData = widget.fetchedData;
  }
  Future<void> _fetchData() async {
    try {
    final data = (await LocalDatabase().fetchDataLocally()) ?? [];
    setState(() {
    _fetchedData = data ?? [];    // Handle fetched data
    });
  } catch (e) {
    print('Error fetching data: $e');
    // Handle error
  }
}
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('upload device screen'),
      ),
      body: _fetchedData != null
      
          ? ListView.builder(
              itemCount: _fetchedData!.length,
              itemBuilder: (context, index) {
                final item = _fetchedData![index];
             if (item != null) { // Add null check here
   
    return Container(
        margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 25.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                              onPressed: () {
                                _showEditBottomSheet(context, item);
                              },
                              icon: Icon(Icons.edit),
                            ),
 IconButton(
            onPressed: () async {
              // Delete data from the database
               await LocalDatabase().deleteDataLocally(item['id']);
// Fetch updated data from the database
    List<Map<String, dynamic>>? newData = await LocalDatabase().fetchDataLocally();
               // Update the UI with the new data
    setState(() {
      _fetchedData = newData;
    });
            },
            icon: Icon(Icons.delete),
          ),
          
        
              ],
             ),
      
            Text(
            'Name: ${item['Name'] ?? ''}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
                'Description: ${item['description'] ?? ''}',
              style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 17.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Price: ${item['price']?.toString() ?? ''}',
              style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 17.0,),
            ),
            SizedBox(height: 8.0),
            Text(
              'Availability: ${item['availability']?.toString() ?? ''}',
              style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 17.0,),
            ),
          ],
        ),
      );
    } else {
      return SizedBox(); // Return an empty widget or another placeholder
    }
  },
 
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
     // show bottom sheet
     
  }
  void _showEditBottomSheet(BuildContext context, Map<String, dynamic> item) {
    TextEditingController nameController =
        TextEditingController(text: item['Name']);
    TextEditingController descriptionController =
        TextEditingController(text: item['description']);
    TextEditingController priceController =
        TextEditingController(text: item['price']?.toString());
    TextEditingController availabilityController =
        TextEditingController(text: item['availability']?.toString());

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                TextFormField(
                  controller: priceController,
                  decoration: InputDecoration(labelText: 'Price'),
                ),
                TextFormField(
                  controller: availabilityController,
                  decoration: InputDecoration(labelText: 'Availability'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    // Update the item with new values
                    // You can use the controllers' text values to get the updated values
                    // For demonstration, I'm just printing here
                    print('Updated Name: ${nameController.text}');
                    print('Updated Description: ${descriptionController.text}');
                    print('Updated Price: ${priceController.text}');
                    print('Updated Availability: ${availabilityController.text}');

                    // Update the data in the database
                    // For example:
                    await LocalDatabase().updateItemLocally(
                      id: item['id'],
                      name: nameController.text,
                      description: descriptionController.text,
                      price: double.tryParse(priceController.text) ?? 0,
                      availability: int.tryParse(availabilityController.text) ?? 0,
                    );

                    // Refresh the UI to reflect the changes
                    List<Map<String, dynamic>>? newData =
                        await LocalDatabase().fetchDataLocally();
                    setState(() {
                      _fetchedData = newData;
                    });

                    Navigator.pop(context); // Close the bottom sheet
                  },
                  child: Text('Save',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink[600],
                    
                  ),
                  ),
                ),
              ],
            ),
          );
        });
  }

}


















                                                // category screen here 
class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
          appBar: AppBar(
      backgroundColor: Colors.blue.shade100,
      title: Center(child: Text('Categories',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,),)),
      leading:  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new),) ,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.wallet),)
      ]),
    );
  }
}








































































class Profile extends StatefulWidget {
 
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
    Map<String, dynamic> userData = {};
     // File? _imageFile;
      File? _selectedImageFile;

  @override

  void initState() {
    super.initState();
    fetchUserData(); // Fetch user data when the profile screen initializes
  }
   Future<void> fetchUserData() async {
     print('Fetching user data...');
    Map<String, dynamic> data = await DBHelper.fetchUserData();
     print('Fetched user data: $data');
    setState(() {
      userData = data;
    });
  }
  Future<void> _confirmSignOut(BuildContext context) async {
    // Show a confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Sign Out"),
          content: Text("Are you sure you want to sign out?"),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () async {
                // Delete user data and navigate to HomeScreen
                await DBHelper.deleteUserData();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }
   Future<void> _pickProfileImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery, // Change to ImageSource.camera for camera access
    );

    if (image != null) {
      setState(() {
        _selectedImageFile = File(image.path);
      });
    }
  }
   @override
  Widget build(BuildContext context) {
    
   return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue.shade100,
      title: Center(child: Text('Profile',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,),)),
      leading:  IconButton(onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder:
                           (context)=>HomeScreen()));
      }, icon: Icon(Icons.arrow_back_ios_new),) ,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.wallet),)
      ]),
body:SingleChildScrollView(
  child: Column(
         children:[

      SizedBox(height: 20,),

GestureDetector(
  onTap: () {
    _pickProfileImage();
  },
  child: Stack(
    alignment: Alignment.center,
    children: [
      CircleAvatar(
        radius: 90.0,
        backgroundColor: Colors.grey,
        child: _selectedImageFile != null
            ? ClipOval(
                child: Image.file(
                  _selectedImageFile!,
                  fit: BoxFit.cover,
                  width: 190,
                  height: 190,
                ),
              )
            : Text(
                // Display user's initials
                '${userData['firstName'] != null ? userData['firstName'][0] : ''}${userData['lastName'] != null ? userData['lastName'][0] : ''}',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: IconButton(
          onPressed: () {
            _pickProfileImage();
          },
          icon: Icon(Icons.camera_alt,size: 30,color: Color.fromARGB(255, 16, 110, 4),),
        ),
      ),
    ],
  ),
),


            SizedBox(height: 10,),
                Text(
              // Display user's full name
              '${userData['firstName'] ?? ''} ${userData['lastName'] ?? ''}',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
             SizedBox(height: 10),
            Text(
              // Display user's email
              'Email: ${userData['email'] ?? ''}',
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(height: 10),
            Text(
              // Display user's phone number
              'Phone: ${userData['phone'] ?? ''}',
              style: TextStyle(fontSize: 17),
            ),
 
   ListTile(
         trailing : Text('Edit Profile', style: TextStyle(fontSize: 20,fontWeight:FontWeight.normal,color: Colors.blue),),
          onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>editScreen()));
          },
        ),
           ListTile(
         leading: Icon(Icons.policy,color: Colors.black,),
          title: Text('Policies', style: TextStyle(fontSize: 17,fontWeight:FontWeight.normal,color: Colors.black),),
          trailing:  Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
          onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>ContractPage()));
          },
        ),
        
          
           ListTile(
         leading: Icon(Icons.history,color: Colors.black,),
          title: Text('Rent Items', style: TextStyle(fontSize: 17,fontWeight:FontWeight.normal,color: Colors.black),),
          trailing:  Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
          onTap: (){
             Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => UploadDeviceScreen(),
    ),
  );
          },
        ),
     
           ListTile(
         leading: Icon(Icons.message_sharp,color: Colors.black,),
          title: Text('Messages', style: TextStyle(fontSize: 17,fontWeight:FontWeight.normal,color: Colors.black),),
          trailing:  Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
          onTap: (){},
        ),
           
           ListTile(
         leading: Icon(Icons.sell,color: Colors.black,),
          title: Text('Want to sell', style: TextStyle(fontSize: 17,fontWeight:FontWeight.normal,color: Colors.black),),
          trailing:  Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
          onTap: (){
             
          },
        ),
          ListTile(
         leading: Icon(Icons.history_edu_rounded,color: Colors.black,),
          title: Text('Add to cart', style: TextStyle(fontSize: 17,fontWeight:FontWeight.normal,color: Colors.black),),
          trailing:  Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
          onTap: (){},
        ),
     //  SizedBox(height:20 ,),
  Center(child: CustomButton(text: 'Signout', onPressed: (){
    _confirmSignOut(context); 
   } 

  ))
    ],
        ),
),
);
  }
}












class editScreen extends StatefulWidget {
  const editScreen({Key? key}) : super(key: key);

  @override
  State<editScreen> createState() => _editScreenState();
}

class _editScreenState extends State<editScreen> {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 
     final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final countryController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
         appBar: AppBar(
      backgroundColor: Colors.green,
      title: Center(child: Text('Profile',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,),)),
      leading:  IconButton(onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder:
                           (context)=>HomeScreen()));
      }, icon: Icon(Icons.arrow_back_ios_new),) ,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.wallet),)
      ]),
      body: Container(
          padding: EdgeInsets.only(left: 15,top: 20,right: 15),
          child: GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                         height: 130,
                         decoration: BoxDecoration(
                          border: Border.all(width: 4,color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              
                            ),
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(fit: BoxFit.cover,
                            image: NetworkImage('https://cdn.pixabay.com/photo/2017/08/30/12/45/girl-2696947_1280.jpg'))
                         ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 4,
            color: Colors.white,
          ),
          color: Colors.blue,
        ),
        child: Icon(
          Icons.edit, color: Colors.white,
          ),
                      ),
                      ),
        
                    ],
                  ),
                ),
                SizedBox(height: 20,),
        
        
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
              TextFormField(
 
  controller: nameController,
  decoration: InputDecoration(
    labelText: 'Name',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
    ),
  ),

),

                 
                    SizedBox(height: 10,) ,
                    TextFormField(

  controller: lastNameController,
  decoration: InputDecoration(
    labelText: 'Lastname',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
    ),
  ),
  
),

                    SizedBox(height: 10,) ,
                     TextFormField(
                   //    initialValue: _userData['email'],
                     controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'email',
                         
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      
                    ),
                    SizedBox(height: 10,) ,
                     TextFormField(
                     
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,) ,
                     TextFormField(
 
                     controller: phoneNumberController,
                      decoration: InputDecoration(
                        labelText: 'Phone',
                         
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    
                    ),
                      
              ],
              ),
            ),
         
                SizedBox(height: 10,) ,
        
        
        
                    SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  CustomButton(text: 'Cancel', onPressed: (){
                                     nameController.clear();
            lastNameController.clear();
            emailController.clear();
            passwordController.clear();
            countryController.clear();
                  }),
                     CustomButton(text: 'Save', onPressed: ()async{
                 _updateUserData();   }
                     )
                  ],),   ],
            ),
          ),
        ),
      );
  }
    // Method to update user data in the database
  void _updateUserData() async {
    // Get the updated values from text field controllers
    String name = nameController.text;
    String lastName = lastNameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String phone = phoneNumberController.text;

    // Prepare data to update
    Map<String, dynamic> userData = {
      'firstName': name,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phone': phone,
    };

    // Update user data in the database
    await DBHelper.insertAndFetchUser(userData);

    // Navigate back to profile screen
    Navigator.pop(context);
  }
}

  


                                  /// upload rent items on app 



















//          contract page******

class ContractPage extends StatefulWidget {
  @override
  _ContractPageState createState() => _ContractPageState();
}

class _ContractPageState extends State<ContractPage> {
  bool _privacyPolicyChecked = false;
  bool _termsOfServiceChecked = false;
  bool _rentalGuidelinesChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contract'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please agree to the following:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text('User information collected for account creation, bookings, and communication.Personal data, device preferences, and , personalize experiences, and enhance services.,Safeguards implemented to protect user information.Information shared with trusted parties for service improvement.Procedures for users to access, modify, or delete their data.',style: TextStyle(fontSize: 17),),
            buildCheckbox(
              'Privacy Policy',
              _privacyPolicyChecked,(value) => setState(() => _privacyPolicyChecked =  value ?? false),
            ),
          SizedBox(height: 10,),
           Text('User information collected  device preferences, and transaction details gathered.Utilized to facilitate rentals,  protect user information.Information shared with trusted parties for service improvement.Procedures for users to access, modify, or delete their data.',style: TextStyle(fontSize: 17),),
        buildCheckbox('Terms of Services', _termsOfServiceChecked, (value)=> setState(() =>  _termsOfServiceChecked =value ?? false)),
        
        
          
             Text('User , personalize experiences, and enhance services.,Safeguards implemented to protect user information.Information shared with trusted parties for service improvement.Procedures for users to access, modify, or delete their data.',style: TextStyle(fontSize: 17),),
            buildCheckbox(
              'Rental Guidelines',
              _rentalGuidelinesChecked,
              (value) => setState(() => _rentalGuidelinesChecked =  value ?? false),
            ),
            // Add more checkboxes for other policies as necessary
            SizedBox(height: 20.0),
            Center(
              child: CustomButton(text: 'Agree', onPressed: (){
if(_privacyPolicyChecked &&
_termsOfServiceChecked &&
_rentalGuidelinesChecked){
   Navigator.push(context, MaterialPageRoute(builder: (context)=>RentalAgreementScreen()));
} else{
  showDialog(context: context,
  builder: (BuildContext context) {
    return AlertDialog(
       title: Text('Agreement Required'),
                      content: Text('Please agree to all policies.'),
                      actions: [
                        TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('OK'),
                        )
                      ],
    );
  },
  );
}
              }),
            )
            //   child: TextButton(
            //     onPressed: () {
            //       if (_privacyPolicyChecked &&
            //           _termsOfServiceChecked &&
            //           _rentalGuidelinesChecked) {
            //          Navigator.push(context, MaterialPageRoute(builder: (context)=>RentalAgreementScreen()));
            
            //       } else {
            //         showDialog(
            //           context: context,
            //           builder: (BuildContext context) {
            //             return AlertDialog(
            //               title: Text('Agreement Required'),
            //               content: Text('Please agree to all policies.'),
            //               actions: [
            
                          
            //                 TextButton(
            //                   onPressed: () => Navigator.of(context).pop(),
            //                   child: Text('OK'),
            //                 ),
            //               ],
            //             );
            //           },
            //         );
            //       }
            //     },
            //     child:
            //     Text('Agree',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildCheckbox(String title, bool value, ValueChanged<bool?> onChanged) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        Text(title),
      ],
    );
  }
}



