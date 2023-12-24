import 'package:flutter/material.dart';
import 'package:localrepo/custom_widgets/button.dart';
import 'package:localrepo/custom_widgets/textfield.dart';
import 'package:localrepo/homescreens/agreement.dart';
import 'package:localrepo/homescreens/edit.dart';
import 'package:localrepo/login%20screens/login.dart';
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
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}


// class Home1 extends StatefulWidget {
//   @override
//   _Home1State createState() => _Home1State();
// }

// class _Home1State extends State<Home1> {
//   TextEditingController _searchController = TextEditingController();
//   List<String> items = [
//     'camera',
//     'lens',
//     'tripod',
//     'drone',
//     'gopro',
//     'gimble',
//     'reflector',
//     'microphone',
//     'speaker',
//     'lightning',
//   ];
//   List<String> filteredItems = [];

//   void filterSearchResults(String query) {
//     filteredItems.clear();
//     if (query.isNotEmpty) {
//       for (String item in items) {
//         if (item.toLowerCase().contains(query.toLowerCase())) {
//           filteredItems.add(item);
//         }
//       }
//     }
//     setState(() {});
//   }

//   void selectItem(String item) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ItemDetailsScreen(item: item),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//       backgroundColor: Colors.green,
//       title: Center(child: Text('Home Screen',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),)),

