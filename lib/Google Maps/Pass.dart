import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps/Google%20Maps/Getx.dart';
import 'package:maps/Google%20Maps/Map.dart';

class Pass extends StatefulWidget {
  @override
  _PassState createState() => _PassState();
}

class _PassState extends State<Pass> {
  final MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => Mapy());
        },
      ),
    );
  }
}
