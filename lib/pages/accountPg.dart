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
      backgroundColor: Color.fromARGB(255, 209, 255, 207),
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Text(
              user.email!,
              style:
                  GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
