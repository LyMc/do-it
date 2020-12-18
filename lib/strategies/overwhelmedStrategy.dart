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
  final subTasksController = Get.put(SubTaskController());

  OverwhelmedStrategy({@required this.task});

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
              Obx(
                () => Column(
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
                              initialValue: subTask.value.name.value,
                              onChanged: (value) =>
                                  subTask.value.name.value = value,
                              autofocus: subTasksController.subTasks.length >
                                      1 &&
                                  subTasksController.subTasks.last == subTask,
                              decoration: const InputDecoration(
                                hintText: 'Enter a sub-task',
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                            // leading: Checkbox(
                            //   value: true,
                            //   onChanged: print,
                            //   checkColor: Theme.of(context).cardColor,
                            // ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Obx(
                () => subTasksController.subTasks.length == 0 ||
                        subTasksController
                            .subTasks.last.value.name.value.isNotEmpty
                    ? TextButton(
                        child: Text(
                          '+ Add new item',
                          style: TextStyle(color: Colors.white54),
                        ),
                        onPressed: () {
                          subTasksController.add();
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
            OutlineButton(
              child: Text('Previous'),
              onPressed: () => Get.back(),
            ),
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
