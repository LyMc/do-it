import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'well.dart';
import '../models.dart';

class YourTaskWell extends StatelessWidget {
  final Task task;

  YourTaskWell({@required this.task});

  @override
  Widget build(BuildContext context) {
    return Well(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text("Your task",
              style: TextStyle(color: Colors.white, fontSize: 18))),
      Row(children: [
        Icon(MdiIcons.calendarCheck, color: Colors.white),
        Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              "${this.task.name}",
              style: TextStyle(color: Colors.white),
            ))
      ])
    ]));
  }
}
