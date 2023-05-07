// ignore_for_file: prefer_const_constructors, sort_child_properties_last
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
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 120, left: 10),
            child: Container(
              decoration: BoxDecoration(),
              child: Text(
                'Select Symptoms',
                style: GoogleFonts.roboto(
                    fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              width: 350,
              //padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.green),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CheckboxListTile(
                        title: Text('Shortness of breath'),
                        value: shortnessOfBreath == 1.0,
                        onChanged: (value) {
                          setState(() {
                            shortnessOfBreath =
                                value != null && value ? 1.0 : 0.0;
                          });
                        }),
                    CheckboxListTile(
                      title: Text('Dizziness'),
                      value: dizziness == 1.0,
                      onChanged: (value) {
                        setState(() {
                          dizziness = value != null && value ? 1.0 : 0.0;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text('Asthenia'),
                      value: asthenia == 1.0,
                      onChanged: (value) {
                        setState(() {
                          asthenia = value != null && value ? 1.0 : 0.0;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text('Fall'),
                      value: fall == 1.0,
                      onChanged: (value) {
                        setState(() {
                          fall = value != null && value ? 1.0 : 0.0;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text('Syncope'),
                      value: syncope == 1.0,
                      onChanged: (value) {
                        setState(() {
                          syncope = value != null && value ? 1.0 : 0.0;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _submitSelection,
            child: Text('Submit'),
          ),
          SizedBox(height: 16.0),
          SizedBox(height: 16.0),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color.fromARGB(255, 174, 246, 179),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                "Predicted Disease: $predictedDisease",
                style: GoogleFonts.roboto(
                    fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
