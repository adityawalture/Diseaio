// ignore_for_file: prefer_const_constructors, avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Password link sent to your email'),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot Password',
          style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
        ),
      ),
      backgroundColor: Color(0xff000000),
      body: Column(
        children: [
          SizedBox(height: 80),
          Text(
            'Enter email to reset password',
            style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
          ),
          SizedBox(height: 20),
          //email textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromARGB(255, 102, 100, 100),
                  border: Border.all(color: Colors.black)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'e-mail@gmail.com',
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            style: ButtonStyle(
              // elevation: MaterialStateProperty.all(8),
              backgroundColor: MaterialStateProperty.all(Color(0xff00beff)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              )),
            ),
            onPressed: passwordReset,
            child: Text(
              'Reset',
              style:
                  GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
