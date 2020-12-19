import 'package:do_it/models.dart';
import 'package:do_it/shareable/appBar.dart';
import 'package:do_it/strategies/overwhelmedDeadline.dart';
import 'package:do_it/successScreen.dart';
import 'package:do_it/tasksController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverwhelmedStrategyStep4 extends StatelessWidget {
  final OverwhelmedTask task;

  OverwhelmedStrategyStep4({@required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Overwhelmed Strategy'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 15),
              Text(
                'That\'s all. Check when you have finished a task.',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              GetX<SubTaskController>(
                builder: (subTasksController) {
                  return Column(
                    children: [
                      for (var subTask in subTasksController.subTasks)
                        if (subTask.value.name.isNotEmpty)
                          Card(
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Checkbox(
                                    value: subTask.value.isCompleted,
                                    onChanged: (isChecked) => subTask.update(
                                      (t) {
                                        t.isCompleted = isChecked;
                                      },
                                    ),
                                    checkColor: Theme.of(context).cardColor,
                                  ),
                                  title: Text(
                                    subTask.value.name,
                                    style: TextStyle(
                                      fontSize: 24,
                                      decoration: subTask.value.isCompleted
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                    ),
                                  ),
                                  subtitle: subTask.value.deadline != null
                                      ? OverwhelmedDeadline(subTask)
                                      : null,
                                ),
                                AnimatedContainer(
                                  height: subTask.value.isCompleted
                                      ? 0
                                      : subTask.value.subTasks.length * 48.0,
                                  curve: Curves.easeInOut,
                                  duration: Duration(milliseconds: 400),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        for (var subSubTask
                                            in subTask.value.subTasks)
                                          if (subSubTask.value.name.isNotEmpty)
                                            Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 16,
                                                  ),
                                                  child: Checkbox(
                                                    value: subSubTask
                                                        .value.isCompleted,
                                                    onChanged: (isChecked) {
                                                      subSubTask.update(
                                                        (t) {
                                                          t.isCompleted =
                                                              isChecked;
                                                        },
                                                      );
                                                      if (subTask.value.subTasks
                                                          .every((t) => t.value
                                                              .isCompleted)) {
                                                        subTask.update((t) {
                                                          t.isCompleted =
                                                              isChecked;
                                                        });
                                                      }
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    subSubTask.value.name,
                                                    style: TextStyle(
                                                      decoration: subSubTask
                                                              .value.isCompleted
                                                          ? TextDecoration
                                                              .lineThrough
                                                          : TextDecoration.none,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ButtonBar(
          buttonMinWidth: 200.0, // half width
          children: [
            OutlineButton(
              child: Text('Previous'),
              onPressed: () => Get.back(),
            ),
            GetX<SubTaskController>(
              builder: (subTaskController) {
                return RaisedButton(
                  onPressed: subTaskController.subTasks.every(
                          (t) => t.value.name.isEmpty || t.value.isCompleted)
                      ? () => Get.to(SuccessScreen(task: task))
                      : null,
                  child: Text("Next"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
