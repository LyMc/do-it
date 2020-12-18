import 'package:do_it/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var getAppBar = (title) => AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: const Icon(Icons.home),
          tooltip: 'Go Home',
          onPressed: () {
            Get.to(Homescreen());
          },
        ),
      ],
    );
