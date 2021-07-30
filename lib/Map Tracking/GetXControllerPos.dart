import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPosController extends GetxController {
  var marker = Set<Marker>().obs;

  fetch(double lat, double long) async {
    marker.value = {};
    marker.add(Marker(
        infoWindow: InfoWindow(title: "Origin"),
        markerId: MarkerId("origin"),
        position: LatLng(lat, long)));
    return 'done';
  }
}
