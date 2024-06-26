// import 'package:flutter/material.dart';
// import 'package:localrepo/seller_side/dummy/code.dart';
// import 'package:localrepo/seller_side/utils/colors.dart';
// import 'package:localrepo/seller_side/widgets/button.dart';
// import 'package:localrepo/seller_side/widgets/textfield.dart';
// //import 'package:url_launcher/url_launcher.dart';  // To open WhatsApp

// class PhoneVerificationScreen extends StatefulWidget {
//   @override
//   _PhoneVerificationScreenState createState() => _PhoneVerificationScreenState();
// }

// class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
//   final TextEditingController _phoneController = TextEditingController();
//   //final TextEditingController _codeController = TextEditingController();
//   //String? _verificationCode;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Phone Verification'),
//       // ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 250,bottom: 50),
//         child: Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0), // Adjust padding as needed
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                     padding: const EdgeInsets.fromLTRB(5,0,100,12),
//                     child: Text(
//                       "Verify Phone Number",
//                       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//               Padding(
//                     padding: const EdgeInsets.fromLTRB(5,0,100,12),
//                     child: Text(
//                       "For your security, we'll send a verification code to make sure this number is yours.",
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ),
//               Container(
//                 width: 600,
//                 child: PhoneTextField(controller: _phoneController, labelText: 'Enter phone number')),
//               //CustomTextField(controller: _phoneController, Text: 'Enter email'),
//               Spacer(),
//               Center(child: CustomButton(
//                     text: 'Send code via WhatsApp',
//                     color: AppColors.btncolor,
//                     fontcolor: Colors.white,
//                     onPressed: () {
//                        Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => PineCodeScreen()),
//                   );
//                      // _sendCodeViaWhatsApp, 
//                     },
//                   ) ,)
             
             
           
             
//               // ElevatedButton(
//               //   onPressed:(){},
//               //   // _verifyCode,
//               //   child: Text('Verify Code'),
//               // ),
//             ],
//           ),
//         ),
//         ),
//       ),
//     );
//   }
// }
//   // void _sendCodeViaWhatsApp() async {
//   //   String phone = _phoneController.text;
//   //   _verificationCode = _generate6DigitCode();  // Generate a 6-digit code
//   //   String message = "Your verification code is $_verificationCode";

//   //   String whatsappUrl = "whatsapp://send?phone=$phone&text=$message";
//   //   if (await canLaunch(whatsappUrl)) {
//   //     await launch(whatsappUrl);
//   //   } else {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('WhatsApp is not installed on this device')),
//   //     );
//   //   }
//   // }

// //   String _generate6DigitCode() {
// //     // Generate a 6-digit code
// //     return (100000 + (900000 * (new DateTime.now().millisecondsSinceEpoch % 1000000) / 1000000)).floor().toString();
// //   }

// //   void _verifyCode() {
// //     String enteredCode = _codeController.text;
// //     if (enteredCode == _verificationCode) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Code verified successfully!')),
// //       );
// //     } else {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Invalid verification code')),
// //       );
// //     }
// //   }
// // }
