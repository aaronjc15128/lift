import 'package:flutter/material.dart';

import '../background.dart';
import '../theme_colors.dart';
import '../functions.dart';
import '../storage/exercise_list.dart';
import '../storage/preferences.dart';
import '../conversions.dart';

class ExercisesPage extends StatefulWidget {
  final Map themeColors;
  const ExercisesPage({Key? key, required this.themeColors}) : super(key: key);

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  
  List<Widget> exerciseWidgets = <Widget>[];

  @override
  void initState() {
    super.initState();

    exerciseList.sort((a, b) => a['name']!.compareTo(b['name']!));
    for (var i = 0; i < exerciseList.length; i++) {
      setState(() {
        Map exercise = exerciseList[i];

        exerciseWidgets.add(
          Exercise(
            /*leadIcon: leadIcon,*/
            name: exercise["name"],
            tailIcon: Icon(typeToIcon[exercise["type"]], color: themeColors["Icon"]),

            info: {
              "type": exercise["type"],
              "muscle": exercise["muscle"],
              "totalReps": exercise["total_reps"],
              "totalVolume": exercise["total_volume"],
              "maxWeight": exercise["max_weight"],
              "maxOneRepMax": exercise["max_onerepmax"],
              "description": exercise["description"],
            },
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
        SizedBox(height: 888,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: exerciseWidgets,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Exercise extends StatelessWidget {
  //final Icon leadIcon;
  final String name;
  final Icon tailIcon;
  final Map info;
  const Exercise({Key? key, /*required this.leadIcon,*/ required this.name, required this.tailIcon, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 15),
        ElevatedButton(
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ExerciseView(name: name, info: info)));},
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          child: Container(
            height: 50,
            padding: const EdgeInsets.all(6),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: themeColors["DarkBox"], borderRadius: const BorderRadius.all(Radius.circular(15))),
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

class ExerciseView extends StatelessWidget {
  final String name;
  final Map info;
  const ExerciseView({Key? key, required this.name, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lift",
      theme: ThemeData(fontFamily: "Inter"),
      
      home: Scaffold(
        extendBodyBehindAppBar: true,

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: themeColors["Text"]),
          title: Text(name, style: TextStyle(fontSize: 22, color: themeColors["Text"])),
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
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 60),
                child: Text(info["description"].toString(), textAlign: TextAlign.center, style: TextStyle(color: themeColors["Text"])),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("Name: ", style: TextStyle(color: themeColors["Text"])),
                      const SizedBox(height: 5),
                      Text("Type: ", style: TextStyle(color: themeColors["Text"])),
                      const SizedBox(height: 5),
                      Text("Muscle Group: ", style: TextStyle(color: themeColors["Text"])),
                      
                      const SizedBox(height: 20),

                      Text("Max Weight: ", style: TextStyle(color: themeColors["Text"])),
                      const SizedBox(height: 5),
                      Text("Max 1RM:", style: TextStyle(color: themeColors["Text"])),
                      const SizedBox(height: 5),
                      Text("Total Reps: ", style: TextStyle(color: themeColors["Text"])),
                      const SizedBox(height: 5),
                      Text("Total Volume:", style: TextStyle(color: themeColors["Text"])),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Column(
                    children: <Widget>[
                      Text(name, style: TextStyle(color: themeColors["Text"])),
                      const SizedBox(height: 5),
                      Text(info["type"], style: TextStyle(color: themeColors["Text"])),
                      const SizedBox(height: 5),
                      Text(info["muscle"], style: TextStyle(color: themeColors["Text"])),
                      const SizedBox(height: 5),
                      
                      const SizedBox(height: 20),

                      Text("${convertUnit(info["maxWeight"]).toString()} ${preferences["weight_unit"]}", style: TextStyle(color: themeColors["Text"])),
                      const SizedBox(height: 5),
                      Text("${convertUnit(info["maxOneRepMax"]).toString()} ${preferences["weight_unit"]}", style: TextStyle(color: themeColors["Text"])),
                      const SizedBox(height: 5),
                      Text(info["totalReps"].toString(), style: TextStyle(color: themeColors["Text"])),
                      const SizedBox(height: 5),
                      Text("${convertUnit(info["totalVolume"]).toString()} ${preferences["weight_unit"]}", style: TextStyle(color: themeColors["Text"])),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
