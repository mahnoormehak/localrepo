import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localrepo/seller_side/providers/userid.dart';
import 'package:localrepo/seller_side/screens/register/address.dart';
import 'package:localrepo/seller_side/screens/register/bankinfo.dart';
import 'package:localrepo/seller_side/screens/register/createaccount.dart';
import 'package:localrepo/seller_side/screens/register/id.dart';

class SignupStepperAlternative extends StatefulWidget {
  @override
  _SignupStepperAlternativeState createState() => _SignupStepperAlternativeState();
}

class _SignupStepperAlternativeState extends State<SignupStepperAlternative> {
  int _currentStep = 0;

  late CreateAccount createAccountScreen;
  late AddressScreen addressScreen;
  late IDCardScreen idCardInfoScreen;
  late BankInfoScreen bankInfoScreen;

  @override
  void initState() {
    super.initState();
    if (!Get.isRegistered<UserIdController>()) {
      Get.put(UserIdController()); // Initialize the controller if not already done
    }
    createAccountScreen = CreateAccount();
    addressScreen = AddressScreen();
    idCardInfoScreen = IDCardScreen();
    bankInfoScreen = BankInfoScreen();
  }

  void _nextStep() {
    if (_currentStep < 3) {
      setState(() {
        _currentStep += 1;
      });
    }
  }

  void _finishSignup() {
    // Complete the signup process
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Signup Complete')),
    );
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep -= 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int userId = Get.find<UserIdController>().getUserId; // Access userId from UserIdController
    List<Widget> _steps = [
      createAccountScreen,
      addressScreen,
      idCardInfoScreen,
      bankInfoScreen,
    ];

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple.shade300, Colors.purple.shade600],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Become a Seller',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Follow the steps to complete your registration',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IndexedStack(
                index: _currentStep,
                children: _steps,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentStep > 0)
                  ElevatedButton(
                    onPressed: _previousStep,
                    child: Text('Back'),
                  ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentStep < _steps.length - 1) {
                      _nextStep();
                    } else {
                      _finishSignup();
                    }
                  },
                  child: Text(_currentStep == _steps.length - 1 ? "" : 'Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
