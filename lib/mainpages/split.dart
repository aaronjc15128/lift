import 'package:flutter/material.dart';

class SplitPage extends StatelessWidget {
  final Map themeColors;
  const SplitPage({Key? key, required this.themeColors}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
  
      children: <Widget>[
        Text("SPLIT Coming Soon...", textAlign: TextAlign.center, style: TextStyle(color: themeColors["Text"]))
      ],
    );
  }
}
