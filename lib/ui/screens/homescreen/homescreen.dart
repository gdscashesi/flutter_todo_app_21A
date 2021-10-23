import 'package:flutter/material.dart';
import 'package:todo/ui/screens/add_task/add_task_screen.dart';
import 'package:todo/ui/screens/homescreen/widgets/task_tile.dart';
import 'package:todo/ui/widgets/background/background.dart';
import 'package:provider/provider.dart';
import 'package:todo/ui/widgets/custom_button.dart';
import 'package:todo/utils/helpers/database.dart';
import 'package:todo/utils/providers/app_state.dart';
import 'package:todo/utils/providers/task_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  late AnimationController backgroundController;

  @override
  void initState() {
    super.initState();
    backgroundController = AnimationController(
      duration: const Duration( milliseconds: 1000),
      vsync: this
    );
  }
//todo ensure  user is signed in, else redirect to auth screens
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Background(
      animated: true,
        controller: backgroundController,
        child: Container(
            padding:  EdgeInsets.symmetric(vertical: size.height * 0.05, horizontal: 12),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text("Hello ${context.read<AppState>().user!.displayName ?? "user"}!",
                  style: Theme.of(context).textTheme.headline4,),
                Text("You have ${context.read<AppState>().taskList.taskCount} tasks scheduled\nfor today", style: Theme.of(context).textTheme.headline6,),
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
                    // backgroundController.forward();
                  },
                ),

                TextButton(
                  child: Text("Edit", style: Theme.of(context).textTheme.subtitle1),
                  onPressed: (){},
                ),



                SizedBox(
                  height: size.height * 0.4,
                  child: FutureBuilder(
                    future: getTasks(context),
                    builder: (context, snapshot){
                      if (snapshot.connectionState == ConnectionState.done){
                        TaskList list = context.read<AppState>().taskList;
                      return list.taskCount > 0  ?
                      GridView.builder(
                          itemCount: list.groupCount,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 50,
                              crossAxisSpacing: 50,
                            ),
                            itemBuilder: (context, index){
                            String group = list.getTasks().keys.elementAt(index);
                              return  TaskTile(
                                  icon: Icons.note,
                                  label: group,
                                  count: list.getGroupCount( group: group)
                              );
                            })

                      : Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              // elevation: MaterialStateProperty.all(0),
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18
                                  )
                              ),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)
                              )),
                              // backgroundColor: MaterialStateProperty.all(Colors.white),
                              // foregroundColor: MaterialStateProperty.all(Colors.teal),
                              padding: MaterialStateProperty.all(const EdgeInsets.all(16))
                          ),
                          child: const Text("Add a Task"),
                          onPressed: () {
                            backgroundController.forward().whenComplete(() =>
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> const AddTaskScreen()
                                )
                            ).then((value) => backgroundController.reverse())
                            );
                          },

                        ),
                      );
                      }



                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    },
                  ),
                )

              ],
            ))
    );
  }
}
