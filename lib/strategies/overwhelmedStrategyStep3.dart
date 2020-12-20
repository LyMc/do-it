import 'package:do_it/models.dart';
import 'package:do_it/shareable/appBar.dart';
import 'package:do_it/strategies/overwhelmedDeadline.dart';
import 'package:do_it/strategies/overwhelmedStrategyStep4.dart';
import 'package:do_it/tasksController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverwhelmedStrategyStep3 extends StatelessWidget {
  final OverwhelmedTask task;

  OverwhelmedStrategyStep3({@required this.task});

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
                'Set interim deadlines',
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
                                  title: Text(
                                    subTask.value.name,
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  subtitle: subTask.value.deadline != null
                                      ? OverwhelmedDeadline(subTask)
                                      : null,
                                  trailing: IconButton(
                                    icon: Icon(Icons.schedule),
                                    onPressed: () async {
                                      final date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.now()
                                            .add(Duration(days: 365)),
                                      );
                                      if (date == null) return null;
                                      final time = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      );
                                      if (time == null) return null;
                                      final dateTime = date.add(Duration(
                                        hours: time.hour,
                                        minutes: time.minute,
                                      ));
                                      subTask.update((val) {
                                        val.deadline = dateTime;
                                      });
                                    },
                                  ),
                                ),
                                for (var subSubTask in subTask.value.subTasks)
                                  if (subSubTask.value.name.isNotEmpty)
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(18),
                                          child: Icon(Icons.circle, size: 10),
                                        ),
                                        Expanded(
                                          child: Text(subSubTask.value.name),
                                        ),
                                      ],
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
            RaisedButton(
              onPressed: () => Get.to(OverwhelmedStrategyStep4(task: task)),
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
