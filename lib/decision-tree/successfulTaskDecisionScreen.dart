import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:get/get.dart';

import 'decisionScreen.dart';
import '../strategies/despiseStrategy.dart';
import '../strategies/confidenceStrategy.dart';

class SuccessfulTaskDecisionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DecisionScreen(
        title:
            'Would you enjoy more this task if you will be successful at it?',
        icon: MdiIcons.trophy,
        yesText: "MAYBE",
        onYes: () => Get.offAll(ConfidenceStrategy()),
        onNo: () => Get.offAll(DespiseStrategy()));
  }
}
