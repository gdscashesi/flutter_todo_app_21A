import 'package:flutter/material.dart';
import 'package:todo/utils/constants.dart';




class WeeklyTaskList extends StatefulWidget {
  const WeeklyTaskList({Key? key}) : super(key: key);

  @override
  _WeeklyTaskListState createState() => _WeeklyTaskListState();
}

class _WeeklyTaskListState extends State<WeeklyTaskList> {
   late List<bool> _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = List.filled(days.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: days.length,
        itemBuilder: (context, index) => ExpansionTile(
            title: Text(days.elementAt(index),
              textAlign: _expanded[index] ? TextAlign.center : TextAlign.start,
            ),
          onExpansionChanged: (expanded){
            setState(() {
              _expanded[index] = expanded;
            });
          },
          children: tasks.map((e) => _Tile(
            title: e,
            time: "2:00 PM",
          )).toList(),
          trailing: _expanded[index] ? const Icon(Icons.remove) : const Icon(Icons.add),
        )
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
      title: Text(
        widget.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          decoration: val ? TextDecoration.lineThrough : TextDecoration.none,
          color: val ? Colors.grey :null
      ),),
      trailing: Text(widget.time),
    );
  }
}
