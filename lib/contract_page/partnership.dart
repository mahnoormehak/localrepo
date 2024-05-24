// // import 'package:flutter/material.dart';

// // // class PartnershipScreen extends StatelessWidget {
// // //   final Map<String, dynamic> item;

// // //   PartnershipScreen({required this.item});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Buy ${item['Name']} with Partners'),
// // //       ),
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Text(
// // //               'Partnership Agreement for ${item['Name']}',
// // //               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// // //             ),
// // //             SizedBox(height: 20),
// // //             Expanded(
// // //               child: ListView(
// // //                 children: [
// // //                   Text(
// // //                     'Partners:',
// // //                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // //                   ),
// // //                   PartnerCard(name: 'Partner 1'),
// // //                   PartnerCard(name: 'Partner 2'),
// // //                   PartnerCard(name: 'Partner 3'),
// // //                   PartnerCard(name: 'Partner 4'),
// // //                   SizedBox(height: 20),
// // //                   Text(
// // //                     'Each partner agrees to contribute 25% towards the purchase and share ownership and responsibilities equally.',
// // //                     style: TextStyle(fontSize: 16),
// // //                   ),
// // //                   SizedBox(height: 20),
// // //                   ElevatedButton(
// // //                     onPressed: () {
// // //                       // Implement partnership agreement logic here
// // //                     },
// // //                     child: Text('Agree and Proceed'),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class PartnerCard extends StatelessWidget {
// // //   final String name;

// // //   PartnerCard({required this.name});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Card(
// // //       elevation: 5,
// // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
// // //       child: ListTile(
// // //         leading: Icon(Icons.person),
// // //         title: Text(name),
// // //         subtitle: Text('25% Contribution'),
// // //       ),
// // //     );
// // //   }
// // // }

// // class Partner {
// //   String name;
// //   double contribution;
// //   double ownership;

// //   Partner({required this.name, required this.contribution, required this.ownership});
// // }

// // class PartnershipAgreement {
// //   List<Partner> partners;
// //   String profitLossStrategy;
// //   String exitStrategy;

// //   PartnershipAgreement({
// //     required this.partners,
// //     required this.profitLossStrategy,
// //     required this.exitStrategy,
// //   });
// // }

// // class PartnershipAgreementScreen extends StatefulWidget {
// //   static const String routeName = "/partnership-agreement";
// //   const PartnershipAgreementScreen({super.key, required Map<String, dynamic> item});

// //   @override
// //   _PartnershipAgreementScreenState createState() => _PartnershipAgreementScreenState();
// // }

// // class _PartnershipAgreementScreenState extends State<PartnershipAgreementScreen> {
// //   final List<Partner> partners = [
// //     Partner(name: 'Partner 1', contribution: 0.0, ownership: 0.0),
// //     Partner(name: 'Partner 2', contribution: 0.0, ownership: 0.0),
// //     Partner(name: 'Partner 3', contribution: 0.0, ownership: 0.0),
// //     Partner(name: 'Partner 4', contribution: 0.0, ownership: 0.0),
// //   ];
// //   String profitLossStrategy = '';
// //   String exitStrategy = '';

// //   void _updatePartnerContribution(int index, double contribution) {
// //     setState(() {
// //       partners[index].contribution = contribution;
// //       _updateOwnerships();
// //     });
// //   }

// //   void _updateOwnerships() {
// //     double totalContribution = partners.fold(0.0, (sum, partner) => sum + partner.contribution);
// //     for (var partner in partners) {
// //       partner.ownership = totalContribution > 0 ? (partner.contribution / totalContribution) * 100 : 0.0;
// //     }
// //   }

// //   void _submitAgreement() {
// //     final agreement = PartnershipAgreement(
// //       partners: partners,
// //       profitLossStrategy: profitLossStrategy,
// //       exitStrategy: exitStrategy,
// //     );
// //     // Handle the submission of the agreement (e.g., save to database or navigate to another screen)
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Partnership Agreement'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: ListView(
// //           children: [
// //             ...partners.asMap().entries.map((entry) {
// //               int index = entry.key;
// //               Partner partner = entry.value;
// //               return Card(
// //                 elevation: 3,
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(16.0),
// //                   child: Column(
// //                     children: [
// //                       Text(partner.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //                       SizedBox(height: 10),
// //                       TextField(
// //                         decoration: InputDecoration(labelText: 'Contribution Amount'),
// //                         keyboardType: TextInputType.number,
// //                         onChanged: (value) {
// //                           double contribution = double.tryParse(value) ?? 0.0;
// //                           _updatePartnerContribution(index, contribution);
// //                         },
// //                       ),
// //                       SizedBox(height: 10),
// //                       Text('Ownership: ${partner.ownership.toStringAsFixed(2)}%'),
// //                     ],
// //                   ),
// //                 ),
// //               );
// //             }).toList(),
// //             SizedBox(height: 20),
// //             TextField(
// //               decoration: InputDecoration(labelText: 'Profit and Loss Strategy'),
// //               maxLines: 3,
// //               onChanged: (value) {
// //                 setState(() {
// //                   profitLossStrategy = value;
// //                 });
// //               },
// //             ),
// //             SizedBox(height: 20),
// //             TextField(
// //               decoration: InputDecoration(labelText: 'Exit Strategy'),
// //               maxLines: 3,
// //               onChanged: (value) {
// //                 setState(() {
// //                   exitStrategy = value;
// //                 });
// //               },
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: _submitAgreement,
// //               child: Text('Submit Agreement'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// class Partner {
//   String name;
//   double contribution;
//   double ownership;

//   Partner({required this.name, required this.contribution, required this.ownership});
// }

// class PartnershipAgreement {
//   List<Partner> partners;
//   String profitLossStrategy;
//   String exitStrategy;

//   PartnershipAgreement({
//     required this.partners,
//     required this.profitLossStrategy,
//     required this.exitStrategy,
//   });
// }

// class PartnershipAgreementScreen extends StatefulWidget {
//   static const String routeName = "/partnership-agreement";
//   final Map<String, dynamic> item;

//   const PartnershipAgreementScreen({super.key, required this.item});

//   @override
//   _PartnershipAgreementScreenState createState() => _PartnershipAgreementScreenState();
// }

// class _PartnershipAgreementScreenState extends State<PartnershipAgreementScreen> {
//   final List<Partner> partners = [
//     Partner(name: 'Partner 1', contribution: 0.0, ownership: 0.0),
//     Partner(name: 'Partner 2', contribution: 0.0, ownership: 0.0),
//     Partner(name: 'Partner 3', contribution: 0.0, ownership: 0.0),
//     Partner(name: 'Partner 4', contribution: 0.0, ownership: 0.0),
//   ];
//   String profitLossStrategy = '';
//   String exitStrategy = '';

//   void _updatePartnerContribution(int index, double contribution) {
//     setState(() {
//       partners[index].contribution = contribution;
//       _updateOwnerships();
//     });
//   }

//   void _updateOwnerships() {
//     double totalContribution = partners.fold(0.0, (sum, partner) => sum + partner.contribution);
//     for (var partner in partners) {
//       partner.ownership = totalContribution > 0 ? (partner.contribution / totalContribution) * 100 : 0.0;
//     }
//   }

//   void _submitAgreement() {
//     final agreement = PartnershipAgreement(
//       partners: partners,
//       profitLossStrategy: profitLossStrategy,
//       exitStrategy: exitStrategy,
//     );
//     // Handle the submission of the agreement (e.g., save to database or navigate to another screen)
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Partnership Agreement for ${widget.item['Name']}'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             ...partners.asMap().entries.map((entry) {
//               int index = entry.key;
//               Partner partner = entry.value;
//               return Card(
//                 elevation: 3,
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       Text(partner.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                       SizedBox(height: 10),
//                       TextField(
//                         decoration: InputDecoration(labelText: 'Contribution Amount'),
//                         keyboardType: TextInputType.number,
//                         onChanged: (value) {
//                           double contribution = double.tryParse(value) ?? 0.0;
//                           _updatePartnerContribution(index, contribution);
//                         },
//                       ),
//                       SizedBox(height: 10),
//                       Text('Ownership: ${partner.ownership.toStringAsFixed(2)}%'),
//                     ],
//                   ),
//                 ),
//               );
//             }).toList(),
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(labelText: 'Profit and Loss Strategy'),
//               maxLines: 3,
//               onChanged: (value) {
//                 setState(() {
//                   profitLossStrategy = value;
//                 });
//               },
//             ),
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(labelText: 'Exit Strategy'),
//               maxLines: 3,
//               onChanged: (value) {
//                 setState(() {
//                   exitStrategy = value;
//                 });
//               },
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _submitAgreement,
//               child: Text('Submit Agreement'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

