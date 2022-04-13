import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_getx/pages/home/home_binding.dart';
import 'package:flutter_getx/pages/home/home.dart';
import 'package:flutter_getx/pages/register/register_binding.dart';
import 'package:flutter_getx/pages/register/register_screen.dart';
import 'package:flutter_getx/splash/splash_binding.dart';
import 'package:flutter_getx/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'binding_global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Latihan Get_Storage",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/splash",
      initialBinding: BindingGlobal(),
      getPages: [
        GetPage(
          name: "/home",
          binding: HomeBinding(),
          page: () => Home(),
        ),
        GetPage(
          name: "/register",
          binding: RegisterBinding(),
          page: () => RegisterScreen(),
        ),
        GetPage(
          name: "/splash",
          binding: SplashBinding(),
          page: () => SplashScreen(),
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
