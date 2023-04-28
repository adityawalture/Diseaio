// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_trail/pages/predictDisease.dart';

class SymptomsInput extends StatefulWidget {
  const SymptomsInput({super.key});

  @override
  State<SymptomsInput> createState() => _SymptomsInputState();
}

class _SymptomsInputState extends State<SymptomsInput> {
  late String symptom;
  List<String> patientSymptoms = [];

  List<Widget> convertToTile(List<String> symptomStrings) {
    List<Widget> symptomTile = [];
    for (int i = 0; i < symptomStrings.length; ++i) {
      symptomTile.add(Card(
        elevation: 2.5,
        child: ListTile(
          trailing: IconButton(
            icon: Icon(Icons.cancel_outlined, color: Color(0xFFD60000)),
            onPressed: () {
              setState(() {
                symptomStrings.remove(symptomStrings[i]);
              });
            },
          ),
          title: Text(
            symptomStrings[i],
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.5,
            ),
          ),
        ),
      ));
      symptomTile.add(SizedBox(
        height: 3,
      ));
    }
    symptomTile.add(TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PredictDisease(
                      symptoms: symptomStrings,
                    )));
      },
      child: Container(
        width: 230,
        height: 45,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Predict Disease",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22.5,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26.0),
          color: Colors.lightGreen,
          border:
              Border.all(width: 1.0, color: Color.fromARGB(255, 79, 252, 63)),
        ),
      ),
    ));
    return symptomTile;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: Text(
              "Add Symptoms",
              style:
                  GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            title: TextField(
              onChanged: (value) {
                setState(() {
                  symptom = value;
                });
              },
              decoration: InputDecoration(
                hintText: "What are you feeling",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(17.5)),
                  borderSide: BorderSide(
                      color: Color.fromARGB(179, 144, 255, 34), width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 34, 34), width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(17.5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(179, 34, 144, 255), width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(17.5)),
                ),
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.add_circle_rounded,
                  color: Color(0xffd60000), size: 25),
              onPressed: () {
                if (symptom.length != 0) {
                  setState(() {
                    patientSymptoms.add(symptom);
                    symptom;
                  });
                } else {
                  print("No symptom added");
                }
              },
            ),
          ),
          SizedBox(height: 25),
          patientSymptoms.length != 0
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [],
                )
              : Center(),
        ],
      ),
    );
  }
}
