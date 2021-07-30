import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps/Tracking/GetXController.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Tracker extends StatefulWidget {
  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  final MapController mapController = Get.put(MapController());

  IO.Socket socket =
      IO.io("https://intense-sands-14680.herokuapp.com", <String, dynamic>{
    "transports": ["websocket"],
    "autoConnect": false
  });

  void connect() async {
    socket.connect();
    socket.emit("signin", "tracker");
    socket.onConnect((data) => {
          print("tracker is On"),
          socket.on("message", (data) {
            data = jsonEncode(data);
            data = jsonDecode(data);
            print(data['lat']);
            print(data['long']);
            var lt = data['lat'];
            var lg = data['long'];
            double nlt = lt.toDouble();
            double nlg = lg.toDouble();
            mapController.lat.value = nlt;
            mapController.long.value = nlg;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    connect();
  }

  @override
  void dispose() {
    super.dispose();
    socket.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Tracker"),
        ),
        body: Obx(() => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (mapController.lat == 0.0)
                        ? "map not Initialized"
                        : mapController.lat.toString(),
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    (mapController.long == 0.0)
                        ? "map not Initialized"
                        : mapController.long.toString(),
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )));
  }

  doIt() {
    print("This it buddy ");
    mapController.long.value = mapController.long.value + 1;
    return mapController.lat.toString();
  }

  jstDo() {
    print('I am here');
    return mapController.long.toString();
  }
}
