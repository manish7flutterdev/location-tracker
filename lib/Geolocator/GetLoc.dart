import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GetLoc extends StatefulWidget {
  @override
  _GetLocState createState() => _GetLocState();
}

class _GetLocState extends State<GetLoc> {
  Position position;

  @override
  void initState() {
    super.initState();
    getL();
  }

  getL() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {});
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get User Location"),
      ),
      body: Column(
        children: [
          SizedBox(height: 100),
          Text(position.latitude.toString()),
          Text(position.longitude.toString())
        ],
      ),
    );
  }
}