//       actions: [
//         IconButton(onPressed: (){}, icon: Icon(Icons.wallet),)
//       ]),
//            drawer: Drawer(
//         child: Container(
//           color: Colors.grey[200],
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               DrawerHeader(
//                 decoration: BoxDecoration(
//                   color: Colors.brown,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       'EquiShare',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 24,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       'Welcome, User!',
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               ListTile(
//                 leading: Icon(Icons.drag_indicator),
//                 title: Text('Cart items'),
//                 onTap: () {},
//               ),
//               ListTile(
//                 leading: Icon(Icons.settings),
//                 title: Text('Settings'),
//                 onTap: () {},
//               ),
//               ListTile(
//                 leading: Icon(Icons.wallet),
//                 title: Text('Wallet'),
//                 onTap: () {},
//               ),
//               ListTile(
//                 leading: Icon(Icons.notification_add),
//                 title: Text('Notifications'),
//                 onTap: () {},
//               ),
//               ListTile(
//                 leading: Icon(Icons.info),
//                 title: Text('About'),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Profile(),
//                     ),
//                   );
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.logout),
//                 title: Text('Sign out '),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => LOGIN()),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       // body: Column(
//       //   children: <Widget>[
//       //     Padding(
//       //       padding: EdgeInsets.fromLTRB(40, 30, 40, 10),
//       //       child: TextField(
//       //         controller: _searchController,
//       //         onChanged: (value) {
//       //           filterSearchResults(value);
//       //         },
//       //         decoration: InputDecoration(
//       //           labelText: 'Search',
//       //           hintText: 'Search items...',
//       //           prefixIcon: Icon(Icons.search, color: Colors.purpleAccent),
//       //           enabledBorder: OutlineInputBorder(
//       //             borderRadius: BorderRadius.all(Radius.circular(40.0)),
//       //             borderSide: BorderSide(color: Colors.orange),
//       //           ),
//       //           focusedBorder: OutlineInputBorder(
//       //             borderRadius: BorderRadius.all(Radius.circular(40.0)),
//       //             borderSide: BorderSide(color: Colors.purple),
//       //           ),
//       //         ),
//       //       ),
//       //     ),
//       //     Expanded(
//       //       child: ListView.builder(
//       //         itemCount: filteredItems.length,
//       //         itemBuilder: (BuildContext context, int index) {
//       //           return ListTile(
//       //             title: Text(filteredItems[index]),
//       //             onTap: () {
//       //               selectItem(filteredItems[index]);
//       //             },
//       //           );
//       //         },
//       //       ),
//       //     ),
//       //   ],
//       // ),
//     );
//   }
// }




// class ItemDetailsScreen extends StatelessWidget {
//   final String item;

//   ItemDetailsScreen({required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Item Details'),
//       ),
//       body: Center(
//         child: Text(
//           'Selected Item: $item',
//           style: TextStyle(fontSize: 20.0),
//         ),
//       ),
//     );
//   }
// }








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
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.wallet),
                title: Text('Wallet'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.notification_add),
                title: Text('Notifications'),
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
                title: Text('Privacy Policy'),
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
                    MaterialPageRoute(builder: (context) => LOGIN()),
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
  final TextEditingController _deviceNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _rentPriceController = TextEditingController();

  @override
  void dispose() {
    _deviceNameController.dispose();
    _descriptionController.dispose();
    _rentPriceController.dispose();
    super.dispose();
  }

  void _uploadDevice() {
    // Implement logic to upload device details to a database or API
    String deviceName = _deviceNameController.text;
    String description = _descriptionController.text;
    double rentPrice = double.tryParse(_rentPriceController.text) ?? 0.0;

    // Example: Print uploaded details for demonstration purposes
    print('Device Name: $deviceName');
    print('Description: $description');
    print('Rent Price: $rentPrice');
    
    // You can proceed with uploading data to your backend here
    // e.g., make API requests, save to a database, etc.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
              appBar: AppBar(
      backgroundColor: Colors.green,
      title: Center(child: Text('Rent or Sell',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),)),
      leading:  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new),) ,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.wallet),)
      ]),
      body: Padding(
        
        padding: EdgeInsets.fromLTRB(40,40,20,30),

        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          
             Container(
                      width: 130,
                       height: 130,
                       decoration: BoxDecoration(
                        border: Border.all(width: 4,color: Colors.black),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            
                          ),
                        ],
                        shape: BoxShape.circle,
                       )
             ),
        
               buildTextField('Fullname', 'Device name', false),
                 buildTextField('Fullname', 'Description', false),
       
                buildTextField('Fullname', 'Price ', false),
              buildTextField('myname', 'Avaiability', false),
                buildTextField('myname', 'Contact info', false),
                  buildTextField('myname', 'Location', false),
                
                 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                CustomButton(text: 'Cancel', onPressed: (){

                }),
                   CustomButton(text: 'Upload', onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadDeviceScreen()));
                   })
                ],
              ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //      CustomButton(text: 'Upload Device', onPressed: (){
            //   _uploadDevice();
            //   Navigator.pop(context);
            // }),
            //   ],
            // )
          ],
          
        ),
        
      ),
    );
  }
    Widget buildTextField(String labelText , String placeholder, bool ispasswordTextField ){
return Padding(padding: EdgeInsets.only(bottom: 30,left: 20,right: 20),
child: TextFormField(
// obscureText:ispasswordTextField? isObscurepassword : false,
 keyboardType: TextInputType.multiline,
                maxLines: null,
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






















                                                // category screen here 
class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
          appBar: AppBar(
      backgroundColor: Colors.green,
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
      backgroundColor: Colors.green,
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
      ListTile(
       leading: Icon(Icons.notification_add,color: Colors.black,),
        title: Text('Notifications', style: TextStyle(fontSize: 17,fontWeight:FontWeight.normal,color: Colors.black),),
        trailing:  Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
        onTap: (){},
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
          ListTile(
       leading: Icon(Icons.location_history,color: Colors.black,),
        title: Text('Location', style: TextStyle(fontSize: 17,fontWeight:FontWeight.normal,color: Colors.black),),
        trailing:  Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
        onTap: (){},
      ),
        
     
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
  const editScreen({super.key});

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
            SizedBox(height: 20.0),
            Text('User information collected for account creation, bookings, and communication.Personal data, device preferences, and transaction details gathered.Utilized to facilitate rentals, personalize experiences, and enhance services.,Safeguards implemented to protect user information.Information shared with trusted parties for service improvement.Procedures for users to access, modify, or delete their data.',style: TextStyle(fontSize: 17),),
            buildCheckbox(
              'Privacy Policy',
              _privacyPolicyChecked,(value) => setState(() => _privacyPolicyChecked =  value ?? false),
            ),
          SizedBox(height: 10,),
           Text('User information collected  device preferences, and transaction details gathered.Utilized to facilitate rentals, personalize experiences, and enhance services.,Safeguards implemented to protect user information.Information shared with trusted parties for service improvement.Procedures for users to access, modify, or delete their data.',style: TextStyle(fontSize: 17),),
        buildCheckbox('Terms of Services', _termsOfServiceChecked, (value)=> setState(() =>  _termsOfServiceChecked =value ?? false)),
        
        
          
            SizedBox(height: 20,),
             Text('User , personalize experiences, and enhance services.,Safeguards implemented to protect user information.Information shared with trusted parties for service improvement.Procedures for users to access, modify, or delete their data.',style: TextStyle(fontSize: 17),),
            buildCheckbox(
              'Rental Guidelines',
              _rentalGuidelinesChecked,
              (value) => setState(() => _rentalGuidelinesChecked =  value ?? false),
            ),
            // Add more checkboxes for other policies as necessary
            SizedBox(height: 20.0),
            Center(
              child: TextButton(
                onPressed: () {
                  if (_privacyPolicyChecked &&
                      _termsOfServiceChecked &&
                      _rentalGuidelinesChecked) {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>RentalAgreementScreen()));
            
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Agreement Required'),
                          content: Text('Please agree to all policies.'),
                          actions: [
            
                          
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child:
                Text('Agree',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
              ),
            ),
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


