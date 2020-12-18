import 'package:do_it/shareable/appBar.dart';
import 'package:do_it/successScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../addTaskScreen.dart';
import '../models.dart';
import '../shareable/screenTitle.dart';
import '../shareable/yourTaskWell.dart';
import 'steps/stepList.dart';

class ConfidenceStrategy extends StatelessWidget {
  final ConfidenceTask task;

  ConfidenceStrategy({@required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Confidence Strategy'),
      body: Container(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerImage,
              ScreenTitle(title: 'Lack of Confidence'),
              Text(
                  "You lack confidence in your abilities, and this stops you from completing your task. Follow the steps we provide to boost your confidence. You can do it!"),
              currentTask,
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Steps",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              StepList(steps: this.task.steps)
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: OutlineButton(
                  onPressed: () => Get.to(AddTaskScreen()),
                  child: Text("Add another task"),
                ),
              ),
              Obx(
                () => RaisedButton(
                  onPressed: _hasUncompletedSteps ? null : _markAsResolved,
                  child: Text("Mark as resolved"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool get _hasUncompletedSteps {
    return this.task.steps.any((step) => !step.isCompleted);
  }

  void _markAsResolved() {
    this.task.markAsResolved();
    Get.off(SuccessScreen(task: this.task));
  }

  final headerImage = Container(
    width: 400,
    height: 250,
    margin: const EdgeInsets.only(top: 40),
    child: Image(
      image: AssetImage('assets/lackOfConfidence.png'),
    ),
  );

  Widget get currentTask {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, top: 15),
      child: YourTaskWell(task: this.task),
    );
  }
}
