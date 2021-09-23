import 'package:flutter/material.dart';
import 'package:todo/ui/screens/task_list/task_list_screen.dart';


class TaskTile extends StatelessWidget {
  final IconData icon;
  final int count;
  final String label;
  const TaskTile({
    Key? key,
    required this.label,
    required this.icon,
    required this.count
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=> const TaskListScreen()
            )
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        width: size.width * 0.45,
        height: size.width * 0.3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(1,1),
              blurRadius: 12
            )
          ]
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon),
                Text(count.toString(),)
              ],
            ),
            Text(label,
              style: const TextStyle(fontWeight: FontWeight.w900),)
          ],
        ),
      ),
    );
  }
}
