import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps/main.dart';

import 'Getx.dart';

class Mapy extends StatefulWidget {
  @override
  _MapyState createState() => _MapyState();
}

class _MapyState extends State<Mapy> {
  Position position;
  final MainController mainController = Get.put(MainController());

  @override
  void initState() {
    super.initState();
    getL();
  }

  getL() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    print(position);
    setState(() {});
  }

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      mainController.marker.add(Marker(
          infoWindow: InfoWindow(title: "Origin"),
          markerId: MarkerId("origin"),
          position: LatLng(26.1695, 91.7382)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Obx(() => Text(mainController.marker.length.toString())),
          onPressed: () async {
            var res = await mainController.fetch();
            if (res == 'done') {
              setState(() {});
            }
          },
        ),
        appBar: AppBar(
          title: Text("Mappy"),
          actions: [
            InkWell(
                onTap: () {
                  setState(() {
                    print(mainController.marker);
                  });
                },
                child: Icon(Icons.refresh))
          ],
        ),
        body: (position != null)
            ? GoogleMap(
                //    onMapCreated: _onMapCreated,
                markers: mainController.marker,
                initialCameraPosition:
                    CameraPosition(zoom: 15, target: LatLng(26.1695, 91.7382)),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
