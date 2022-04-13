import 'package:flutter/material.dart';
import 'package:flutter_getx/pages/home/home_controller.dart';
import 'package:flutter_getx/repository/movie_repository.dart';
import 'package:get/get.dart';

class Injector extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => MovieRepository());
    // TODO: implement dependencies
  }
}
