import 'package:do_it/models.dart';
import 'package:do_it/strategies/overwhelmedStrategy.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:get/get.dart';

import 'decisionScreen.dart';
import '../strategies/creativityBlockedStrategy.dart';
import '../tasksController.dart';

class OverwhelmingTaskDecisionScreen extends StatelessWidget {
  final TasksController _tasksController = Get.find();

  @override
  Widget build(BuildContext context) {
    return new DecisionScreen(
        title: 'Does this task seem overwhelming?',
        icon: MdiIcons.weatherLightning,
        onYes: () {
          OverwhelmedTask task =
              this._tasksController.addTask(Strategy.overwhelmed);
          Get.offAll(OverwhelmedStrategy(task: task));
        },
        onNo: () => Get.offAll(CreativityBlockedStrategy()));
  }
}
