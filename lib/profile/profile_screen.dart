import 'package:flutter/material.dart';
import 'package:localrepo/contract_page/contract_page.dart';
import 'package:localrepo/custom_widgets/button.dart';
import 'package:localrepo/homescreens/home_screen.dart';
import 'package:localrepo/profile/edit_profile.dart';
import 'package:localrepo/rental_agreement/agreement_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const String profile = '/profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: const Center(
          child: Text(
            'Profile',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.wallet),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const CircleAvatar(
            radius: 60.0,
            backgroundColor: Colors.brown,
            //       backgroundImage: AssetImage('assets/profile_image.jpg'),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Mahnoor Iqbal',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'mahnooriqbal@gmail.com',
            style: TextStyle(fontSize: 17, color: Colors.black),
          ),
          ListTile(
            trailing: const Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.blue,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditProfileScreen()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.policy,
              color: Colors.black,
            ),
            title: const Text(
              'Policies',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ContractPage()));
            },
          ),

          // Other ListTiles...

          const SizedBox(
            height: 100,
          ),
          Center(
            child: CustomButton(
              text: 'Signout',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RentalAgreementScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
