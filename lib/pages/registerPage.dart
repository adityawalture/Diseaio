// ignore_for_file: prefer_const_constructors, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _ageController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      //create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      //add user details
      addUserDetails(
        _firstnameController.text.trim(),
        _lastnameController.text.trim(),
        _emailController.text.trim(),
        int.parse(_ageController.text.trim()),
      );
    }
  }

  Future addUserDetails(
      String firstName, String lastName, String email, int age) async {
    await FirebaseFirestore.instance.collection('Users').add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'age': age,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: Center(
        // ignore: duplicate_ignore
        child: SingleChildScrollView(
          child: Container(
            width: 360,
            decoration: BoxDecoration(
                // color: Colors.white,
                ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  //Image.asset('assets/logo.png'),
                  //SizedBox(height: 20),
                  //First text
                  Text(
                    "Register",
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  //firstname textfield
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
                          controller: _firstnameController,
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  //last name textfield
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
                          controller: _lastnameController,
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  //age textfield
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
                          controller: _ageController,
                          decoration: InputDecoration(
                            hintText: 'Age',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
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
                  //password textfield
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
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'password',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
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
                          controller: _confirmpasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'confirm password',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  //sign in button
                  ElevatedButton(
                    style: ButtonStyle(
                      // elevation: MaterialStateProperty.all(8),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff00beff)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                    ),
                    onPressed: signUp,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "SignUp",
                        style: GoogleFonts.roboto(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  //not a member? register now
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have a account?",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: widget.showLoginPage,
                        child: Text(
                          'Login',
                          style: GoogleFonts.roboto(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
