import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localrepo/user_side/cart/components/success_dialog.dart';
class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String selectedAddress = "92 Alahly st, Dokki, Cairo";
  String selectedCard = "**** **** **** 5789";
  List<String> addresses = [
    "92 Alahly st, Dokki, Cairo",
    "1234 Elm St, Springfield, IL",
  ];
  List<String> cards = [
    "**** **** **** 5789",
    "**** **** **** 8690",
  ];

  TextEditingController addressController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  void _addNewAddress() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add New Address"),
          content: TextField(
            controller: addressController,
            decoration: InputDecoration(hintText: "Enter new address"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  addresses.add(addressController.text);
                  selectedAddress = addressController.text;
                  addressController.clear();
                });
                Navigator.of(context).pop();
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _addNewCard() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add New Card"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: "Select Card Type",
                ),
                items: ['Visa', 'MasterCard'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {},
              ),
              TextField(
                controller: cardNumberController,
                decoration: InputDecoration(hintText: "Card Number"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: expiryDateController,
                decoration: InputDecoration(hintText: "Expiry Date"),
                keyboardType: TextInputType.datetime,
              ),
              TextField(
                controller: cvvController,
                decoration: InputDecoration(hintText: "CVV"),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (cardNumberController.text.isEmpty ||
                    expiryDateController.text.isEmpty ||
                    cvvController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("All fields are required."),
                  ));
                } else {
                  setState(() {
                    cards.add(
                        "**** **** **** ${cardNumberController.text.substring(cardNumberController.text.length - 4)}");
                    selectedCard = cards.last;
                    cardNumberController.clear();
                    expiryDateController.clear();
                    cvvController.clear();
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _confirmPayment() {
    if (selectedCard.isEmpty || selectedAddress.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please select a payment method and address."),
      ));
    } else {
      Get.to(() => const OrderSuccessScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "Shipping Address",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(selectedAddress),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: _addNewAddress,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Payment Method",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Column(
              children: cards.map((card) {
                return ListTile(
                  leading: Icon(
                    Icons.credit_card,
                    color: Colors.blue,
                  ),
                  title: Text(card),
                  trailing: Radio(
                    value: card,
                    groupValue: selectedCard,
                    onChanged: (value) {
                      setState(() {
                        selectedCard = value.toString();
                      });
                    },
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: _addNewCard,
              child: Text("Add new card"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _confirmPayment,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "Confirm Payment",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:localrepo/cart/components/success_dialog.dart';

// class CheckoutPage extends StatefulWidget {
//   @override
//   _CheckoutPageState createState() => _CheckoutPageState();
// }

// class _CheckoutPageState extends State<CheckoutPage> {
//   String selectedAddress = "92 Alahly st, Dokki, Cairo";
//   String selectedCard = "**** **** **** 5789";
//   List<String> addresses = [
//     "92 Alahly st, Dokki, Cairo",
//     "1234 Elm St, Springfield, IL",
//   ];
//   List<String> cards = [
//     "**** **** **** 5789",
//     "**** **** **** 8690",
//   ];

//   TextEditingController addressController = TextEditingController();
//   TextEditingController cardNumberController = TextEditingController();
//   TextEditingController expiryDateController = TextEditingController();
//   TextEditingController cvvController = TextEditingController();

//   void _addNewAddress() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Add New Address"),
//           content: TextField(
//             controller: addressController,
//             decoration: InputDecoration(hintText: "Enter new address"),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   addresses.add(addressController.text);
//                   selectedAddress = addressController.text;
//                   addressController.clear();
//                 });
//                 Navigator.of(context).pop();
//               },
//               child: Text("Add"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _addNewCard() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Add New Card"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//                   hintText: "Select Card Type",
//                 ),
//                 items: ['Visa', 'MasterCard'].map((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 onChanged: (newValue) {},
//               ),
//               TextField(
//                 controller: cardNumberController,
//                 decoration: InputDecoration(hintText: "Card Number"),
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 controller: expiryDateController,
//                 decoration: InputDecoration(hintText: "Expiry Date"),
//                 keyboardType: TextInputType.datetime,
//               ),
//               TextField(
//                 controller: cvvController,
//                 decoration: InputDecoration(hintText: "CVV"),
//                 keyboardType: TextInputType.number,
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 if (cardNumberController.text.isEmpty ||
//                     expiryDateController.text.isEmpty ||
//                     cvvController.text.isEmpty) {
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                     content: Text("All fields are required."),
//                   ));
//                 } else {
//                   setState(() {
//                     cards.add(
//                         "**** **** **** ${cardNumberController.text.substring(cardNumberController.text.length - 4)}");
//                     selectedCard = cards.last;
//                     cardNumberController.clear();
//                     expiryDateController.clear();
//                     cvvController.clear();
//                   });
//                   Navigator.of(context).pop();
//                 }
//               },
//               child: Text("Add"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _confirmPayment() {
//     if (selectedCard.isEmpty || selectedAddress.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text("Please select a payment method and address."),
//       ));
//     } else {
//       showOrderSuccessDialog(context);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Checkout"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             Text(
//               "Shipping Address",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             SizedBox(height: 8),
//             Container(
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(selectedAddress),
//                       IconButton(
//                         icon: Icon(Icons.edit),
//                         onPressed: _addNewAddress,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               "Payment Method",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             SizedBox(height: 8),
//             Column(
//               children: cards.map((card) {
//                 return ListTile(
//                   leading: Icon(
//                     Icons.credit_card,
//                     color: Colors.blue,
//                   ),
//                   title: Text(card),
//                   trailing: Radio(
//                     value: card,
//                     groupValue: selectedCard,
//                     onChanged: (value) {
//                       setState(() {
//                         selectedCard = value.toString();
//                       });
//                     },
//                   ),
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 8),
//             TextButton(
//               onPressed: _addNewCard,
//               child: Text("Add new card"),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _confirmPayment,
//               child: Container(
//                 width: double.infinity,
//                 alignment: Alignment.center,
//                 padding: EdgeInsets.symmetric(vertical: 16),
//                 child: Text(
//                   "Confirm Payment",
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:localrepo/cart/components/success_dialog.dart';

// class CheckoutPage extends StatefulWidget {
//   @override
//   _CheckoutPageState createState() => _CheckoutPageState();
// }

// class _CheckoutPageState extends State<CheckoutPage> {
//   String selectedAddress = "92 Alahly st, Dokki, Cairo";
//   String selectedCard = "**** **** **** 5789";
//   List<String> addresses = [
//     "92 Alahly st, Dokki, Cairo",
//     "1234 Elm St, Springfield, IL",
//   ];
//   List<String> cards = [
//     "**** **** **** 5789",
//     "**** **** **** 8690",
//   ];

//   TextEditingController addressController = TextEditingController();
//   TextEditingController cardNumberController = TextEditingController();
//   TextEditingController expiryDateController = TextEditingController();
//   TextEditingController cvvController = TextEditingController();

//   void _addNewAddress() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Add New Address"),
//           content: TextField(
//             controller: addressController,
//             decoration: InputDecoration(hintText: "Enter new address"),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   addresses.add(addressController.text);
//                   selectedAddress = addressController.text;
//                   addressController.clear();
//                 });
//                 Navigator.of(context).pop();
//               },
//               child: Text("Add"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _addNewCard() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Add New Card"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: cardNumberController,
//                 decoration: InputDecoration(hintText: "Card Number"),
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 controller: expiryDateController,
//                 decoration: InputDecoration(hintText: "Expiry Date"),
//               ),
//               TextField(
//                 controller: cvvController,
//                 decoration: InputDecoration(hintText: "CVV"),
//                 keyboardType: TextInputType.number,
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   cards.add(
//                       "**** **** **** ${cardNumberController.text.substring(cardNumberController.text.length - 4)}");
//                   selectedCard = cards.last;
//                   cardNumberController.clear();
//                   expiryDateController.clear();
//                   cvvController.clear();
//                 });
//                 Navigator.of(context).pop();
//               },
//               child: Text("Add"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Checkout"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Shipping Address",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             SizedBox(height: 8),
//             Container(
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(selectedAddress),
//                       IconButton(
//                         icon: Icon(Icons.edit),
//                         onPressed: _addNewAddress,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               "Payment Method",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             SizedBox(height: 8),
//             Column(
//               children: cards.map((card) {
//                 return ListTile(
//                   leading: Icon(
//                     card.contains("Visa") ? Icons.credit_card : Icons.payment,
//                     color: Colors.blue,
//                   ),
//                   title: Text(card),
//                   trailing: Radio(
//                     value: card,
//                     groupValue: selectedCard,
//                     onChanged: (value) {
//                       setState(() {
//                         selectedCard = value.toString();
//                       });
//                     },
//                   ),
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 8),
//             TextButton(
//               onPressed: _addNewCard,
//               child: Text("Add new card"),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle payment confirmation logic here
//               },
//               child: Container(
//                 width: double.infinity,
//                 alignment: Alignment.center,
//                 padding: EdgeInsets.symmetric(vertical: 16),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     showOrderSuccessDialog(context);
//                   },
//                   child: Text(
//                     "Confirm Payment",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
