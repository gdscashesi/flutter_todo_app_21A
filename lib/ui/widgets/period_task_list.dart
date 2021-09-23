import "package:flutter/material.dart";


class PeriodTaskList extends StatefulWidget {
  const PeriodTaskList({Key? key}) : super(key: key);

  @override
  _PeriodTaskListState createState() => _PeriodTaskListState();
}

class _PeriodTaskListState extends State<PeriodTaskList> {
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







//todo restyle for week and month
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

