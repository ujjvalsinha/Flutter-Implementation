import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Tracking extends StatefulWidget {
  @override
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  Completer<GoogleMapController> _controller = Completer();

  getPoints() {
    return [
      LatLng(18.516726, 73.856255),
      LatLng(19.9975, 73.7898),
    ];
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 14,
      tilt: 45.0,
      bearing: 42.0,
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _googleMap(),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: GestureDetector(
        onTap: () {
          _gotoLocation(19.9975, 73.7898);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          height: 150.0,
          decoration: BoxDecoration(
              color: Color(0xFF5C23E0),
              borderRadius: BorderRadius.circular(8.0)),
          child: Text(
            "Click Here",
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _googleMap() {
    return GoogleMap(
      mapType: MapType.terrain,
      markers: {blueMarker, newyork1Marker},
      indoorViewEnabled: true,
      myLocationEnabled: true,
      initialCameraPosition: CameraPosition(
        target: LatLng(19.9975, 73.7898),
        zoom: 7,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      polygons: Set<Polygon>.of(<Polygon>[
        Polygon(
            consumeTapEvents: true,
            zIndex: 10,
            polygonId: PolygonId('area'),
            points: getPoints(),
            geodesic: true,
            strokeColor: Colors.red,
            strokeWidth: 5,
            visible: true),
      ]),
    );
  }

  Marker blueMarker = Marker(
    markerId: MarkerId('Pune'),
    position: LatLng(18.516726, 73.856255),
    infoWindow: InfoWindow(title: 'Pune', snippet: "Welcome to Pune"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRed,
    ),
  );

  Marker newyork1Marker = Marker(
    markerId: MarkerId('Nashik'),
    position: LatLng(19.9975, 73.7898),
    infoWindow: InfoWindow(title: 'Nashik', snippet: "Welcome to Nashik"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRed,
    ),
  );
}
