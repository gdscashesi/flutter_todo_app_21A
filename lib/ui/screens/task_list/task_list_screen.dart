import 'package:flutter/material.dart';
import 'package:todo/ui/screens/add_task/add_task_screen.dart';
import 'package:todo/ui/screens/task_list/widgets/custom_tab.dart';
import 'package:todo/ui/widgets/page_widget.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  Widget build(BuildContext context) {

    return PageWidget(
        title: "All To Do's",
        child: const CustomTab(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=> const AddTaskScreen()
              )
          );
        },
      ),
    )
    ;
  }
}

