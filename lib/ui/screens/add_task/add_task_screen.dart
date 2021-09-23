import 'package:flutter/material.dart';
import 'package:todo/ui/widgets/custom_textfield.dart';
import 'package:todo/ui/widgets/page_widget.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: PageWidget(
          title: 'New To Do',
          child: Container(
            padding: const EdgeInsets.all(12) + const EdgeInsets.only( left: 12),
            child: Column(
              children: [

                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.folder_shared),
                    ),
                    DropdownButton(
                      value: "All",
                      onChanged: (val){

                      },
                      items: const [
                        DropdownMenuItem(
                          child: Text("All"),
                          value: "All",
                        ),

                        DropdownMenuItem(
                          child: Text("Work"),
                          value: "Work",
                        )
                      ],

                    ),
                  ],
                ),


                CustomTextField(
                    controller: TextEditingController(),
                  hintText: "Title",
                ),


                CustomTextField(
                    controller: TextEditingController(),
                  maxLines: 5,
                  hintText: "Notes",
                ),

                SwitchListTile(
                  value: false,
                  title: const Text("Set Date"),
                  onChanged: (value){

                  },
                ),


                //todo malke alarm widget
                ListTile(
                  title: const Text("Alarm"),
                  trailing: const Text("Mon 30/02/2021, 16,2:00PM"),
                  onTap: (){

                  },
                ),


                ListTile(
                  title: const Text("Priority"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: (){

                  },
                ),
                TextButton(
                  child: Row(
                    children: const [
                      Icon(Icons.add),
                      Text("Add Image", style: TextStyle(color: Colors.black),)
                    ],
                  ),
                  onPressed: (){

                  },
                ),



                const Spacer(flex: 3,),
                ElevatedButton(
                  style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18
                          )
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(232)
                      )),
                      // backgroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(const EdgeInsets.all(16))
                  ),
                  child: SizedBox(
                      width: size.width * 0.7,
                      child: const Center(child: Text("Create"))),
                  onPressed: (){

                  },
                ),

                const Spacer(flex: 1,),
              ],
            ),
          ),
        )
    );
  }
}
