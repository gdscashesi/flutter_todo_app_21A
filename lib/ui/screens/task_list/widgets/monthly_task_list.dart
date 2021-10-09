import 'package:flutter/material.dart';
import 'package:todo/utils/constants.dart';




class MonthlyTaskList extends StatefulWidget {
  const MonthlyTaskList({Key? key}) : super(key: key);

  @override
  _MonthlyTaskListState createState() => _MonthlyTaskListState();
}

class _MonthlyTaskListState extends State<MonthlyTaskList> {
   late List<bool> _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = List.filled(months.length, false);

  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: months.length,
        itemBuilder: (context, index) {
          String _month = months.elementAt(index).keys.first;
          int weekCount = months.elementAt(index).values.first;


          return ExpansionTile(
              title: Text( _month,
                textAlign: _expanded[index] ? TextAlign.center : TextAlign.start,
              ),
              onExpansionChanged: (expanded){
                setState(() {
                  _expanded[index] = expanded;
                });
              },
              children: _buildChildren( weekCount),
            trailing: _expanded[index] ? const Icon(Icons.remove) : const Icon(Icons.add),
          );
        }
    );
  }

  List<Widget> _buildChildren(int weekCount){
    List<Widget> _data = [];

    for(int i = 0; i< weekCount; i++){
      _data.add(
        _Tile(
          title: "Week $i",
        )
      );

    }

    return _data;
  }
}






class _Tile extends StatefulWidget {
  final String title;

  const _Tile({
    required this.title,
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
      title: Text(
        widget.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            decoration: val ? TextDecoration.lineThrough : TextDecoration.none,
            color: val ? Colors.grey :null
        ),),
    );
  }
}
