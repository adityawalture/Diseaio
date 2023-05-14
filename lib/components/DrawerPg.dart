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
      color: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(
              'assets/diseaio.png',
              fit: BoxFit.fill,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.account_circle_rounded,
              size: 30,
              color: Color(0xff003459),
            ),
            title: Text(
              'Account',
              style: GoogleFonts.roboto(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Color(0xff003459),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  AccountPg(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info_outline,
              size: 30,
              color: Color(0xff003459),
            ),
            title: Text(
              'About',
              style: GoogleFonts.roboto(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Color(0xff003459),
              ),
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
              color: Color(0xff003459),
            ),
            title: Text(
              'Log out',
              style: GoogleFonts.roboto(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Color(0xff003459),
              ),
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
