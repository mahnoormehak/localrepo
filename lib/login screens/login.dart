import 'package:flutter/material.dart';
import 'package:localrepo/Database/authentication.dart';
import 'package:localrepo/Database/localdb.dart';
import 'package:localrepo/custom_widgets/button.dart';
import 'package:localrepo/custom_widgets/textfield.dart';
// import 'package:localrepo/homescreens/navbar.dart';
import 'package:localrepo/login%20screens/forgotpass.dart';
import 'package:localrepo/login%20screens/signUP.dart';
import 'package:localrepo/routes.dart';
// import 'package:localrepo/onboarding_content/onboarding/data/data.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

<<<<<<< HEAD
class LOGIN extends StatelessWidget {
  LOGIN({super.key});

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // Initial color
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'Welcome to Equishare living',
                        textStyle: const TextStyle(
                          fontSize: 27,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 95, 67, 160),
                        ),
                      ),
                      TyperAnimatedText(
                        'Your rental adventure begins here!!!!!',
                        textStyle: const TextStyle(
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 95, 67, 160),
=======
class LOGIN extends StatefulWidget {
  LOGIN({ required  key}): super(key: key);

  @override
  State<LOGIN> createState() => _LOGINState();
}

class _LOGINState extends State<LOGIN> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool isVisible = true;
 //  final LocalDatabase _localDatabase = LocalDatabase(); 
   final DBHelper _dbHelper = DBHelper();
void login() async {
  final form = formkey.currentState;
  if (form!.validate()) {
    String email = emailController.text;
    String password = passwordController.text;
    
    // Retrieve user data from the database
    Map<String, dynamic> userData = await DBHelper.AuthenticateUser(email);

    // Check if user exists
    if (userData.isNotEmpty && userData['email'] == email) {
      // Use the updated password if available
      String storedPassword = userData['updatedPassword'] != null ? userData['updatedPassword'] : userData['password'];

      // Compare stored password with entered password
      if (storedPassword == password) {
        // Passwords match, proceed with login
        // Show a snackbar for successful login
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login successful!'),
            duration: Duration(seconds: 3),
            backgroundColor: Color.fromARGB(255, 224, 121, 144),
            behavior: SnackBarBehavior.floating,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            action: SnackBarAction(
              label: 'OK',
              textColor: Colors.white,
              onPressed: () {},
            ),
          ),
        );
        // Navigate to the next screen after a short delay
        Future.delayed(Duration(seconds: 2), () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        });
      } else {
        // Passwords don't match, show error message
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
                side: BorderSide(color: Color.fromARGB(255, 43, 23, 114), width: 3),
              ),
              title: Text("Incorrect Password"),
              content: Text("The password you entered is incorrect!"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "OK",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            );
          },
        );
      }
    } else {
      // User not found, show error message
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
              side: BorderSide(color: Color.fromARGB(255, 43, 23, 114), width: 3),
            ),
            title: Text("User Not Found"),
            content: Text("No user found with the provided email!"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "OK",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          );
        },
      );
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'Welcome to Equishare living',
                      textStyle: TextStyle(
                        fontSize: 27,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 95, 67, 160),
                      ),
                    ),
                    TyperAnimatedText(
                      'Your rental adventure begins here!!!!!',
                      textStyle: TextStyle(
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 95, 67, 160),
                      ),
                      
                    ),
                    
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  child: Center(
                    child: Lottie.asset(
                      'assets/lotties/2.json', // Adjust the path to match your animation file
                      height: 250, // Adjust the height as needed
                      width: 350,
                     
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Log in to your account and shape your rental lifestyle! ',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 40, 143, 45),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  child: Form(
                      key: formkey,
                    child: Column(
                      children: [
                         TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Enter Email Address',
                      prefixIcon:Icon(Icons.email) ,
                          enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(color: Colors.orange, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(color: Colors.purple, width: 3),
                                ),
                                filled: true,
                                fillColor: Colors.white,)),  
                        SizedBox(height: 15),       TextFormField(
                    obscureText: !isVisible,
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'password is required';
                      }else if (value.length < 8) {
                                return 'Password must be at least 8 characters long';
                              }
                              return null;
                      
                    },
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: ' Password',
                      suffixIcon: IconButton(
                        onPressed: (){
                        setState(() {
                          isVisible =!isVisible;
                        });
                      },
                        icon: Icon(
                                  isVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      ),
                    
                     enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(color: Colors.orange, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(color: Colors.purple,width: 3),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                    ),   
                    
                                     ),
                                                          
                     //   SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => forgotP()));
                              },
                              child: Text(
                                'Forget password?',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 81, 100),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: 'Login',
                  onPressed: () {
                    login();
                   // Navigator.push(context, MaterialPageRoute(builder: (context) => LOGIN(key: null,)));
                  },
                ),
       
              SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have an account?',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => signup()));
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                         //   color: Color.fromARGB(255, 255, 81, 100),
                          ),
>>>>>>> d34cf9279b94f2760c354f3b1da40a48d181d321
                        ),
                      ),
                    ],
                  ),
<<<<<<< HEAD
                  const SizedBox(
                    height: 20,
                  ),

                  Center(
                    child: Lottie.asset(
                      'assets/lotties/2.json', // Adjust the path to match your animation file
                      height: 250, // Adjust the height as needed
                      width: 350,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  const Text(
                      'Log in to your account and shape your rental lifestyle! ',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Color.fromARGB(255, 40, 143, 45),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      // CustomTextField(controller: emailController, Text: 'Enter email'),
                      CustomTextField(
                        controller: emailController,
                        text: 'Enter email',
                        icon: Icons.email,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // CustomTextField(controller: passwordController, Text: 'Enter password', ),
                      CustomTextField(
                        controller: emailController,
                        text: 'Enter Password',
                        icon: Icons.password,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const forgotP()));
                            },
                            child: const Text(
                              'Forget password?',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 81, 100),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  //),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    text: 'Login',
                    onPressed: () {
                      // Perform login logic here
                      // If login is successful, navigate to the home screen
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Dont have an account?',
                          style: TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const signup()));
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 81, 100),
                              ),
                            )),
                        //  CustomButton(text: 'Sign Up', onPressed: (){})
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
=======
                ),
              ],
            ),
          ),
        ),
      ),
    );
>>>>>>> d34cf9279b94f2760c354f3b1da40a48d181d321
  }
}
