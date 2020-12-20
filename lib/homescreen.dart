import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'addTaskScreen.dart';
import 'tasksController.dart';
import 'shareable/primaryAction.dart';

class Homescreen extends StatelessWidget {
  final TasksController tasksController = Get.put(TasksController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 60),
            headerImage,
            title,
            quote,
            quoteAuthor,
            getStartedButton,
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  final headerImage = Container(
    width: 500,
    height: 300,
    child: SvgPicture.asset(
      'assets/homescreen.svg',
    ),
  );

  final title = Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 40),
    child: Text(
      'Beat Procrastination Today',
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      style: TextStyle(fontSize: 32),
    ),
  );

  final quote = Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Text(
      '"Don\'t put off for tomorrow what you can do today because if you enjoy it today, you can do it again tomorrow."',
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18),
    ),
  );

  final quoteAuthor = Text(
    'James A. Michener',
    textAlign: TextAlign.center,
  );

  final getStartedButton = Padding(
    padding: EdgeInsets.only(top: 100),
    child: PrimaryAction(
      text: "Get started",
      onPressed: () => Get.to(
        AddTaskScreen(),
      ),
    ),
  );
}
