import 'package:do_it/addTaskScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'theme.dart';
import 'tasksController.dart';

class HateTaskDecisionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TasksController tasksController = Get.find();

    return Material(
        type: MaterialType.transparency,
        child: Container(
            child: Container(
                decoration: BoxDecoration(color: AppColors.purple),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${tasksController.currentTask.name}"),
                      RaisedButton(
                        onPressed: () => Get.off(AddTaskScreen()),
                        child: Text("Test back"),
                      )
                    ]))));
  }
}
