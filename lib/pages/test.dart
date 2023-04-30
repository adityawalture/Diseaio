import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';

class TestInput extends StatefulWidget {
  const TestInput({super.key});

  @override
  State<TestInput> createState() => _TestInputState();
}

class _TestInputState extends State<TestInput> {
  static CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';
  String outputs = '';
  File? image;
  late bool loading = true;

  @override
  void initState() {
    super.initState();
    //loadCamera();
    loadmodel();
  }

  pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return null;

    final imageTemp = File(image.path);

    setState(() {
      this.image = imageTemp;
      runModel();
    });
  }

  void clearImage() {
    setState(() {
      image = null;
      outputs = '';
    });
  }

  runModel() async {
    if (image != null) {
      var predict = await Tflite.runModelOnImage(
          path: image!.path,
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
              ),
              child: image != null
                  ? Image.file(
                      image!,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    )
                  : Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                      ),
                    ),
            ),
          ),
          Text(
            outputs,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          ElevatedButton(
            onPressed: pickImage,
            child: Text("Pick Image"),
          ),
          ElevatedButton(
            onPressed: clearImage,
            child: Text("Clear Image"),
          )
        ],
      ),
    );
  }
}




// height: MediaQuery.of(context).