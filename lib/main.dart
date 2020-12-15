import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homescreen.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Do It',
      theme: ThemeData(
        // This is the theme of your application.
        appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
        primaryColor: AppColors.purple,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homescreen(),
    );
  }
}
