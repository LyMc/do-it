import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class TasksController extends GetxController {
  var tasks = <Task>[].obs;
  Task currentTask;

  addTask(String name) {
    var task = new Task(name);
    tasks.add(task);
    setCurrentTask(task);
  }

  setCurrentTask(Task task) {
    currentTask = task;
  }
}

class Task {
  String name;
  var id;

  Task(name)
      : name = name,
        id = Uuid();
}
