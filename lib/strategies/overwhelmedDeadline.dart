import 'package:do_it/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:date_time_format/date_time_format.dart';

class OverwhelmedDeadline extends StatelessWidget {
  final Rx<SubTask> subTask;

  OverwhelmedDeadline(this.subTask);

  @override
  Widget build(BuildContext context) {
    return Text(subTask.value.deadline.relative(
      appendIfAfter: 'ago',
      prependIfBefore: 'in',
      ifNow: 'now',
      minUnitOfTime: UnitOfTime.minute,
    ));
  }
}
