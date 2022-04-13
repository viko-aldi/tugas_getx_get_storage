import 'package:flutter/material.dart';
import 'package:flutter_getx/pages/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
    // TODO: implement dependencies
  }
}
