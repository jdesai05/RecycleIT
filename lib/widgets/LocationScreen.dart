import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LeafletMapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaflet Map in Flutter'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(22.5726, 88.3639), // Initial map center (Kolkata)
          zoom: 13.0,                       // Map zoom level
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'], // OpenStreetMap subdomains
          ),
        ],
      ),
    );
  }
}
