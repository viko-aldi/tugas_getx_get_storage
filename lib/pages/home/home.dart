// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_getx/pages/home/home_controller.dart';
import 'package:flutter_getx/pages/home/home_screen1.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue[100],
        child: _buildHomeScreen(),
      ),
    );
  }

  Widget _buildHomeScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Welcome ! ",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
                fontSize: 21)),
        SizedBox(
          height: 10,
        ),
        Text(
          _controller.name,
          style: TextStyle(
              color: Colors.black,
              fontSize: 21,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 100,
        ),
        Image.asset('assets/images/gambar.png'),
        Text('THE MOVIE'),
        ElevatedButton(
            onPressed: () {
              Get.to(() => HomeScreen());
            },
            child: Text("Jelajahi")),
        SizedBox(
          height: 10,
        ),
        Text('Log Out'),
        SizedBox(
          height: 5,
        ),
        ElevatedButton(
          onPressed: () {
            _controller.logout();
          },
          child: Text('Log out'),
        ),
      ],
    );
  }
}
