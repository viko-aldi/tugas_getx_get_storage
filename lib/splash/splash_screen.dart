import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[50],
        child: Center(
          child: Text(
            "Selamat datang",
            style: TextStyle(
                fontSize: 30,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
