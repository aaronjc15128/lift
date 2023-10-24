import 'package:flutter/material.dart';

import '../theme_colors.dart';
import '../storage/workout_list.dart';

class WorkoutsPage extends StatefulWidget {
  final Map themeColors;
  const WorkoutsPage({Key? key, required this.themeColors}) : super(key: key);

  @override
  State<WorkoutsPage> createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {

  List<Widget> workoutButtonsWidgets = <Widget>[];

  @override
  void initState() {
    super.initState();
    
    for (var i = 0; i < workoutList.length; i++) {
      setState(() {
        Map exercise = workoutList[i];

        workoutButtonsWidgets.add(
          WorkoutButton(
            name: exercise["name"]
          ),
        );
        workoutButtonsWidgets.add(const SizedBox(height: 10));
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 888,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: workoutButtonsWidgets,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WorkoutButton extends StatelessWidget {
  final String name;
  const WorkoutButton({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      child: Container(
        decoration: BoxDecoration(color: themeColors["DarkBox"], borderRadius: const BorderRadius.all(Radius.circular(15))),
        padding: const EdgeInsets.fromLTRB(30, 20, 20, 20),
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                SizedBox(
                  width: 230,
                  child: Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: themeColors["Text"])),
                ),
                SizedBox(
                  width: 50,
                  child: Text("#1 #5", textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: themeColors["Icon"])),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                  child: Text("3x", style: TextStyle(fontSize: 14, color: themeColors["Text"])),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 230,
                  child: Text("Bench Press", style: TextStyle(fontSize: 14, color: themeColors["Text"])),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                  child: Text("3x", style: TextStyle( fontSize: 14, color: themeColors["Text"])),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 230,
                  child: Text("Seated Overhead Press", style: TextStyle( fontSize: 14, color: themeColors["Text"])),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                  child: Text("2x", style: TextStyle( fontSize: 14, color: themeColors["Text"])),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 230,
                  child: Text("Chest Flys", style: TextStyle( fontSize: 14, color: themeColors["Text"])),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                  child: Text("2x", style: TextStyle( fontSize: 14, color: themeColors["Text"])),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 230,
                  child: Text("Lateral Raise", style: TextStyle( fontSize: 14, color: themeColors["Text"])),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                  child: Text("3x", style: TextStyle( fontSize: 14, color: themeColors["Text"])),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 230,
                  child: Text("Tricep Pushdown", style: TextStyle( fontSize: 14, color: themeColors["Text"])),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                  child: Text("2x", style: TextStyle( fontSize: 14, color: themeColors["Text"])),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 230,
                  child: Text("Seated Overhead Tricep Extension", style: TextStyle( fontSize: 14, color: themeColors["Text"])),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
