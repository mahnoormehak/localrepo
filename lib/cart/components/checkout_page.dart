import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:localrepo/cart/components/success_dialog.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String selectedAddress = "";
  String selectedCard = "";
  String selectedCardType = "";
  List<String> addresses = [
    "92 Alahly st, Dokki, Cairo",
    "1234 Elm St, Springfield, IL",
  ];
  List<String> cards = [];

  TextEditingController addressController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  void _addNewAddress() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: const Text(
            "Add New Address",
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: TextField(
            controller: addressController,
            decoration: const InputDecoration(
              hintText: "Enter new address",
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  addresses.add(addressController.text);
                  selectedAddress = addressController.text;
                  addressController.clear();
                });
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _addNewCard(String cardType) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text(
            "Add New $cardType Card",
            style: const TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: cardNumberController,
                decoration: const InputDecoration(
                  hintText: "Card Number",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(16),
                ],
              ),
              const SizedBox(height: 8),
              TextField(
                controller: expiryDateController,
                decoration: const InputDecoration(
                  hintText: "Expiry Date (MM/YY)",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                ),
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: cvvController,
                decoration: const InputDecoration(
                  hintText: "CVV",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (cardNumberController.text.isEmpty ||
                    expiryDateController.text.isEmpty ||
                    cvvController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("All fields are required."),
                    ),
                  );
                } else {
                  setState(() {
                    cards.add(
                      "$cardType **** **** **** ${cardNumberController.text.substring(cardNumberController.text.length - 4)}",
                    );
                    cardNumberController.clear();
                    expiryDateController.clear();
                    cvvController.clear();
                  });
                  Navigator.of(context).pop();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _confirmPayment() {
    if (selectedCardType.isEmpty || selectedAddress.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select a payment method and address."),
        ),
      );
    } else {
      Get.to(() => const OrderSuccessScreen());
    }
  }

  void _selectCard(String card) {
    setState(() {
      selectedCard = card;
    });
  }

  void _deleteCard(String card) {
    setState(() {
      cards.remove(card);
      if (selectedCard == card) {
        selectedCard = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Payment Method",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCardType = "Debit";
                      });
                      _addNewCard("Debit");
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: selectedCardType == "Debit"
                            ? Colors.deepPurple[100]
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/debit-card.svg",
                            height: 100,
                          ),
                          const SizedBox(height: 8),
                          const Text("Debit Card"),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCardType = "Credit";
                      });
                      _addNewCard("Credit");
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: selectedCardType == "Credit"
                            ? Colors.deepPurple[100]
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/credit-card.svg",
                            height: 100,
                          ),
                          const SizedBox(height: 8),
                          const Text("Credit Card"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Saved Cards",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Column(
              children: cards.map((card) {
                return ListTile(
                  leading: SvgPicture.asset(
                    card.startsWith('Credit')
                        ? "assets/icons/credit-card.svg"
                        : "assets/icons/debit-card.svg",
                    height: 50,
                  ),
                  title: Text(card),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => _selectCard(card),
                        icon: Icon(
                          Icons.check_circle,
                          color:
                              selectedCard == card ? Colors.blue : Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () => _deleteCard(card),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Text(
              "Shipping Address",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Column(
              children: addresses.map((address) {
                return ListTile(
                  title: Text(address),
                  trailing: Radio(
                    value: address,
                    groupValue: selectedAddress,
                    onChanged: (value) {
                      setState(() {
                        selectedAddress = value.toString();
                      });
                    },
                  ),
                );
              }).toList(),
            ),
            TextButton(
              onPressed: _addNewAddress,
              child: const Text("Add new address"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _confirmPayment,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: const Text(
                  "Confirm Payment",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
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
// import 'package:get/get.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:localrepo/cart/components/success_dialog.dart';

// class CheckoutPage extends StatefulWidget {
//   const CheckoutPage({super.key});

//   @override
//   _CheckoutPageState createState() => _CheckoutPageState();
// }

// class _CheckoutPageState extends State<CheckoutPage> {
//   String selectedAddress = "";
//   String selectedCardType = "";
//   List<String> addresses = [
//     "92 Alahly st, Dokki, Cairo",
//     "1234 Elm St, Springfield, IL",
//   ];
//   List<String> cards = [];

//   TextEditingController addressController = TextEditingController();
//   TextEditingController cardNumberController = TextEditingController();
//   TextEditingController expiryDateController = TextEditingController();
//   TextEditingController cvvController = TextEditingController();

//   void _addNewAddress() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text("Add New Address"),
//           content: TextField(
//             controller: addressController,
//             decoration: const InputDecoration(hintText: "Enter new address"),
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
//               child: const Text("Add"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _addNewCard(String cardType) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Add New $cardType Card"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: cardNumberController,
//                 decoration: const InputDecoration(hintText: "Card Number"),
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 controller: expiryDateController,
//                 decoration:
//                     const InputDecoration(hintText: "Expiry Date (MM/YY)"),
//                 keyboardType: TextInputType.datetime,
//               ),
//               TextField(
//                 controller: cvvController,
//                 decoration: const InputDecoration(hintText: "CVV"),
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
//                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                     content: Text("All fields are required."),
//                   ));
//                 } else {
//                   setState(() {
//                     cards.add(
//                         "$cardType **** **** **** ${cardNumberController.text.substring(cardNumberController.text.length - 4)}");
//                     cardNumberController.clear();
//                     expiryDateController.clear();
//                     cvvController.clear();
//                   });
//                   Navigator.of(context).pop();
//                 }
//               },
//               child: const Text("Add"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _confirmPayment() {
//     if (selectedCardType.isEmpty || selectedAddress.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text("Please select a payment method and address."),
//       ));
//     } else {
//       Get.to(() => const OrderSuccessScreen());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Checkout"),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Payment Method",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedCardType = "Debit";
//                       });
//                       _addNewCard("Debit");
//                     },
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 8.0),
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: selectedCardType == "Debit"
//                             ? Colors.deepPurple[100]
//                             : Colors.grey[200],
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Column(
//                         children: [
//                           SvgPicture.asset(
//                             "assets/icons/debit-card.svg",
//                             height: 80,
//                           ),
//                           const SizedBox(height: 8),
//                           const Text("Debit Card"),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedCardType = "Credit";
//                       });
//                       _addNewCard("Credit");
//                     },
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 8.0),
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: selectedCardType == "Credit"
//                             ? Colors.deepPurple[100]
//                             : Colors.grey[200],
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Column(
//                         children: [
//                           SvgPicture.asset(
//                             "assets/icons/credit-card.svg",
//                             height: 80,
//                           ),
//                           const SizedBox(height: 8),
//                           const Text("Credit Card"),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               "Saved Cards",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//             const SizedBox(height: 8),
//             Column(
//               children: cards.map((card) {
//                 return ListTile(
//                   leading: SvgPicture.asset(
//                     "assets/icons/credit-card.svg",
//                     height: 40,
//                   ),
//                   title: Text(card),
//                 );
//               }).toList(),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               "Shipping Address",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//             const SizedBox(height: 8),
//             Column(
//               children: addresses.map((address) {
//                 return ListTile(
//                   title: Text(address),
//                   trailing: Radio(
//                     value: address,
//                     groupValue: selectedAddress,
//                     onChanged: (value) {
//                       setState(() {
//                         selectedAddress = value.toString();
//                       });
//                     },
//                   ),
//                 );
//               }).toList(),
//             ),
//             TextButton(
//               onPressed: _addNewAddress,
//               child: const Text("Add new address"),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _confirmPayment,
//               child: Container(
//                 width: double.infinity,
//                 alignment: Alignment.center,
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 child: const Text(
//                   "Confirm Payment",
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




