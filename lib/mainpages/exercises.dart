import 'package:flutter/material.dart';

import '../theme_colors.dart';
import '../storage/exercise_list.dart';

class ExercisesPage extends StatefulWidget {
  final Map themeColors;
  const ExercisesPage({Key? key, required this.themeColors}) : super(key: key);

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  
  List<Widget> exerciseWidgets = <Widget>[];

  Map typeToIcon = {
    "Barbell"    : Icon(Icons.do_not_disturb_rounded, color: themeColors["Icon"]),
    "Bodyweight" : Icon(Icons.do_not_disturb_rounded, color: themeColors["Icon"]),
    "Cable"      : Icon(Icons.cable_rounded, color: themeColors["Icon"]),
    "Dumbbell"   : Icon(Icons.do_not_disturb_rounded, color: themeColors["Icon"]),
    "Machine"    : Icon(Icons.settings_rounded, color: themeColors["Icon"]),
    "Misc"       : Icon(Icons.question_mark_rounded, color: themeColors["Icon"]),
  };

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < exerciseList.length; i++) {
      setState(() {
        Map exercise = exerciseList[i];

        exerciseWidgets.add(
          Exercise(
            /*leadIcon: leadIcon,*/
            name: exercise["name"],
            tailIcon: typeToIcon[exercise["type"]]
          ),
        );
        exerciseWidgets.add(const SizedBox(height: 10));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 850,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: exerciseWidgets,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                textStyle: const TextStyle(fontSize: 16),
                backgroundColor: Colors.transparent,
              ),
              onPressed: () {
                
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[themeColors["Secondary"], themeColors["Accent"]],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(Icons.filter_list_rounded, color: themeColors["Text"]),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                textStyle: const TextStyle(fontSize: 16),
                backgroundColor: Colors.transparent,
              ),
              onPressed: () {
                
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[themeColors["Secondary"], themeColors["Accent"]],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(Icons.add_rounded, color: themeColors["Text"]),
              ),
            ),
          ]
        ),
      ],
    );
  }
}

class Exercise extends StatelessWidget {
  //final Icon leadIcon;
  final String name;
  final Icon tailIcon;
  const Exercise({Key? key, /*required this.leadIcon,*/ required this.name, required this.tailIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 15),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          child: Container(
            height: 52,
            padding: const EdgeInsets.all(6),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: themeColors["Box"], borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 50,
                ),
                SizedBox(
                  width: 230,
                  child: Text(name, style: TextStyle(color: themeColors["Text"])),
                ),
                SizedBox(
                  width: 50,
                  child: tailIcon
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
