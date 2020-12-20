import 'package:do_it/models.dart';
import 'package:do_it/shareable/appBar.dart';
import 'package:do_it/shareable/screenTitle.dart';
import 'package:do_it/shareable/yourTaskWell.dart';
import 'package:do_it/strategies/overwhelmedStrategyStep2.dart';
import 'package:do_it/tasksController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverwhelmedStrategy extends StatelessWidget {
  final OverwhelmedTask task;

  OverwhelmedStrategy({@required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Overwhelmed Strategy'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 400,
                height: 300,
                child: Image(image: AssetImage('assets/overwhelmed.png')),
              ),
              ScreenTitle(title: 'Overwhelmed'),
              Text(
                "You feel overwhelmed, let's brake down the job to complete this task:",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 15),
              YourTaskWell(task: task),
              SizedBox(height: 50),
              Text(
                'List how you\'ll know you\'re done',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              GetX<SubTaskController>(
                init: SubTaskController(),
                builder: (subTasksController) => Column(
                  children: [
                    for (var subTask in subTasksController.subTasks)
                      Dismissible(
                        key: Key(subTask.hashCode.toString()),
                        onDismissed: (direction) {
                          subTasksController.remove(subTask);
                        },
                        background: Card(color: Colors.red),
                        child: Card(
                          color: Colors.transparent,
                          child: ListTile(
                            title: TextFormField(
                              initialValue: subTask.value.name,
                              focusNode: subTask.value.focusNode,
                              onChanged: (value) =>
                                  subTask.update((t) => t.name = value),
                              decoration: const InputDecoration(
                                hintText: 'Enter a sub-task',
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              GetX<SubTaskController>(
                builder: (subTasksController) =>
                    subTasksController.subTasks.length == 0 ||
                            subTasksController
                                .subTasks.last.value.name.isNotEmpty
                        ? TextButton(
                            child: Text(
                              '+ Add new item',
                              style: TextStyle(color: Colors.white54),
                            ),
                            onPressed: () {
                              subTasksController.add();
                              subTasksController.subTasks
                                  .last()
                                  .focusNode
                                  .requestFocus();
                            },
                          )
                        : SizedBox(),
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
              child: Text('Next'),
              onPressed: () => Get.to(OverwhelmedStrategyStep2(task: task)),
            ),
          ],
        ),
      ),
    );
  }
}
