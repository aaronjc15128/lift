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
    "Barbell"    : Icon(Icons.circle, color: themeColors["Text"]),
    "Bodyweight" : Icon(Icons.circle, color: themeColors["Text"]),
    "Cable"      : Icon(Icons.circle, color: themeColors["Text"]),
    "Dumbbell"   : Icon(Icons.circle, color: themeColors["Text"]),
    "Machine"    : Icon(Icons.circle, color: themeColors["Text"]),
    "Misc"       : Icon(Icons.circle, color: themeColors["Text"]),
  };

  @override
  void initState() {
    super.initState();

    setState(() {exerciseWidgets.add(const SizedBox(height: 120));});
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
    setState(() {exerciseWidgets.add(const SizedBox(height: 50));});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: exerciseWidgets,
        ),
      ),
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
            height: 55,
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
