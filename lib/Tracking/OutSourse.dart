import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps/Tracking/Tracker.dart';
import 'package:maps/Tracking/Transmitter.dart';

class OutSourse extends StatefulWidget {
  @override
  _OutSourseState createState() => _OutSourseState();
}

class _OutSourseState extends State<OutSourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OutSourse"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Get.to(() => Transmitter());
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
                Get.to(() => Tracker());
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
