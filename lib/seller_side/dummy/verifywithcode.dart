import 'package:flutter/material.dart';
import 'package:localrepo/seller_side/utils/colors.dart';
import 'package:localrepo/seller_side/widgets/button.dart';
import 'package:localrepo/seller_side/widgets/otp_input.dart';

//import 'package:url_launcher/url_launcher.dart';  // To open WhatsApp

class VerifyWithCode extends StatefulWidget {
  @override
  _VerifyWithCodeState createState() => _VerifyWithCodeState();
}

class _VerifyWithCodeState extends State<VerifyWithCode> {
 // final TextEditingController _phoneController = TextEditingController();
  //final TextEditingController _codeController = TextEditingController();
  //String? _verificationCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Phone Verification'),
      // ),
      body: Padding(
        padding: const EdgeInsets.only(top: 250,bottom: 50),
        child: Center(
             child:
            Padding(
              padding: const EdgeInsets.fromLTRB(40,0,100,12), // Adjust padding as needed
              child:
             Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter the code",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              Text(
                "Please enter the 6-digit code sent via WhatsApp to ",
                style: TextStyle(fontSize: 18),
              ),
              Container(
                width: 600,
                child:OTPInputField()),
              //CustomTextField(controller: _phoneController, Text: 'Enter email'),
              Spacer(),
              Center(child: CustomButton(
                    text: 'Next',
                    color: AppColors.btncolor,
                    fontcolor: Colors.white,
                    onPressed: () {
                     // _sendCodeViaWhatsApp, 
                    },
                  ) ,)
             
             
           
             
              // ElevatedButton(
              //   onPressed:(){},
              //   // _verifyCode,
              //   child: Text('Verify Code'),
              // ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}