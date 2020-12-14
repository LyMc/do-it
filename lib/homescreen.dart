import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'addTaskScreen.dart';
import 'theme.dart';
import 'tasksController.dart';

class Homescreen extends StatelessWidget {
  final TasksController tasksController = Get.put(TasksController());

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
          decoration: BoxDecoration(color: AppColors.purple),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            headerImage,
            title,
            quote,
            quoteAuthor,
            getStartedButton
          ]),
        ));
  }

  final headerImage = Container(
    width: 500,
    height: 300,
    child: SvgPicture.asset(
      'assets/homescreen.svg',
    ),
  );

  final title = Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
      child: Text(
        'Beat Procrastination Today',
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 32, color: Colors.white),
      ));

  final quote = Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: Text(
        '"Don\'t put off for tomorrow what you can do today because if you enjoy it today, you can do it again tomorrow."',
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ));

  final quoteAuthor = Text('James A. Michener',
      style: TextStyle(
        color: Colors.white,
      ));

  final getStartedButton = Padding(
      padding: EdgeInsets.only(top: 100),
      child: RaisedButton(
        onPressed: () => Get.off(AddTaskScreen()),
        padding:
            const EdgeInsets.only(top: 15, bottom: 15, left: 40, right: 40),
        textColor: Colors.black87,
        color: AppColors.yellow,
        child: Text(
          "Get started",
          style: TextStyle(fontSize: 24),
        ),
      ));
}
