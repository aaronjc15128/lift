import 'package:flutter/material.dart';

import '../storage/workout_list.dart';
import '../theme_colors.dart';
import '../background.dart';


/* 
? not needed
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
*/ 

class InAWorkoutPage extends StatefulWidget {
  final int workoutIndex;
  const InAWorkoutPage({super.key, required this.workoutIndex});

  @override
  State<InAWorkoutPage> createState() => _InAWorkoutPageState();
}

class _InAWorkoutPageState extends State<InAWorkoutPage> {

  late Map<String, Object> workout;
  List<Widget> widgets = <Widget>[];

  @override
  void initState() {
    super.initState();

    workout = workoutList[widget.workoutIndex];

    // Safely cast 'content' to a List
    List<dynamic> workoutContent = workout['content'] as List<dynamic>;

    setState(() {
      widgets.add(const SizedBox(height: 130));
      for (var i = 0; i < workoutContent.length; i++) {
        Map<String, dynamic> exercise = workoutContent[i] as Map<String, dynamic>;
        widgets.add(
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                Text(exercise['name'].toString(), style: TextStyle(fontSize: 20, color: themeColors['Text'])),
              ],
            ),
          ),
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
        title: Text(workout["name"].toString(), style: TextStyle(fontSize: 22, color: themeColors["Text"])),
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
