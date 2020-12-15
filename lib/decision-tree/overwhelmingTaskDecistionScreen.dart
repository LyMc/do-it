import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:get/get.dart';

import 'decisionScreen.dart';
import '../strategies/overwhelmedStrategy.dart';
import '../strategies/creativityBlockedStrategy.dart';

class OverwhelmingTaskDecisionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DecisionScreen(
        title: 'Does this task seem overwhelming?',
        icon: MdiIcons.weatherLightning,
        onYes: () => Get.to(OverwhelmedStrategy()),
        onNo: () => Get.offAll(CreativityBlockedStrategy()));
  }
}
