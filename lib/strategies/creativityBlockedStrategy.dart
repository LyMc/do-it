import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../addTaskScreen.dart';
import '../theme.dart';

class CreativityBlockedStrategy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
            decoration: BoxDecoration(color: AppColors.purple),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(child: Text("Overwhelmed Strategy")),
              FlatButton(
                  onPressed: () => Get.to(AddTaskScreen()),
                  child: Text("Add another task"))
            ])));
  }
}
