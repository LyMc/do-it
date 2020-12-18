import 'package:do_it/homescreen.dart';
import 'package:do_it/models.dart';
import 'package:do_it/strategies/confidenceStrategy.dart';
import 'package:do_it/strategies/overwhelmedStrategy.dart';
import 'package:do_it/successScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const devTask = 'Develop an app with flutter';
final menu = {
  'Homescreen': () => Homescreen(),
  'Overwhelemed Strategy': () =>
      OverwhelmedStrategy(task: OverwhelmedTask(devTask)),
  'Confidence Strategy': () =>
      ConfidenceStrategy(task: ConfidenceTask(devTask)),
  'Success Screen': () => SuccessScreen(task: OverwhelmedTask(devTask)),
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
