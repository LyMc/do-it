import 'package:uuid/uuid.dart';
import 'package:get/get.dart';

class Task {
  String name;
  var id;
  Strategy strategy;
  var _isCompleted = false.obs;

  Task(name)
      : name = name,
        id = Uuid();

  get isCompleted {
    return this._isCompleted.value;
  }

  markAsResolved() {
    this._isCompleted.value = true;
  }
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
            'Write down the skills you need to complete this task. Acquire these skills and evaluate yourself. You can ask another person who masters these skills to help you.'),
    Step(
        title: 'Counter negative self-talk',
        description:
            'Write down all your inner critic’s criticisms on one side of a piece of paper. Then write down a more realistic and compassionate appraisal of yourself on the other side. Challenging your inner critic helps stop the shame spiral that feeds into low self-esteem.'),
    Step(
        title: 'Acknolwdge small victories',
        description:
            'Always remember to acknowledge how far you’ve come. Write down your small victories and get in the habit of celebrating each little win.')
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

class SubTask {
  var name = '';
  var isCompleted = false;
  var isLastAdded = true;
  // var deadline; // date?
  var subtasks = <SubTask>[];
}
