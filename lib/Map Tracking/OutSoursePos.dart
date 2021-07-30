import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps/Map%20Tracking/TrackerPos.dart';
import 'package:maps/Map%20Tracking/TransmitterPos.dart';
import 'package:maps/Tracking/Tracker.dart';
import 'package:maps/Tracking/Transmitter.dart';

class OutPosSourse extends StatefulWidget {
  @override
  _OutPosSourseState createState() => _OutPosSourseState();
}

class _OutPosSourseState extends State<OutPosSourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OutSoursePos"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Get.to(() => TransmitterPos());
              },
              child: Container(
                height: 100,
                width: 300,
                color: Colors.blue,
                child: Center(
                  child: Text("Transmitter",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () {
                Get.to(() => TrackerPos());
              },
              child: Container(
                height: 100,
                width: 300,
                color: Colors.green,
                child: Center(
                  child: Text("Tracker",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
