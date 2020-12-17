import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';
import '../tasksController.dart';
import '../shareable/screenTitle.dart';
import '../shareable/yourTaskWell.dart';

class DecisionScreen extends StatelessWidget {
  final TasksController _tasksController = Get.find();

  final String title;
  final IconData icon;
  final String yesText;
  final String noText;
  final GestureTapCallback onYes;
  final GestureTapCallback onNo;

  DecisionScreen(
      {@required this.title,
      @required this.icon,
      @required this.onYes,
      @required this.onNo,
      this.yesText = 'YES',
      this.noText = 'NO'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Decision Tree"),
        ),
        body: Container(
            decoration: BoxDecoration(color: AppColors.purple),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(this.icon, color: Colors.white, size: 100),
                  ScreenTitle(title: this.title),
                  currentTask,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: OutlineButton(
                            onPressed: this.onYes,
                            borderSide: BorderSide(color: Colors.white),
                            child: Text(
                              this.yesText,
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      OutlineButton(
                        onPressed: this.onNo,
                        borderSide: BorderSide(color: Colors.white),
                        child: Text(
                          this.noText,
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  )
                ])));
  }

  Container get currentTask {
    return Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: YourTaskWell(task: _tasksController.newTask));
  }
}
