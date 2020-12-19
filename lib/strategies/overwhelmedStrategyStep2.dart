import 'package:do_it/models.dart';
import 'package:do_it/shareable/appBar.dart';
import 'package:do_it/strategies/overwhelmedStrategyStep3.dart';
import 'package:do_it/tasksController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverwhelmedStrategyStep2 extends StatelessWidget {
  final OverwhelmedTask task;

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
                                ),
                                for (var subSubTask in subTask.value.subTasks)
                                  Dismissible(
                                    key: Key(subSubTask.hashCode.toString()),
                                    onDismissed: (direction) {
                                      subTasksController.subTaskRemove(
                                          subTask, subSubTask);
                                    },
                                    background: Card(color: Colors.red),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(18),
                                          child: Icon(Icons.circle, size: 10),
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            initialValue: subSubTask.value.name,
                                            focusNode:
                                                subSubTask.value.focusNode,
                                            onChanged: (value) => subSubTask
                                                .update((t) => t.name = value),
                                            autofocus: true,
                                            decoration: const InputDecoration(
                                              hintText: 'Enter a sub-task',
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (subTask.value.subTasks.length == 0 ||
                                    subTask.value.subTasks.last.value.name
                                        .isNotEmpty)
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                          top: 15,
                                          left: 15,
                                          bottom: 15,
                                          right: 6,
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          size: 16,
                                          color: Colors.white54,
                                        ),
                                      ),
                                      TextButton(
                                        child: Text(
                                          'Add new item',
                                          style:
                                              TextStyle(color: Colors.white54),
                                        ),
                                        onPressed: () {
                                          subTasksController
                                              .subTaskAdd(subTask);
                                          subTask.value.subTasks
                                              .last()
                                              .focusNode
                                              .requestFocus();
                                        },
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
