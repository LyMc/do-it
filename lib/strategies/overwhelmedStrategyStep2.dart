import 'package:do_it/models.dart';
import 'package:do_it/shareable/appBar.dart';
import 'package:do_it/strategies/overwhelmedStrategyStep3.dart';
import 'package:do_it/tasksController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverwhelmedStrategyStep2 extends StatelessWidget {
  final OverwhelmedTask task;
  final subTasksController = Get.put(SubTaskController());

  OverwhelmedStrategyStep2({@required this.task});

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
                'Great! Now, let\'s create byte-sized pieces for each item.\n'
                '✅ Use actionable verbs for this step.',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Obx(
                () => Column(
                  children: [
                    for (var subTask in subTasksController.subTasks)
                      Column(
                        children: [
                          Card(
                            color: Colors.transparent,
                            child: ListTile(
                              title: Text(subTask.value.name.value),
                            ),
                          ),
                          for (var subSubTask in subTask.value.subTasks)
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Dismissible(
                                key: Key(subSubTask.hashCode.toString()),
                                onDismissed: (direction) {
                                  subTasksController.subTaskRemove(
                                      subTask, subSubTask);
                                },
                                background: Card(color: Colors.red),
                                child: Card(
                                  color: Colors.transparent,
                                  child: ListTile(
                                    title: TextFormField(
                                      initialValue: subSubTask.value.name.value,
                                      onChanged: (value) =>
                                          subSubTask.value.name.value = value,
                                      autofocus: false,
                                      decoration: const InputDecoration(
                                        hintText: 'Enter a sub-task',
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (subTask.value.subTasks.length == 0 ||
                              subTask.value.subTasks.last.value.name.value
                                  .isNotEmpty)
                            TextButton(
                              child: Text(
                                '+ Add new item',
                                style: TextStyle(color: Colors.white54),
                              ),
                              onPressed: () {
                                subTasksController.subTaskAdd(subTask);
                              },
                            ),
                        ],
                      ),
                  ],
                ),
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
            RaisedButton(
              onPressed: () => Get.to(OverwhelmedStrategyStep3(task: task)),
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
