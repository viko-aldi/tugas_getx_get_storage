import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {
  TextEditingController? namaController;
  TextEditingController? passwordController;
  TextEditingController? emailController;
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  void saveToGetStorage() {
    if (formKey.currentState!.validate()) {
      GetStorage().write("auth", {
        "name": namaController!.text,
        "email": emailController!.text,
        "password": passwordController!.text
      }).then((value) {
        Get.offAllNamed("/home");
      });
    }
  }

  @override
  void onInit() {
    namaController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    namaController!.dispose();
    passwordController!.dispose();
    emailController!.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
