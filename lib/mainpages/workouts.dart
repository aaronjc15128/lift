import 'package:flutter/material.dart';

import '../theme_colors.dart';

class WorkoutsPage extends StatefulWidget {
  final Map themeColors;
  const WorkoutsPage({Key? key, required this.themeColors}) : super(key: key);

  @override
  State<WorkoutsPage> createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {

  List<Widget> workoutButtonsWidgets = <Widget>[];
  
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
