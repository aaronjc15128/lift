import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../storage/workout_list.dart';
import '../storage/preferences.dart';
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

    //TextEditingController controller = TextEditingController();

    workout = workoutList[widget.workoutIndex];

    List<dynamic> workoutContent = workout['content'] as List<dynamic>;

    setState(() {
      widgets.add(const SizedBox(height: 60));
      for (var i = 0; i < workoutContent.length; i++) {
        Map<String, dynamic> exercise = workoutContent[i] as Map<String, dynamic>;
        widgets.add(
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                Text(exercise['name'].toString(), style: TextStyle(fontSize: 18, color: themeColors['Text'])),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 30,
                      child: Text("set", textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: themeColors['Background'])),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 120,
                      child: Text("weight in ${preferences['weight_unit']}", textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: themeColors['Background'])),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 120,
                      child: Text("reps", textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: themeColors['Background'])),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 30,
                      child: Text("done", textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: themeColors['Background'])),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );

        List<dynamic> sets = workoutContent[i]['sets'] as List<dynamic>;
        for (var j = 0; j < exercise['sets'].length; j++) {
          String set = sets[j] as String;
          widgets.add(
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const SizedBox(width: 10),
                const SizedBox(
                  width: 30,
                  child: Icon(Icons.add),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 120,
                  child: Container(
                    decoration: BoxDecoration(
                      color: themeColors["LightBox"],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      //controller: controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(4)],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Inter', color: themeColors['Text']),
                      cursorColor: themeColors['Text'],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '10',
                        hintStyle: TextStyle(fontFamily: 'Inter', color: themeColors['Background']),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 120,
                  child: Container(
                    decoration: BoxDecoration(
                      color: themeColors["LightBox"],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      //controller: controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(3)],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Inter', color: themeColors['Text']),
                      cursorColor: themeColors['Text'],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '8',
                        hintStyle: TextStyle(fontFamily: 'Inter', color: themeColors['Background']),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                const SizedBox(
                  width: 30,
                  child: Icon(Icons.add),
                ),
                const SizedBox(width: 10),
              ],
            ),
          );
          widgets.add(const SizedBox(height: 10));
        }
        widgets.add(const SizedBox(height: 50));
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevents the background from squashing upwards
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
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),

      body: Background(
        page: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 80),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: widgets,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
