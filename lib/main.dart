import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps/Geolocator/GetLoc.dart';
import 'package:maps/Google%20Maps/Map.dart';
import 'package:maps/Google%20Maps/Pass.dart';
import 'package:maps/Tracking/GetXController.dart';
import 'package:maps/Tracking/OutSourse.dart';

import 'Map Tracking/OutSoursePos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // final MapController mapController = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: OutPosSourse(),
    );
  }
}
