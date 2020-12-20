import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models.dart' as models;

class StepItem extends StatelessWidget {
  final models.Step step;

  StepItem({@required this.step});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Obx(
        () => CheckboxListTile(
          contentPadding: EdgeInsets.all(15),
          checkColor: Colors.black54,
          secondary: Icon(this.step.icon),
          value: this.step.isCompleted,
          onChanged: (bool value) {
            this.step.toggleCompleted(value);
          },
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text("${this.step.title}"),
          ),
          subtitle: Text("${this.step.description}"),
        ),
      ),
    );
  }
}
