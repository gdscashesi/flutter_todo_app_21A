import 'package:flutter/material.dart';
import 'package:todo/ui/widgets/custom_alarm_widget.dart';
import 'package:todo/ui/widgets/custom_button.dart';
import 'package:todo/ui/widgets/custom_image_picker.dart';
import 'package:todo/ui/widgets/custom_textfield.dart';
import 'package:todo/ui/widgets/page_widget.dart';
import 'package:todo/ui/widgets/select_priority_tile.dart';
import 'package:todo/ui/widgets/task_group_drop_down.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late DateTime date;
  late bool setDate;
  late String taskGroup;
  late List<String> imageList;
  int? priority;
  TextEditingController title = TextEditingController();
  TextEditingController notes = TextEditingController();

  @override
  void initState() {
    super.initState();
    date = DateTime.now();
    setDate = false;
    taskGroup = "all";
    imageList = [];
  }


  @override
  void dispose() {
    title.dispose();
    notes.dispose();

    super.dispose();
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: PageWidget(
          title: 'New To Do',
          child: Container(
            padding: const EdgeInsets.all(12) + const EdgeInsets.only( left: 12),
            child: Column(
              children: [

                Align(
                  alignment: Alignment.centerLeft,
                  child: TaskGroupDropDown(
                      value: taskGroup
                  ),
                ),

                CustomTextField(
                    controller: title,
                  hintText: "Title",
                ),


                CustomTextField(
                    controller: notes,
                  maxLines: 5,
                  hintText: "Notes",
                ),

                SwitchListTile(
                  value: setDate,
                  title: const Text("Set Date"),
                  onChanged: (value){
                    setState(() {
                      setDate = value;
                    });
                  },
                ),


                CustomAlarmWidget(
                  selectedDate: date,
                  enabled : setDate
                ),


                const Divider(thickness: 1,),
                SelectPriorityTile(
                  value: priority
                ),
                const Divider(thickness: 1,),


                CustomImagePicker(
                  images: imageList
                ),



                const Spacer(flex: 3,),


            CustomButton(
              text: "Create",
              onPressed: (){
                Navigator.pop(context);
              }
            ),

                const Spacer(flex: 1,),
              ],
            ),
          ),
        )
    );
  }
}