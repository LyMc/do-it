import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'theme.dart';
import 'addTaskScreen.dart';
import 'shareable/primaryAction.dart';
import 'shareable/screenTitle.dart';
import 'shareable/yourTaskWell.dart';
import 'models.dart';

class SuccessScreen extends StatelessWidget {
  final Task task;

  SuccessScreen({@required this.task});

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
            decoration: BoxDecoration(color: AppColors.purple),
            padding: const EdgeInsets.all(25),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  imageHeader,
                  ScreenTitle(title: 'Congrats!'),
                  description,
                  taskWell,
                  addTaskButton
                ])));
  }

  final imageHeader = Container(
      width: 400,
      height: 300,
      margin: const EdgeInsets.only(top: 60, bottom: 20),
      child: Image(image: AssetImage('assets/success.png')));

  Container get taskWell {
    return Container(
        margin: const EdgeInsets.only(bottom: 20, top: 15),
        child: YourTaskWell(task: this.task));
  }

  final description = Text(
      "You've successfully completed your task and beat procrastination. Keep up the good work!",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: 20));

  final addTaskButton = Padding(
      padding: EdgeInsets.only(top: 50),
      child: PrimaryAction(
          text: 'Add new task', onPressed: () => Get.to(AddTaskScreen())));
}
