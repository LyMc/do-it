import 'package:do_it/strategies/distractedStrategy.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:get/get.dart';

import 'decisionScreen.dart';
import 'overwhelmingTaskDecistionScreen.dart';

class BeginTaskDecisionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DecisionScreen(
        title: 'Do you know where and how to begin this task?',
        icon: MdiIcons.directionsFork,
        onYes: () => Get.offAll(DistractedStrategy()),
        onNo: () => Get.to(OverwhelmingTaskDecisionScreen()));
  }
}
