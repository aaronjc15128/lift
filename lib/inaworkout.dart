import 'package:flutter/material.dart';

import '../theme_colors.dart';
import '../background.dart';

class InAWorkoutPage extends StatelessWidget {
  final Map workout;
  const InAWorkoutPage({Key? key, required this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lift",
      theme: ThemeData(fontFamily: "Inter"),
      home: App(workout: workout),
    );
  }
}

class App extends StatefulWidget {
  final Map workout;
  const App({Key? key, required this.workout}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<App> createState() => _AppState(workout: workout);
}

class _AppState extends State<App> {
  final Map workout;
  _AppState({required this.workout});

  List<Widget> widgets = <Widget>[];

  @override
  void initState() {
    super.initState();

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
