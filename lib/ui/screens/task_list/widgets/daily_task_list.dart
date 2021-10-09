import 'package:flutter/material.dart';




class DailyTaskList extends StatefulWidget {
  const DailyTaskList({Key? key}) : super(key: key);

  @override
  _DailyTaskListState createState() => _DailyTaskListState();
}

class _DailyTaskListState extends State<DailyTaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index){
        return const _Tile(
          title: "Do the laundry",
          time: "2:00 PM",
        );
      },
    );
  }
}





class _Tile extends StatefulWidget {
  final String title;
  final String time;

  const _Tile({
    required this.title,
    required this.time,
    Key? key
  }) : super(key: key);

  @override
  __TileState createState() => __TileState();
}

class __TileState extends State<_Tile> {
  bool val = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
      Checkbox(
        onChanged: (bool? value) {
          setState(() {
            val = value ?? false;
          });
        },
        shape: const CircleBorder(),
        value: val,
      ),
      title: Text(widget.title,style: TextStyle(
          decoration: val ? TextDecoration.lineThrough : TextDecoration.none,
          color: val ? Colors.grey :null
      ),),
      subtitle: Text(widget.time),
    );
  }
}
