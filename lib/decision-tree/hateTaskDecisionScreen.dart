import 'package:do_it/decision-tree/successfulTaskDecisionScreen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:get/get.dart';

import 'decisionScreen.dart';
import 'beginTaskDecisionScreen.dart';

class HateTaskDecisionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DecisionScreen(
      title: 'Do you hate this task?',
      icon: MdiIcons.heartBroken,
      onYes: () => Get.to(SuccessfulTaskDecisionScreen()),
      noText: 'NOT REALLY',
      onNo: () => Get.to(BeginTaskDecisionScreen()),
    );
  }
}
