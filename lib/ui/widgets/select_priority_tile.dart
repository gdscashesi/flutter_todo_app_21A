import "package:flutter/material.dart";

class SelectPriorityTile extends StatefulWidget {
  int? value;
  SelectPriorityTile({required this.value, Key? key}) : super(key: key);

  @override
  _SelectPriorityTileState createState() => _SelectPriorityTileState();
}

class _SelectPriorityTileState extends State<SelectPriorityTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("Priority"),
      subtitle: _displayPriority(widget.value),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {

        showDialog(
            context: context,
            builder: (context) => SimpleDialog(
              title: const Text("Select Priority", style: TextStyle(color: Colors.black),),
              children: [

                ListTile(
                  title: const Text("None"),
                  onTap: (){
                    setState(() {
                      widget.value = null;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text("Low Priority"),
                  onTap: (){
                    setState(() {
                      widget.value = 0;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text("Medium Priority"),
                  onTap: (){
                    setState(() {
                      widget.value = 1;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text("High Priority"),
                  onTap: (){
                    setState(() {
                      widget.value = 2;
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
                ));
      },
    );
  }
}

Widget? _displayPriority(int? value) {
  switch (value){
    case 0:
      return const Text("Low Priority");
    case 1:
      return const Text("Medium Priority");
    case 2:
      return const Text("High Priority");
    default:
      return null;
  }
}
