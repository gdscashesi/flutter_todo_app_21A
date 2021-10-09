import "package:flutter/material.dart";
import 'package:todo/ui/screens/task_list/widgets/custom_tab_indicator.dart';
import 'package:todo/ui/screens/task_list/widgets/daily_task_list.dart';
import 'package:todo/ui/screens/task_list/widgets/monthly_task_list.dart';
import 'package:todo/ui/screens/task_list/widgets/weekly_task_list.dart';
import 'package:todo/utils/constants.dart';

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
               TabBar(
                labelColor: secondaryColor,

                indicatorPadding: const EdgeInsets.all(8),
                indicator: CustomTabIndicator(),
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: 'Today'),
                  Tab(text: 'Week'),
                  Tab(text: 'Month'),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top:24),
                height: MediaQuery.of(context).size.height * 0.6,
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5))),
                  child: const TabBarView(
                      children: <Widget>[
                        DailyTaskList(),
                        WeeklyTaskList(),
                        MonthlyTaskList(),
                  ]))
            ]));
  }
}





