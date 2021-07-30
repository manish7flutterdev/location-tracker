import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MapController extends GetxController {
  var lat = 0.0.obs;
  var long = 0.0.obs;
}
