import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/aboutPg.dart';
import '../pages/accountPg.dart';

class DrawPg extends StatefulWidget {
  const DrawPg({super.key});

  @override
  State<DrawPg> createState() => _DrawPgState();
}

class _DrawPgState extends State<DrawPg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 209, 255, 207),
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Image.asset('assets/logo.png'),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.account_circle_rounded,
              size: 30,
              color: Colors.black,
            ),
            title: Text(
              'Account',
              style:
                  GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AccountPg(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info_outline,
              size: 30,
              color: Colors.black,
            ),
            title: Text(
              'About',
              style:
                  GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const About(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout_rounded,
              size: 30,
              color: Colors.black,
            ),
            title: Text(
              'Log out',
              style:
                  GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}