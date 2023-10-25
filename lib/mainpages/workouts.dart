import 'package:flutter/material.dart';

import '../theme_colors.dart';
import '../background.dart';
import '../storage/workout_list.dart';

class WorkoutsPage extends StatefulWidget {
  final Map themeColors;
  const WorkoutsPage({Key? key, required this.themeColors}) : super(key: key);

  @override
  State<WorkoutsPage> createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {

  Map codeToType = {
    "Ba" : "Barbell",
    "Bo" : "Bodyweight",
    "Ca" : "Cable",
    "Du" : "Dumbbell",
    "Ma" : "Machine",
    "Mi" : "Misc",
  };
  /*
  Map codeToMuscle = {
    "Ba" : "Barbell",
    "Bo" : "Bodyweight",
    "Ca" : "Cable",
    "Du" : "Dumbbell",
    "Ma" : "Machine",
    "Mi" : "Misc",
  };
  */

  Map<String, String> codeToTypeMuscle(String code) {
    String type = codeToType[code.split("")[0] + code.split("")[1]];
    //String muscle = codeToMuscle[code.split("")[2] + code.split("")[3]];

    return {"type": type/*, "muscle": muscle*/};
  }

  List<Widget> workoutButtonsWidgets = <Widget>[];

  @override
  void initState() {
    super.initState();
    
    for (var i = 0; i < workoutList.length; i++) {
      setState(() {
        // set workout & create content/longcontent list
        Map workout = workoutList[i];
        List<Widget> content = <Widget>[];
        List<Widget> longcontent = <Widget>[];


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
                  //? remove warm up sets
                  child: Text("${workout["content"][i]["sets"].where((item) => item != "w").toList().length}x", style: TextStyle(fontSize: 14, color: themeColors["Text"])),
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


        // add sets to longcontent
        longcontent.add(const SizedBox(height: 130));
        for (var i = 0; i < workout["content"].length; i++) {
          longcontent.add(
            Row(
              children: <Widget>[
                const SizedBox(width: 20),
                SizedBox(
                  width: 20,
                  //? remove warm up sets
                  child: Text("${workout["content"][i]["sets"].where((item) => item != "w").toList().length}x", style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 350,
                  child: Text("${workout["content"][i]["name"]} (${codeToTypeMuscle(workout["content"][i]["code"])["type"]})", style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                ),
              ],
            ),
          );
          longcontent.add(const SizedBox(height: 20));
        }


        // add full button to page
        workoutButtonsWidgets.add(
          ElevatedButton(
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutPreview(name: workout["name"], longcontent: longcontent)));},
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
              ),
            ),
          )
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

class WorkoutPreview extends StatelessWidget {
  final String name;
  final List<Widget> longcontent;
  const WorkoutPreview({Key? key, required this.name, required this.longcontent}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: longcontent,
          ),
        ),
      ),
    );
  }
}
