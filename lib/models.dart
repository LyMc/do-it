import 'package:uuid/uuid.dart';
import 'package:get/get.dart';

class Task {
  String name;
  var id;
  Strategy strategy;
  var isFinished = false;

  Task(name)
      : name = name,
        id = Uuid();
}

class DespiseTask extends Task {
  DespiseTask(String name) : super(name) {
    this.strategy = Strategy.despise;
  }
}

class ConfidenceTask extends Task {
  final List<Step> steps = [
    Step(
        title: 'Build skill set',
        description:
            'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book'),
    Step(
        title: 'Counter negative self-talk',
        description:
            'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book'),
    Step(
        title: 'Start easy',
        description:
            'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book')
  ];
  ConfidenceTask(String name) : super(name) {
    this.strategy = Strategy.confidence;
  }
}

class DistractedTask extends Task {
  DistractedTask(String name) : super(name) {
    this.strategy = Strategy.distracted;
  }
}

class OverwhelmedTask extends Task {
  OverwhelmedTask(String name) : super(name) {
    this.strategy = Strategy.overwhelmed;
  }
}

class CreativityBlockedTask extends Task {
  CreativityBlockedTask(String name) : super(name) {
    this.strategy = Strategy.creativityBlocked;
  }
}

enum Strategy {
  despise,
  confidence,
  distracted,
  overwhelmed,
  creativityBlocked
}

class Step {
  final String title;
  final String description;
  var _isCompleted = false.obs;

  Step({this.title, this.description});

  get isCompleted {
    return this._isCompleted.value;
  }

  toggleCompleted(bool value) {
    this._isCompleted.value = value;
  }
}
