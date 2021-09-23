import 'package:flutter/material.dart';
import 'package:todo/ui/screens/homescreen/widgets/task_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: Colors.grey,
        body: Container(
          padding:  EdgeInsets.symmetric(vertical: size.height * 0.05, horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text("Hello Gabriel!", style: Theme.of(context).textTheme.headline4,),
            Text("You have 3 tasks scheduled\nfor today", style: Theme.of(context).textTheme.headline6,),
            ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18
                  )
                ),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                )),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(Colors.teal),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(16))
              ),
              child: const Text("Create new folder"),
              onPressed: (){

              },
            ),

            TextButton(
              child: Text("Edit", style: Theme.of(context).textTheme.subtitle1),
              onPressed: (){},
            ),



            SizedBox(
              height: size.height * 0.4,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    mainAxisSpacing: 50,
                    crossAxisSpacing: 50,
                  ),
                  itemBuilder: (context, index){
                    return const TaskTile(
                      icon: Icons.note,
                      label: "All",
                      count: 8
                    );
              }),
            )

          ],
        ))
    );
  }
}
