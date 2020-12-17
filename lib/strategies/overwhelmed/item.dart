import 'package:do_it/models.dart';
import 'package:do_it/tasksController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'dart:developer';

class ListItem extends StatelessWidget {
  ListItem({this.subTask});

  final SubTask subTask;
  final SubTaskController subTaskController = Get.find();

  @override
  Widget build(BuildContext context) {
    // inspect(subTask);
    return Card(
      //  color: Colors.transparent,
      child: ListTile(
        title: TextFormField(
          initialValue: subTask.name,
          onChanged: (value) {
            subTask.name = value;
          },
          onEditingComplete: () {
            if (subTask.isLastAdded) {
              subTaskController.add();
            }
          },
          autofocus: subTask.isLastAdded,
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
    );
  }
}
