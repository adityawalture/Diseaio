// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:transparent_image/transparent_image.dart';

import '../main.dart';

class TestInput extends StatefulWidget {
  const TestInput({super.key});

  @override
  State<TestInput> createState() => _TestInputState();
}

class _TestInputState extends State<TestInput> {
  CameraController? cameraController;
  String output = '';
  String outputs = '';
  File? img;
  late bool loading = true;

  @override
  void initState() {
    super.initState();
    //loadCamera();
    loadmodel();
  }

  pickImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img == null) return null;

    final imageTemp = File(img.path);

    setState(() {
      this.img = imageTemp;
      runModel();
    });
  }

  void clearImage() {
    setState(() {
      img = null;
      outputs = '';
    });
  }

  runModel() async {
    if (img != null) {
      var predict = await Tflite.runModelOnImage(
          path: img!.path,
          imageMean: 0.0, // defaults to 117.0
          imageStd: 255.0, // defaults to 1.0
          numResults: 2, // defaults to 5
          threshold: 0.2, // defaults to 0.1
          asynch: true);

      predict!.forEach((element) {
        setState(() {
          loading = false;
          outputs = element['label'];
        });
      });
    }
  }

  loadmodel() async {
    await Tflite.loadModel(
        model: "assets/model_unquant.tflite", labels: "assets/labels.txt");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 209, 255, 207),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 70, right: 70),
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 2),
                  image: img != null
                      ? DecorationImage(
                          image: FileImage(img!), fit: BoxFit.cover)
                      : null),
            ),
          ),
          SizedBox(height: 15),
          Text(
            outputs,
            style:
                GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: pickImage,
            child: Text(
              "Pick Image",
              style:
                  GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          TextButton(
            onPressed: clearImage,
            child: Text(
              "Clear Image",
              style:
                  GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}




// height: MediaQuery.of(context).