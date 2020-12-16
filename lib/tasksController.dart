import 'package:get/get.dart';
import 'models.dart';

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
