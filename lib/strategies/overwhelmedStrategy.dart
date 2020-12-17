import 'package:do_it/models.dart';
import 'package:do_it/strategies/overwhelmed/list.dart';
import 'package:do_it/successScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shareable/primaryAction.dart';
import '../shareable/screenTitle.dart';
import '../shareable/yourTaskWell.dart';

class OverwhelmedStrategy extends StatelessWidget {
  final OverwhelmedTask task;

  OverwhelmedStrategy({@required this.task});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            imageHeader,
            ScreenTitle(title: 'Overwhelmed'),
            description,
            currentTask,
            markAsResolvedButton,
            learnMoreButton
          ],
        ),
      ),
    );
  }

  final description = Text(
      "You feel overwhelmed, let's brake down the job to complete this task:",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: 20));

  final imageHeader = Container(
      width: 400,
      height: 300,
      margin: const EdgeInsets.only(top: 60, bottom: 20),
      child: Image(image: AssetImage('assets/overwhelmed.png')));

  Padding get markAsResolvedButton {
    return Padding(
        padding: EdgeInsets.only(top: 20),
        child: PrimaryAction(
            text: 'Mark as resolved [TEST]',
            onPressed: () => Get.to(SuccessScreen(task: task))));
  }

  final learnMoreButton = Padding(
      padding: EdgeInsets.only(top: 20),
      child: PrimaryAction(
          text: 'Learn more',
          onPressed: () => Get.to(OverwhelmedListScreen())));

  Container get currentTask {
    return Container(
        margin: const EdgeInsets.only(bottom: 20, top: 15),
        child: YourTaskWell(task: task));
  }
}
