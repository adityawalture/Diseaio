// // ignore_for_file: prefer_const_constructors, prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class GetUser extends StatelessWidget {
//   final String documentId;

//   GetUser({required this.documentId});

//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance;
//     CollectionReference users = FirebaseFirestore.instance.collection('users').where('uid', isEqualTo: user.user!.uid).snapshots();

//     return FutureBuilder<DocumentSnapshot>(
//         future: users.doc(documentId).get(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             Map<String, dynamic> data =
//                 snapshot.data!.data() as Map<String, dynamic>;
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 '${data['first name']}' +
//                     ' ' +
//                     '${data['last name']}' +
//                     '\nmail: ${data['email']}' +
//                     '\nAge :${data['age']}',
//                 style: GoogleFonts.robotoCondensed(
//                   textStyle: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//             );
//           }
//           return CircularProgressIndicator();
//         });
//   }
// }
