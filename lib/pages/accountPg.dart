// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPg extends StatefulWidget {
  const AccountPg({super.key});

  @override
  State<AccountPg> createState() => _AccountPgState();
}

class _AccountPgState extends State<AccountPg> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 58, 58, 59),
      appBar: AppBar(
        title: Text(
          'Account',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            fontSize: 28,
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 200,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      user.email!,
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
