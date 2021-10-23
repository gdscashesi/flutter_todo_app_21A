import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart' hide Event;
import 'package:flutter/cupertino.dart';
import 'package:todo/utils/models/task.dart';
import 'package:todo/utils/providers/app_state.dart';
import 'package:provider/provider.dart';
import 'package:todo/utils/providers/task_list.dart';


///Adds [task] to the logged in user's database
Future<void> uploadTask({required BuildContext context,required Task task}) async{
  DatabaseReference reference;
  FirebaseDatabase database = FirebaseDatabase.instance;
  User user = context.read<AppState>().user!;

  //create a new reference if event does not have one
  if (task.reference == null) {
    reference = database.reference().child("${user.uid}/tasks").push();
  } else { //update the event details at the event's reference
    reference =
        database.reference().child("${user.uid}/tasks/${task.reference}");

  }


  reference.set(task.toMap());

  task.reference = reference.key;
  context.read<AppState>().taskList.addTask(task: task);
}


///Retrieves the [user]'s saved tasks
Future<void> getTasks(BuildContext context) async{
  FirebaseDatabase database = FirebaseDatabase.instance;
  User user = context.read<AppState>().user!;
  TaskList list = context.read<AppState>().taskList;

  DataSnapshot data = await database.reference().child("${user.uid}/tasks").get();

  Map<String,Map<String,dynamic>> tasks = Map.from(data.value);
  tasks.forEach((key, value) {
    Task t = Task.fromMap(value);
    t.reference = key;
    list.addTask( task: t);
  });
  // data.value


}



///Deletes the [event] from the user's events
Future<void> deleteEvent({required BuildContext context, required Task task}) async{
  //todo add listener to widgets
  User user = context.read<AppState>().user!;
  FirebaseDatabase database = FirebaseDatabase.instance;

  context.read<AppState>().taskList.removeTask(task);
  await database.reference().child("${user.uid}/task/${task.reference}").remove();
}