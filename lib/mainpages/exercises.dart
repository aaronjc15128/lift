import 'package:flutter/material.dart';

class ExercisesPage extends StatelessWidget {
  final Map themeColors;
  const ExercisesPage({Key? key, required this.themeColors}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
  
      children: <Widget>[
        Text("EXERCISES Coming Soon...", textAlign: TextAlign.center, style: TextStyle(color: themeColors["Text"]))
      ],
    );
  }
}
