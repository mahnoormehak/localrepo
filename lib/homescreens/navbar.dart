import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
  final TextEditingController searchcontroller= TextEditingController();
class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    Home1(),
    Search(), 
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
            icon: Icon(Icons.search),
            label: 'Search',
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
//starting the home page from here!!!                      *********************





class Home1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.green,
      ),
   drawer: Drawer(
        child: Container(
          color: Colors.grey[200], 
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue, 
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
              title: Text('Cart items'),
              onTap: () {
              },
            ),
             ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
              },
            ),
             ListTile(
              leading: Icon(Icons.wallet),
              title: Text('Wallet'),
              onTap: () {
              },
            ),
              ListTile(
              leading: Icon(Icons.notification_add),
              title: Text('Notifications'),
              onTap: () {
              },
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
              leading: Icon(Icons.logout),
              title: Text('Sign out '),
              onTap: () {
              },
              
            ),
          
        ],
       )
 
      ),
   ),
      body: Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40,30,40,10),
        child: Column(
          children: [
            
        TextFormField(
      controller: SearchController(),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search,color: const Color.fromARGB(255, 99, 11, 11),),
        labelText: 'Search',
        // suffix: requi,
        enabledBorder: OutlineInputBorder(
          
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.orange),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.purple),
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
       ),
         
    
          ],
        ),
      ),
      ),
    
    );
  }
}

//                                    search screen here 

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        title: const Text('Search Screen'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Search Page nothing feel like but boring'),
      ),
    );
  }
}



//                                                 category screen here 
class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
          appBar: AppBar(
        title: const Text('Categories Screen'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
            
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 18,
                    children: List.generate(
                      20,
                      (index) => Container(
                        color: Color.fromARGB(255, 214, 165, 226),
                        child: Center(
                          child:Column(
                            children: [
                              Text(  'index $index'),
                   //           Text('items $index')
                            ],
                          )
                       
                            
                          ),
                         
                        ),
                      ),
                    ),
                  ),
                
          ],
        ),
      ),
    );
  }
}








































































class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        title: const Text('Profile Screen'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Profile Page'),
      ),
    );
  }
}

