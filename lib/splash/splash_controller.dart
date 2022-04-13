import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  startSplashScreen() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      if (GetStorage().hasData("auth")) {
        Get.offAllNamed("/home");
      } else {
        Get.offAllNamed("/register");
      }
    });
  }

  @override
  void onInit() {
    startSplashScreen();
    super.onInit();
  }
}
