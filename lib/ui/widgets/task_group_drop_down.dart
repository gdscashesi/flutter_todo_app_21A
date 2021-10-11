import "package:flutter/material.dart";


class TaskGroupDropDown extends StatefulWidget {
  String value;

  TaskGroupDropDown({
    required this.value,
    Key? key}) : super(key: key);

  @override
  _TaskGroupDropDownState createState() => _TaskGroupDropDownState();
}

class _TaskGroupDropDownState extends State<TaskGroupDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.value,
        onChanged: (newVal) => setState(() {
          widget.value = newVal!;
        }),
        items: [

          DropdownMenuItem(
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.insert_drive_file),
                ),

                Text("All")
              ],
            ),
            value: "all",
          ),


          DropdownMenuItem(
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.shopping_cart),
                ),

                Text("Groceries")
              ],
            ),
            value: "groceries",
          ),


          DropdownMenuItem(
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.music_note),
                ),

                Text("Music")
              ],
            ),
            value: "music",
          ),


          DropdownMenuItem(
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.person),
                ),

                Text("Personal")
              ],
            ),
            value: "personal",
          ),


          DropdownMenuItem(
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.folder),
                ),

                Text("Work")
              ],
            ),
            value: "work",
          ),

        ]
    );
  }
}

