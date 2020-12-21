import 'package:do_it/shareable/primaryAction.dart';
import 'package:do_it/shareable/screenTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../addTaskScreen.dart';

class DistractedStrategy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScreenTitle(title: 'Distracted strategy'),
            Container(
              height: 200,
              padding: EdgeInsets.only(bottom: 30),
              child: Center(
                child: Text(
                  'Coming soon...',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
            PrimaryAction(
              onPressed: () => Get.to(AddTaskScreen()),
              text: 'Add another task',
            ),
          ],
        ),
      ),
    );
  }
}
