import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps/Google%20Maps/Getx.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:geolocator/geolocator.dart';
import 'GetXControllerPos.dart';

class TransmitterPos extends StatefulWidget {
  @override
  _TransmitterPosState createState() => _TransmitterPosState();
}

class _TransmitterPosState extends State<TransmitterPos> {
  final MapPosController mapController = Get.put(MapPosController());
// http://192.168.29.217:3000
// https://intense-sands-14680.herokuapp.com
  IO.Socket socket =
      IO.io("https://intense-sands-14680.herokuapp.com", <String, dynamic>{
    "transports": ["websocket"],
    "autoConnect": false
  });

  Timer timer;
  var x = 0.0;

  Position position;

  @override
  void initState() {
    super.initState();
    inSoc();
    getL();
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      getL();
      emuit();
    });
  }

  getL() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

  inSoc() {
    socket.connect();
    socket.onConnect((data) {
      socket.emit("message", {
        "lat": position.latitude,
        "long": position.longitude,
        "reciever": "tracker"
      });
    });
  }

  emuit() {
    socket.emit("message", {
      "lat": position.latitude,
      "long": position.longitude,
      "reciever": "tracker"
    });
    print('sended');
  }

  @override
  void dispose() {
    super.dispose();
    socket.disconnect();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getL();
          emuit();
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Transmitter Pos"),
      ),
    );
  }
}
