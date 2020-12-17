import 'package:do_it/shareable/screenTitle.dart';
import 'package:do_it/strategies/overwhelmed/item.dart';
import 'package:do_it/tasksController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverwhelmedListScreen extends StatelessWidget {
  final subTasksController = Get.put(SubTaskController());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ScreenTitle(title: 'List how you\'ll know you\'re done'),
              Expanded(
                child: Obx(
                  () => ListView(
                    padding: const EdgeInsets.all(0),
                    children: [
                      for (var subTask in subTasksController.subTasks)
                        ListItem(
                          subTask: subTask,
                        ),
                      Card(
                        child: TextButton(
                          child: Text(
                            '+ Add new item',
                            style: TextStyle(color: Colors.white54),
                          ),
                          onPressed: () {
                            final currentFocus = FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            subTasksController.add();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ButtonBar(
                children: [
                  RaisedButton(
                    onPressed: () => {},
                    child: Text('Next', style: TextStyle(fontSize: 16)),
                    color: Theme.of(context).accentColor,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
