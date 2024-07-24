import 'package:flutter/material.dart';

import '../inaworkout.dart';

import '../theme_colors.dart';
import '../background.dart';
import '../storage/workout_list.dart';
import '../conversions.dart';

class WorkoutsPage extends StatefulWidget {
  final Map themeColors;
  const WorkoutsPage({super.key, required this.themeColors});

  @override
  State<WorkoutsPage> createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {
  Map<String, String> codeToTypeMuscle(String code) {
    String type = codeToType[code.split("")[0] + code.split("")[1]];
    String muscle = (codeToMuscle[code.split("")[2] + code.split("")[3]]).toString();

    return {"type": type, "muscle": muscle};
  }

  List<Widget> workoutButtonsWidgets = <Widget>[];

  @override
  void initState() {
    super.initState();
    
    for (var i = 0; i < workoutList.length; i++) {
      setState(() {
        // ~ set workout & create content/longcontent list
        Map workout = workoutList[i];
        List<Widget> content = <Widget>[];
        List<Widget> longcontent = <Widget>[];


        // ~ add titles to content
        content.add(
          Row(
            children: <Widget>[
              SizedBox(
                width: 200,
                child: Text(workout["name"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: themeColors["Text"])),
              ),
              SizedBox(
                width: 70,
                child: Text("#${workout["split"][0]} #${workout["split"][1]}",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: themeColors["LightIcon"])
                ),
              ),
            ],
          ),
        );
        content.add(const SizedBox(height: 10));


        // ~ add sets to content
        for (var i = 0; i < workout["content"].length; i++) {
          content.add(
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                  // ~ remove warm up sets
                  child: Text("${workout["content"][i]["sets"].where((item) => item != "w").toList().length}x", style: TextStyle(fontSize: 14, color: themeColors["Text"])),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 185,
                  child: Text(workout["content"][i]["name"], style: TextStyle(fontSize: 14, color: themeColors["Text"])),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 25,
                  child: Icon(typeToIcon[codeToTypeMuscle(workout["content"][i]["code"])["type"]], color: themeColors["DarkIcon"]),
                ),
              ],
            ),
          );

          if (i != workout["content"].length - 1) {
            content.add(const SizedBox(height: 5));
          }
        }


        // ~ add sets to longcontent
        longcontent.add(const SizedBox(height: 130));
        for (var i = 0; i < workout["content"].length; i++) {
          longcontent.add(
            Row(
              children: <Widget>[
                const SizedBox(width: 20),
                SizedBox(
                  width: 25,
                  // ~ remove warm up sets
                  child: Text("${workout["content"][i]["sets"].where((item) => item != "w").toList().length}x", style: TextStyle(fontSize: 17, color: themeColors["Text"])),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 345,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${workout["content"][i]["name"]}", style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          Text("${codeToTypeMuscle(workout["content"][i]["code"])["type"]} ", style: TextStyle(fontSize: 15, color: themeColors["Primary"])),
                          Text("${codeToTypeMuscle(workout["content"][i]["code"])["muscle"]}", style: TextStyle(fontSize: 15, color: themeColors["Accent"])),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
          longcontent.add(const SizedBox(height: 20));
        }
        longcontent.add(const SizedBox(height: 150));
        longcontent.add(
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => InAWorkoutPage(workoutIndex: workoutList.indexOf(workout))));
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              width: 160,
              height: 45,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[themeColors["Secondary"], themeColors["Accent"]],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text("Start Workout", style: TextStyle(color: themeColors["Text"])),
            ),
          ),
        );
      


        // ~ add full button to page
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

    setState(() {
      workoutButtonsWidgets.add(
        ElevatedButton(
          onPressed: () {

          },
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
                SizedBox(
                  width: 270,
                  child: Text("Create New Empty Workout", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: themeColors["Text"])),
                ),
              ],
            ),
          ),
        ),
      );
      workoutButtonsWidgets.add(const SizedBox(height: 10));
      workoutButtonsWidgets.add(
        ElevatedButton(
          onPressed: () {

          },
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
                SizedBox(
                  width: 270,
                  child: Text("Create New Empty Template", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: themeColors["Text"])),
                ),
              ],
            ),
          ),
        ),
      );
    });
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
  const WorkoutPreview({super.key, required this.name, required this.longcontent});

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
