import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../welcome_screen/splash_screen.dart';


class MyRouters{

  static var route = [
    GetPage(name: '/', page: () => const SplashScreen()),
  ];
}