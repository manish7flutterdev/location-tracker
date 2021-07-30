import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'GetXControllerPos.dart';

class TrackerPos extends StatefulWidget {
  @override
  _TrackerPosState createState() => _TrackerPosState();
}

class _TrackerPosState extends State<TrackerPos> {
  final MapPosController mapController = Get.put(MapPosController());

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
          socket.on("message", (data) async {
            data = jsonEncode(data);
            data = jsonDecode(data);
            print(data['lat']);
            print(data['long']);
            var lt = data['lat'];
            var lg = data['long'];
            double nlt = lt.toDouble();
            double nlg = lg.toDouble();
            var resp = await mapController.fetch(nlt, nlg);
            if (resp == 'done') {
              setState(() {});
            }
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
          title: Text("Tracker Pos"),
        ),
        body: GoogleMap(
          //    onMapCreated: _onMapCreated,
          markers: mapController.marker,
          initialCameraPosition:
              CameraPosition(zoom: 15, target: LatLng(26.1695, 91.7382)),
        ));
  }
}
