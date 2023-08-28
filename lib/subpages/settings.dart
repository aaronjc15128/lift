import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final Map themeColors;
  const SettingsPage({Key? key, required this.themeColors}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Workout App",
      
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: themeColors["Background"],
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

        body: Container(
          color: themeColors["Background"],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            
            children: <Widget>[
              const SizedBox(height: 30),
              Text("SETTINGS Coming Soon...", textAlign: TextAlign.center, style: TextStyle(color: themeColors["Text"]))
            ],
          ),
        ),
      ),
    );
  }
}
