// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, duplicate_ignore, sized_box_for_whitespace

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_trail/pages/symptomsInput.dart';
import 'package:login_trail/pages/test.dart';

import '../components/DrawerPg.dart';
import 'diseaseInput.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          // backgroundColor: Color.fromARGB(255, 209, 255, 207),
          drawer: Drawer(child: DrawPg()),
          appBar: AppBar(
            // backgroundColor: Color(0xff5E8C61),
            title: Text(
              'Home',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 26,
                        child: Image.asset(
                          'assets/symptoms.png',
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                // Tab(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       // Text(
                //       //   'Symptoms',
                //       //   style: GoogleFonts.roboto(),
                //       // ),
                //       // SizedBox(width: 5),
                //       Container(
                //         height: 26,
                //         child: Image.asset(
                //           'assets/test.png',
                //           color: Colors.white,
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(
                      //   'Symptoms',
                      //   style: GoogleFonts.roboto(),
                      // ),
                      // SizedBox(width: 5),
                      Container(
                        height: 26,
                        child: Image.asset(
                          'assets/scan.png',
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SymptomsInput(),
              // DiseaseInput(),
              TestInput(),
            ],
          )),
    );
  }
}







// Column(
//               children: [
//                 Container(
//                   color: Colors.green.shade50,
//                   width: double.infinity,
//                   height: 250,
//                   padding: EdgeInsets.only(top: 20.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       CircleAvatar(radius: 45),
//                       SizedBox(height: 30),
//                       Text('LognIn as ${user.email!}',
//                           style: GoogleFonts.roboto()),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 20, left: 15),
//                     child: Container(
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           InkWell(
//                               onTap: () {
//                                 FirebaseAuth.instance.signOut();
//                               },
//                               child: Row(
//                                 children: [
//                                   Icon(Icons.logout_outlined, size: 36),
//                                   SizedBox(width: 10),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.only(left: 5, top: 5),
//                                     child: Text(
//                                       'Log Out',
//                                       style: GoogleFonts.roboto(fontSize: 20),
//                                     ),
//                                   ),
//                                 ],
//                               )),
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),