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
        // set workout & create content list
        Map workout = workoutList[i];
        List<Widget> content = <Widget>[];


        // add titles to content
        content.add(
          Row(
            children: <Widget>[
              SizedBox(
                width: 230,
                child: Text(workout["name"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: themeColors["Text"])),
              ),
              SizedBox(
                width: 50,
                child: Text("#${workout["split"][0]} #${workout["split"][1]}", textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: themeColors["Icon"])),
              ),
            ],
          ),
        );
        content.add(const SizedBox(height: 10));


        // add sets to content
        for (var i = 0; i < workout["content"].length; i++) {
          content.add(
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                  child: Text("${workout["content"][i]["sets"].length}x", style: TextStyle(fontSize: 14, color: themeColors["Text"])),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 230,
                  child: Text(workout["content"][i]["name"], style: TextStyle(fontSize: 14, color: themeColors["Text"])),
                ),
              ],
            ),
          );

          if (i != workout["content"].length - 1) {
            content.add(const SizedBox(height: 5));
          }
        }


        // add full button to page
        workoutButtonsWidgets.add(
          WorkoutButton(
            content: content,
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
  final List<Widget> content;
  const WorkoutButton({Key? key, required this.content}) : super(key: key);

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
          children: content,

          /*
          ? Manual Button
          children: [
            Row(
              children: <Widget>[
                SizedBox(
                  width: 230,
                  child: Text("Push Day", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: themeColors["Text"])),
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
          */
        ),
      ),
    );
  }
}
