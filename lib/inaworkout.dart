import 'package:flutter/material.dart';

import 'storage/workout_list.dart';

import '../theme_colors.dart';
import '../background.dart';

class InAWorkoutPage extends StatelessWidget {
  final String workoutname;
  const InAWorkoutPage({Key? key, required this.workoutname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lift",
      theme: ThemeData(fontFamily: "Inter"),
      home: App(workoutname: workoutname),
    );
  }
}

class App extends StatefulWidget {
  final String workoutname;
  const App({Key? key, required this.workoutname}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<App> createState() => _AppState(workoutname: workoutname);
}

class _AppState extends State<App> {
  final String workoutname;
  _AppState({required this.workoutname});

  late Map workout;

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < workoutList.length; i++) {
      if (workoutList[i]["name"] == workoutname) {
        workout = workoutList[i];
      }
    }
  }


  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: themeColors["Text"]),
        title: Text("inaworkout.dart", style: TextStyle(fontSize: 22, color: themeColors["Text"])),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded)
        ),
      ),

      body: Background(
        page: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          
          children: <Widget>[
            const SizedBox(height: 80),
            
          ],
        ),
      ),
    );
  }
}
