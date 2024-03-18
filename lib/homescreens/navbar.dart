import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:localrepo/Database/localdb.dart';
import 'package:localrepo/custom_widgets/button.dart';
import 'package:localrepo/custom_widgets/textfield.dart';
import 'package:localrepo/homescreens/agreement.dart';
import 'package:localrepo/homescreens/edit.dart';
import 'package:localrepo/login%20screens/login.dart';
import 'package:localrepo/login%20screens/signUP.dart';
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
    Profile(),
   
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
                    MaterialPageRoute(builder: (context) => signup()),
                  );
                },
              ), 
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Sign out '),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LOGIN()),
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
  Uint8List? _image;
  File? selectedIMage;
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
      backgroundColor: Colors.blue,
      title: Center(child: Text('Rent or Sell',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),)),
      leading:  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new),) ,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.wallet),)
      ]),
      body: Stack(
        children: [
     
         Padding(
          
          padding: EdgeInsets.fromLTRB(20,40,20,30),
        
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                   _image!=null ?
              CircleAvatar(
        radius: 100,
       backgroundImage: MemoryImage(_image!)
             ):
             const  CircleAvatar(
        radius: 100,
         backgroundImage: NetworkImage
        ('https://cdn.pixabay.com/photo/2017/08/30/12/45/girl-2696947_1280.jpg')
             ),
        
           
          //  Positioned(
          //   bottom: -0,
          //   left: 100,right: 100,
          //   child: IconButton(onPressed: (){
          //  //   showImagePickerOption(context);
          //   }, icon: Icon(Icons.add_a_photo))),
          SizedBox(height: 20,),
           TextFormField(
                controller: _deviceNameController,
                decoration: InputDecoration(
                  labelText: 'Device Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ), 
              SizedBox(height: 15,) ,
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ), 
                 SizedBox(height: 15,) ,
              TextFormField(
                controller: _rentPriceController,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ), 
                 SizedBox(height: 15,) ,
              TextFormField(
                controller: _availbilityController,
                decoration: InputDecoration(
                  labelText: 'Availability',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
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
    );
  }



//void showImagePickerOption(BuildContext context){
//   showModalBottomSheet(
//     backgroundColor: Colors.blue[100],
//     context: context, builder: (builder){
// return Padding(
//   padding: const EdgeInsets.all(18.0),
//   child: SizedBox(
//     width: MediaQuery.of(context).size.width,
//      height: MediaQuery.of(context).size.height/4.5,
//      child: Row(
//       children: [
//         Expanded(
//           child: InkWell(
//             onTap: (){
//            //   _pickImageFromGallery();
//             },
//             child: SizedBox(
//               child: Column(
//                 children: [
//                   Icon(Icons.image,size: 70,),
//                   Text('Gallery')
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: InkWell(
//             onTap: (){},
//             child: SizedBox(
//               child: Column(
//                 children: [
//                   Icon(Icons.camera_alt,size: 70,),
//                   Text('Camera',)
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//      ),
//   ),
// );
  }

// Future _pickImageFromGallery() async{
//   final returnImage= 
//   await ImagePicker().pickImage(source: ImageSource.gallery);
//   if(returnImage== null)return;
//   setState(() {
//     selectedIMage= File(returnImage.path);
//     _image= File(returnImage.path).readAsBytesSync();
//   });
//}

 // }




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
        title: Text('Local Data'),
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
          color: Colors.grey[400],
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








































































class Profile extends StatelessWidget {
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
body:Column(
       children:[
    SizedBox(height: 20,),
        CircleAvatar(
              radius: 60.0,
              backgroundColor: Colors.brown,
        //       backgroundImage: AssetImage('assets/profile_image.jpg'),
            ),
          SizedBox(height: 10,),
        Text('Mahnoor Iqbal', style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold,color: Colors.black),),
         SizedBox(height: 5,),
           Text('mahnooriqbal@gmail.com', style: TextStyle(fontSize: 17,color: Colors.black),),
 ListTile(
       trailing : Text('Edit Profile', style: TextStyle(fontSize: 20,fontWeight:FontWeight.normal,color: Colors.blue),),
        onTap: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)=>editScreen()));
        },
      ),
    // Divider(),
    // SizedBox(height: 10,),
      // ListTile(
      //  leading: Icon(Icons.notification_add,color: Colors.black,),
      //   title: Text('Notifications', style: TextStyle(fontSize: 17,fontWeight:FontWeight.normal,color: Colors.black),),
      //   trailing:  Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
      //   onTap: (){},
      // ),
        
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
      //     ListTile(
      //  leading: Icon(Icons.location_history,color: Colors.black,),
      //   title: Text('Location', style: TextStyle(fontSize: 17,fontWeight:FontWeight.normal,color: Colors.black),),
      //   trailing:  Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
      //   onTap: (){},
      // ),
        
     SizedBox(height:100 ,),
Center(child: CustomButton(text: 'Signout', onPressed: (){  
   Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => RentalAgreementScreen(),
  ),
);}
))
  ],
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
  
  bool isObscurepassword = true;
   final nameController = TextEditingController();
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
      body:Container(
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
              buildTextField('Fullname', 'Full name', false),
              buildTextField('myname', 'Last name', false),
                buildTextField('myname', 'Email', false),
                  buildTextField('myname', 'Password', true),
                   buildTextField('myname', 'Phone Number', false),
                      buildTextField('myname', 'Country', false),
                  SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                CustomButton(text: 'Cancel', onPressed: (){}),
                   CustomButton(text: 'Save', onPressed: (){})
                ],
              ),
                  
            ],
          ),
        ),
      ) ,
      
    );
  
  }
  Widget buildTextField(String labelText , String placeholder, bool ispasswordTextField ){
return Padding(padding: EdgeInsets.only(bottom: 30,left: 20,right: 20),
child: TextFormField(
obscureText:ispasswordTextField? isObscurepassword : false,
decoration: InputDecoration(
  suffixIcon: ispasswordTextField ?
  IconButton(onPressed: (){}, 
  icon: Icon(Icons.remove_red_eye, color: Colors.black,),
  ): null,
  contentPadding: EdgeInsets.only(bottom: 5),
  labelText: placeholder,
  hintStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black,

  ),
  // enabledBorder: OutlineInputBorder(
  //   borderRadius: BorderRadius.circular(40),
  //   borderSide: BorderSide(color: Colors.orange)
  // ),
  // focusedBorder: OutlineInputBorder(
  //    borderRadius: BorderRadius.circular(40),
  //   borderSide: BorderSide(color: Colors.purple),
  // )
),



),
);
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



