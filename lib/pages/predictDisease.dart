import 'package:flutter/material.dart';

class PredictDisease extends StatefulWidget {
  final List<String> symptoms;
  const PredictDisease({super.key, required this.symptoms});

  @override
  State<PredictDisease> createState() => _PredictDiseaseState();
}

class _PredictDiseaseState extends State<PredictDisease> {
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
