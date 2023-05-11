// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
// import 'package:login_trail/pages/predictDisease.dart';

class SymptomsInput extends StatefulWidget {
  const SymptomsInput({super.key});

  @override
  State<SymptomsInput> createState() => _SymptomsInputState();
}

class _SymptomsInputState extends State<SymptomsInput> {
  double shortnessOfBreath = 0.0;
  double dizziness = 0.0;
  double asthenia = 0.0;
  double fall = 0.0;
  double syncope = 0.0;
  double vertigo = 0.0;
  double sweat = 0.0;
  double vomiting = 0.0;
  double nausea = 0.0;
  double chestdiscomfort = 0.0;
  double blackout = 0.0;
  double sneeze = 0.0;
  double cough = 0.0;
  double fever = 0.0;

  String predictedDisease = '';
  final _formKey = GlobalKey<FormState>();
  Future<void> _submitSelection() async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/predict'),
      body: {
        'shortness of breath': shortnessOfBreath.toString(),
        'dizziness': dizziness.toString(),
        'asthenia': asthenia.toString(),
        'fall': fall.toString(),
        'syncope': syncope.toString(),
        'vertigo': vertigo.toString(),
        'sweat': sweat.toString(),
        'vomiting': vomiting.toString(),
        'nausea': nausea.toString(),
        'chest discomfort': chestdiscomfort.toString(),
        'blackout': blackout.toString(),
        'sneeze': sneeze.toString(),
        'cough': cough.toString(),
        'fever': fever.toString(),
      },
    ).timeout(
      Duration(seconds: 50),
    );
    final data = jsonDecode(response.body);
    setState(() {
      predictedDisease = data['disease'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 209, 255, 207),
      body: Column(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            // color: Colors.white,
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                'Select Symptoms',
                style: GoogleFonts.roboto(
                    fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            // color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CheckboxListTile(
                          // tileColor: Colors.lightGreenAccent.shade100,
                          title: Text(
                            'Shortness of breath',
                            style: GoogleFonts.roboto(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          value: shortnessOfBreath == 1.0,
                          onChanged: (value) {
                            setState(() {
                              shortnessOfBreath =
                                  value != null && value ? 1.0 : 0.0;
                            });
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CheckboxListTile(
                        // tileColor: Colors.lightGreenAccent.shade100,
                        title: Text(
                          'Dizziness',
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: dizziness == 1.0,
                        onChanged: (value) {
                          setState(() {
                            dizziness = value != null && value ? 1.0 : 0.0;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CheckboxListTile(
                        // tileColor: Colors.lightGreenAccent.shade100,
                        title: Text(
                          'Asthenia',
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: asthenia == 1.0,
                        onChanged: (value) {
                          setState(() {
                            asthenia = value != null && value ? 1.0 : 0.0;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CheckboxListTile(
                        // tileColor: Colors.lightGreenAccent.shade100,
                        title: Text(
                          'Fall',
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: fall == 1.0,
                        onChanged: (value) {
                          setState(() {
                            fall = value != null && value ? 1.0 : 0.0;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CheckboxListTile(
                        // tileColor: Colors.lightGreenAccent.shade100,
                        title: Text(
                          'Syncope',
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: syncope == 1.0,
                        onChanged: (value) {
                          setState(() {
                            syncope = value != null && value ? 1.0 : 0.0;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CheckboxListTile(
                        // tileColor: Colors.lightGreenAccent.shade100,
                        title: Text(
                          'Vertigo',
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: vertigo == 1.0,
                        onChanged: (value) {
                          setState(() {
                            vertigo = value != null && value ? 1.0 : 0.0;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CheckboxListTile(
                        // tileColor: Colors.lightGreenAccent.shade100,
                        title: Text(
                          'Sweat',
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: sweat == 1.0,
                        onChanged: (value) {
                          setState(() {
                            sweat = value != null && value ? 1.0 : 0.0;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CheckboxListTile(
                        // tileColor: Colors.lightGreenAccent.shade100,
                        title: Text(
                          'Vomiting',
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: vomiting == 1.0,
                        onChanged: (value) {
                          setState(() {
                            vomiting = value != null && value ? 1.0 : 0.0;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CheckboxListTile(
                        // tileColor: Colors.lightGreenAccent.shade100,
                        title: Text(
                          'Nausea',
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: nausea == 1.0,
                        onChanged: (value) {
                          setState(() {
                            nausea = value != null && value ? 1.0 : 0.0;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CheckboxListTile(
                        // tileColor: Colors.lightGreenAccent.shade100,
                        title: Text(
                          'Chest Discomfort',
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: chestdiscomfort == 1.0,
                        onChanged: (value) {
                          setState(() {
                            chestdiscomfort =
                                value != null && value ? 1.0 : 0.0;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CheckboxListTile(
                        // tileColor: Colors.lightGreenAccent.shade100,
                        title: Text(
                          'Blackout',
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: blackout == 1.0,
                        onChanged: (value) {
                          setState(() {
                            blackout = value != null && value ? 1.0 : 0.0;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CheckboxListTile(
                        // tileColor: Colors.lightGreenAccent.shade100,
                        title: Text(
                          'Sneeze',
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: sneeze == 1.0,
                        onChanged: (value) {
                          setState(() {
                            sneeze = value != null && value ? 1.0 : 0.0;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CheckboxListTile(
                        // tileColor: Colors.lightGreenAccent.shade100,
                        title: Text(
                          'Cough',
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: cough == 1.0,
                        onChanged: (value) {
                          setState(() {
                            cough = value != null && value ? 1.0 : 0.0;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CheckboxListTile(
                        // tileColor: Colors.lightGreenAccent.shade100,
                        title: Text(
                          'Fever',
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: fever == 1.0,
                        onChanged: (value) {
                          setState(() {
                            fever = value != null && value ? 1.0 : 0.0;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              // color: Colors.blueAccent,
              child: Column(
                children: [
                  Center(
                    child: ElevatedButton(
                      onPressed: _submitSelection,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Submit',
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color.fromARGB(255, 174, 246, 179),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                "Predicted Disease",
                                style: GoogleFonts.roboto(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 5),
                              Text(
                                predictedDisease,
                                style: GoogleFonts.roboto(
                                    fontSize: 25, fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
