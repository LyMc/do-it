import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homescreen.dart';
import 'screens.dart';
import 'theme.dart';

const dev = false;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Do It',
      theme: AppColors.theme,
      home: dev ? Screens() : Homescreen(),
    );
  }
}
