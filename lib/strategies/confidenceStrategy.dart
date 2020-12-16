import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../addTaskScreen.dart';
import '../theme.dart';
import '../models.dart';
import '../shareable/screenTitle.dart';
import '../shareable/yourTaskWell.dart';

class ConfidenceStrategy extends StatelessWidget {
  final ConfidenceTask task;

  ConfidenceStrategy({@required this.task});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(color: AppColors.purple),
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: 400,
              height: 250,
              margin: const EdgeInsets.only(top: 60),
              child: Image(
                image: AssetImage('assets/lackOfConfidence.png'),
              ),
            ),
            ScreenTitle(title: 'Lack of Confidence'),
            Text(
                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
                style: TextStyle(color: Colors.white)),
            Container(
              margin: const EdgeInsets.only(bottom: 20, top: 15),
              child: YourTaskWell(task: this.task),
            ),
            Text(
              "Steps",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            ListView.builder(
              // separatorBuilder: (context, index) =>
              //     Divider(color: Colors.black54),
              itemCount: task.steps.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Obx(
                      () => CheckboxListTile(
                        secondary: Icon(Icons.wb_sunny),
                        value: task.steps[index].isCompleted,
                        onChanged: (bool value) {
                          task.steps[index].toggleCompleted(value);
                        },
                        title: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text("${task.steps[index].title}")),
                        subtitle: Text("${task.steps[index].description}"),
                      ),
                    ),
                  ),
                );
              },
            ),
            FlatButton(
              onPressed: () => Get.to(AddTaskScreen()),
              child: Text("Add another task"),
            )
          ]),
        ),
      ),
    );
  }
}
