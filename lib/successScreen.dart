import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 60),
            Container(
              width: 400,
              height: 300,
              child: Image(
                image: AssetImage('assets/success.png'),
              ),
            ),
            SizedBox(height: 20),
            ScreenTitle(title: 'Congrats!'),
            Text(
              'You\'ve successfully completed your task and beat procrastination. '
              'Keep up the good work!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            YourTaskWell(task: this.task),
            SizedBox(height: 65),
            PrimaryAction(
              text: 'Add new task',
              onPressed: () => Get.to(AddTaskScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
