import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homescreen.dart';
import 'strategies/overwhelmed/list.dart';

final menu = {
  'Homescreen': () => Homescreen(),
  'Overwhelmed List': () => OverwhelmedListScreen(),
};

class Screens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: menu.entries.map((menuItem) {
            return ListTile(
              leading: Icon(Icons.api),
              title: Text(menuItem.key),
              onTap: () => Get.to(menuItem.value()),
            );
          }).toList(),
        ),
      ),
    );
  }
}
