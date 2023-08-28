import 'package:flutter/material.dart';

class WorkoutsPage extends StatelessWidget {
  final Map themeColors;
  const WorkoutsPage({Key? key, required this.themeColors}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
  
      children: <Widget>[
        Text("WORKOUTS Coming Soon...", textAlign: TextAlign.center, style: TextStyle(color: themeColors["Text"]))
      ],
    );
  }
}
