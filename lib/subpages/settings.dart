import 'package:flutter/material.dart';

import '../background.dart';

class SettingsPage extends StatelessWidget {
  final Map themeColors;
  const SettingsPage({Key? key, required this.themeColors}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Workout App",
      theme: ThemeData(fontFamily: "Inter"),
      
      home: Scaffold(
        extendBodyBehindAppBar: true,

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: themeColors["Text"]),
          title: Text("Settings", style: TextStyle(fontSize: 22, color: themeColors["Text"])),
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
            
            children: <Widget>[
              const SizedBox(height: 80),
              Text("SETTINGS Coming Soon...", textAlign: TextAlign.center, style: TextStyle(color: themeColors["Text"]))
            ],
          ),
        ),
      ),
    );
  }
}
