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
      backgroundColor: Color(0xff00A8E8),
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
              children: [
                Text(
                  user.email!,
                  style: GoogleFonts.roboto(
                      fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
