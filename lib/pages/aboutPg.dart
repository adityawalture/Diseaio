import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 58, 58, 59),
      appBar: AppBar(
        title: Text(
          'About',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}
