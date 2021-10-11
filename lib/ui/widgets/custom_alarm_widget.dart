import "package:flutter/material.dart";
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';


class CustomAlarmWidget extends StatefulWidget {
  DateTime selectedDate;
  bool enabled;

  CustomAlarmWidget({
    Key? key,
    required this.enabled,
    required this.selectedDate
  })
      : super(key: key);

  @override
  _CustomAlarmWidgetState createState() => _CustomAlarmWidgetState();
}

class _CustomAlarmWidgetState extends State<CustomAlarmWidget> {
  final format = DateFormat("yyyy-MMM-dd hh:mm");
  @override
  Widget build(BuildContext context) {

    return
      ListTile(
        enabled: widget.enabled,
        title: const Text("Alarm"),
        trailing: Text(format.format(widget.selectedDate)),
        onTap: (){
          DatePicker.showDateTimePicker(
              context,
            showTitleActions: true,
            currentTime: widget.selectedDate,
            minTime: widget.selectedDate.subtract(const Duration(days:1)),
            maxTime: widget.selectedDate.add(const Duration(days:6000)),
            onChanged: (date){
                setState(() {
                  widget.selectedDate = date;
                });
            }
          );


        },
      );
  }
}
