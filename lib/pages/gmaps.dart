// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Gmaps extends StatefulWidget {
  const Gmaps({super.key});

  @override
  State<Gmaps> createState() => _GmapsState();
}

class _GmapsState extends State<Gmaps> {
  late GoogleMapController mapController;
   final LatLng _center = const LatLng(45.521563, -122.677433);
  // Map<String, Marker> _marker = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff91B693),
      appBar: AppBar(
        title: const Text('Nearest Hospital'),
        backgroundColor: Color(0xff5E8C61),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 16,
        ),
        onMapCreated: (controller) {
          mapController = controller;
        },
      ),
    );
  }
}
