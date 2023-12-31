import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final Map themeColors;
  const HistoryPage({Key? key, required this.themeColors}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
  
      children: <Widget>[
        Text("HISTORY Coming Soon...", textAlign: TextAlign.center, style: TextStyle(color: themeColors["Text"]))
      ],
    );
  }
}
