import 'package:flutter/material.dart';

class StatsPage extends StatelessWidget {
  final Map themeColors;
  const StatsPage({Key? key, required this.themeColors}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
  
      children: <Widget>[
        Text("STATS Coming Soon...", textAlign: TextAlign.center, style: TextStyle(color: themeColors["Text"]))
      ],
    );
  }
}
