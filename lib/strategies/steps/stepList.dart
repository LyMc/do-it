import 'package:flutter/material.dart';

import '../../models.dart' as models;
import './stepItem.dart';

class StepList extends StatelessWidget {
  final List<models.Step> steps;

  StepList({@required this.steps});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.steps.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Theme(
          data: ThemeData(
            brightness: Brightness.light,
            accentColor: Theme.of(context).accentColor,
          ),
          child: StepItem(step: this.steps[index]),
        );
      },
    );
  }
}
