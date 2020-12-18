import 'package:get/get.dart';
import 'models.dart';

class TasksController extends GetxController {
  var tasks = <Task>[].obs;
  Task newTask;

  createTask(String name) {
    newTask = new Task(name);
  }

  Task addTask(Strategy strategy) {
    Task task;
    switch (strategy) {
      case Strategy.confidence:
        task = new ConfidenceTask(newTask.name);
        break;
      case Strategy.despise:
        task = new DespiseTask(newTask.name);
        break;
      case Strategy.distracted:
        task = new DistractedTask(newTask.name);
        break;
      case Strategy.overwhelmed:
        task = new OverwhelmedTask(newTask.name);
        break;
      case Strategy.creativityBlocked:
        task = new CreativityBlockedTask(newTask.name);
        break;
    }

    tasks.add(task);
    newTask = null;
    return task;
  }
}

class SubTaskController extends GetxController {
  var subTasks = <Rx<SubTask>>[].obs;

  SubTaskController() {
    add();
  }

  add() {
    subTasks.add(SubTask().obs);
  }

  remove(subTask) {
    subTasks.remove(subTask);
  }

  subTaskAdd(Rx<SubTask> subTask) {
    subTask.value.subTasks.add(SubTask().obs);
  }

  subTaskRemove(Rx<SubTask> subTaskParent, subTask) {
    subTaskParent.value.subTasks.remove(subTask);
  }
}
