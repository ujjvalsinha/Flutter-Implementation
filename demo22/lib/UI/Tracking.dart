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
            height: 130.0,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 130.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: ListTile(
                        title: Row(
                          children: [
                            CircleAvatar(
                              radius: 18.0,
                              backgroundColor: Colors.indigo,
                              backgroundImage: NetworkImage(
                                  "https://lh3.googleusercontent.com/proxy/-WR57PV-XbeD5_L4vbUswONSlQAorPLxfHvye2DbcmSpsBEL2viscXxIivPSRKKxkIBrKwIXZFHrXZ2RGA01EdmvAiaAOyCX1w45ZONaqZMCNLK5FIBrdhCA-6a4XLQuzbKzSA"),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .10,
                            ),
                            Text(
                              "Ram Kadam",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
                                child: Image(
                                  height: 22,
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      "https://lh3.googleusercontent.com/proxy/nvP-9K9e9JujG5UMv6aODsj9CL0jDI6-cxMDbdHPof3kOuj7tWStwn1v_RUZwl0EnKbcEBP6M_CjIAE_O5hQwWGRCy2FUUN_nZ5IMmKHjYZU9YBJL5k7RLgnzYTpBbxBtBjOGQ"),
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .06,
                            ),
                            Wrap(
                              alignment: WrapAlignment.start,
                              children: [
                                Text("mh 15 fb 2844 \n tata ace".toUpperCase()),
                              ],
                            )
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Card(
                              color: Colors.green,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0, vertical: 3.0),
                                child: Text("Save"),
                              ),
                            ),
                            Icon(Icons.call),
                          ],
                        )),
                  ),
                )
              ],
            )),
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
