import 'package:flutter_getx/splash/splash_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_getx/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SplashController());
  }
}
