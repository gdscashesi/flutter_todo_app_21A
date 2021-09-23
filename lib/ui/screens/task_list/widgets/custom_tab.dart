import "package:flutter/material.dart";

class CustomTab extends StatefulWidget {
  const CustomTab({Key? key}) : super(key: key);

  @override
  _CustomTabState createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3, // length of tabs
        initialIndex: 0,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const TabBar(
                labelColor: Colors.green,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(text: 'Today'),
                  Tab(text: 'Week'),
                  Tab(text: 'Month'),
                ],
              ),
              Container(
                  height: 400, //height of TabBarView
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5))),
                  child: const TabBarView(
                      children: <Widget>[
                        _DailyTaskList(),
                        _DailyTaskList(),
                        _DailyTaskList(),
                  ]))
            ]));
  }
}






class _DailyTaskList extends StatefulWidget {
  const _DailyTaskList({Key? key}) : super(key: key);

  @override
  __DailyTaskListState createState() => __DailyTaskListState();
}

class __DailyTaskListState extends State<_DailyTaskList> {
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
