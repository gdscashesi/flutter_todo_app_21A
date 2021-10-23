

import 'package:flutter/cupertino.dart';
import 'package:todo/utils/models/task.dart';

class TaskList extends ChangeNotifier{
  int _taskCount = 0;
  Map<String, Map<String,Task>> _tasks = {};


  int get taskCount => _taskCount;


  void addTask({required Task task}){

    if (_tasks.containsKey(task.taskGroup)){
      _tasks[task.taskGroup]!.addAll({task.reference!: task});

    } else {
      _tasks[task.taskGroup] = {task.reference! : task};
    }

    _taskCount++;
  }


  void removeTask(Task task){
    if (_tasks.containsKey(task.taskGroup)) {
      _tasks[task.taskGroup]!.remove(task.reference);
      _taskCount++;
    }
  }


  int getGroupCount(String group){
    return _tasks[group] == null ? 0 : _tasks[group]!.length ;
  }


  ///Returns the tasks in the list belonging to [group]. If no group is
  ///provided, all the lists
  Map<String, Task> getTasks({String? group}){
    if (group != null){
      return _tasks[group] ?? {};
    }
    //todo test without group
    Map<String, Task> all = {};
    for (var element in _tasks.values) {
      all.addAll(element);
    }

    return all;
  }

}