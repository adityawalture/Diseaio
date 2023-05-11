// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, non_constant_identifier_names, prefer_const_literals_to_create_immutables
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
  double sweat_increased = 0.0;
  double palpitation = 0.0;
  double nausea = 0.0;
  double angina_pectoris = 0.0;
  double pressure_chest = 0.0;
  double polyuria = 0.0;
  double polydypsia = 0.0;
  double pain_chest = 0.0;
//
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
        'sweating increased': sweat_increased.toString(),
        'palpitation': palpitation.toString(),
        'nausea': nausea.toString(),
        'angina pectoris': angina_pectoris.toString(),
        'pressure chest': pressure_chest.toString(),
        'polyuria': polyuria.toString(),
        'polydypsia': polydypsia.toString(),
        'pain chest': pain_chest.toString(),
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
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 227, 233, 196),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1.0, style: BorderStyle.solid),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 97, 139, 96),
                  spreadRadius: 6,
                  blurRadius: 18,
                  offset: Offset(4, 4),
                ),
              ],
            ),
            // color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  CheckboxListTile(
                    title: Text(
                      'Shortness of Breath',
                      style: GoogleFonts.roboto(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    value: shortnessOfBreath == 1.0,
                    onChanged: (value) {
                      setState(() {
                        shortnessOfBreath = value != null && value ? 1.0 : 0.0;
                      });
                    },
                  ),
                  CheckboxListTile(
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
                  CheckboxListTile(
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
                  CheckboxListTile(
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
                  CheckboxListTile(
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
                  CheckboxListTile(
                    title: Text(
                      'Faintness',
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
                  CheckboxListTile(
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
                  CheckboxListTile(
                    title: Text(
                      'Sweating Increased',
                      style: GoogleFonts.roboto(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    value: sweat_increased == 1.0,
                    onChanged: (value) {
                      setState(() {
                        sweat_increased = value != null && value ? 1.0 : 0.0;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text(
                      'Rapid Heartbeat',
                      style: GoogleFonts.roboto(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    value: palpitation == 1.0,
                    onChanged: (value) {
                      setState(() {
                        palpitation = value != null && value ? 1.0 : 0.0;
                      });
                    },
                  ),
                  CheckboxListTile(
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
                  CheckboxListTile(
                    title: Text(
                      'Cardiac Pain',
                      style: GoogleFonts.roboto(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    value: angina_pectoris == 1.0,
                    onChanged: (value) {
                      setState(() {
                        angina_pectoris = value != null && value ? 1.0 : 0.0;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text(
                      'Chest Pressure',
                      style: GoogleFonts.roboto(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    value: pressure_chest == 1.0,
                    onChanged: (value) {
                      setState(() {
                        pressure_chest = value != null && value ? 1.0 : 0.0;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text(
                      'Excessive Urination',
                      style: GoogleFonts.roboto(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    value: polyuria == 1.0,
                    onChanged: (value) {
                      setState(() {
                        polyuria = value != null && value ? 1.0 : 0.0;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text(
                      'Constant Thirst',
                      style: GoogleFonts.roboto(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    value: polydypsia == 1.0,
                    onChanged: (value) {
                      setState(() {
                        polydypsia = value != null && value ? 1.0 : 0.0;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text(
                      'Chest Pain',
                      style: GoogleFonts.roboto(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    value: pain_chest == 1.0,
                    onChanged: (value) {
                      setState(() {
                        pain_chest = value != null && value ? 1.0 : 0.0;
                      });
                    },
                  ),
                ],
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
