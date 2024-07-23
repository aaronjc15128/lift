import 'package:flutter/material.dart';

import '../storage/workout_list.dart';
import '../theme_colors.dart';
import '../background.dart';


// ? not needed
class InAWorkoutPage extends StatelessWidget {
  final int workoutIndex;
  const InAWorkoutPage({super.key, required this.workoutIndex});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lift",
      theme: ThemeData(fontFamily: "Inter"),
      home: App(workoutIndex: workoutIndex),
    );
  }
}

class App extends StatefulWidget {
  final int workoutIndex;
  const App({super.key, required this.workoutIndex});

  @override
  // ignore: no_logic_in_create_state
  State<App> createState() => _AppState(workoutIndex: workoutIndex);
}

class _AppState extends State<App> {
  final int workoutIndex;
  _AppState({required this.workoutIndex});


  late Map workout;
  List<Widget> widgets = <Widget>[];

  @override
  void initState() {
    super.initState();

    workout = workoutList[workoutIndex];

    setState(() {
      widgets.add(const SizedBox(height: 130));
      for (var i = 0; i < workout["content"].length; i++) {
        widgets.add(
          Text(workout["content"][i], style: TextStyle(fontSize: 22, color: themeColors["Text"]))
        );
      }
    });
    
  }


  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: themeColors["Text"]),
        title: Text(workout["name"], style: TextStyle(fontSize: 22, color: themeColors["Text"])),
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
          
          children: widgets,
        ),
      ),
    );
  }
}
