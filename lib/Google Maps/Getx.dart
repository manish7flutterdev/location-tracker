import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class MainController extends GetxController {
  var marker = Set<Marker>().obs;

  var distancy;
  var lat = 26.1695;
  var long = 91.7382;

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  fetch() async {
    marker.value = {};
    marker.add(Marker(
        infoWindow: InfoWindow(title: "Origin"),
        markerId: MarkerId("origin"),
        position: LatLng(lat, long)));
    var res =
        await http.get('https://morning-journey-55816.herokuapp.com/news');
    var data = jsonDecode(res.body);
    int i;
    for (i = 0; i < data.length; i++) {
      dynamic x = data[i]['lat'];
      dynamic y = data[i]['long'];
      if (data.contains(Marker(
              infoWindow: InfoWindow(title: data[i]['NewsHeading']),
              markerId: MarkerId(data[i]['_id']),
              position: LatLng(data[i]['lat'], data[i]['long']))) ==
          false) {
        marker.add(Marker(
            onTap: () {
              print('The distance between the point is ${getDist(x, y)} meter');
            },
            infoWindow: InfoWindow(title: data[i]['NewsHeading']),
            markerId: MarkerId(data[i]['_id']),
            position: LatLng(data[i]['lat'], data[i]['long'])));
      }
    }
    return 'done';
  }

  getDist(double x, double y) {
    double distance = Geolocator.distanceBetween(lat, long, x, y);
    return distance;
  }
}
