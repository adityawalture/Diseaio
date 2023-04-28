// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:login_trail/pages/loginPage.dart';
import 'package:login_trail/pages/registerPage.dart';

class Auth2Page extends StatefulWidget {
  const Auth2Page({super.key});

  @override
  State<Auth2Page> createState() => _Auth2PageState();
}

class _Auth2PageState extends State<Auth2Page> {
  //initially show the login page
  bool showLoginPage = true;

  void toogleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: toogleScreens);
    } else {
      return RegisterPage(showLoginPage: toogleScreens);
    }
  }
}
