import 'package:uuid/uuid.dart';

class Task {
  String name;
  var id;

  Task(name)
      : name = name,
        id = Uuid();
}
