import 'package:flutter/material.dart';

import '../theme_colors.dart';
import '../background.dart';
import '../storage/preferences.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lift",
      theme: ThemeData(fontFamily: "Inter"),
      home: const App(),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late Color kgColor;
  late Color lbsColor;

  @override
  void initState() {
    super.initState();

    if (preferences["weight_unit"] == "kg") {
      kgColor = themeColors["LightBox"];
      lbsColor = Colors.transparent;
    }
    else if (preferences["weight_unit"] == "lbs") {
      kgColor = Colors.transparent;
      lbsColor = themeColors["LightBox"];
    }
  }

  
  @override
  Widget build(BuildContext context){
    return Scaffold(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Weight Unit", textAlign: TextAlign.center, style: TextStyle(color: themeColors["Text"])),
                const SizedBox(width: 30),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      preferences.update("weight_unit", (value) => "kg");
                      kgColor = themeColors["LightBox"];
                      lbsColor = Colors.transparent;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: kgColor,
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.center,
                  ),
                  child: Text("kg", textAlign: TextAlign.center, style: TextStyle(color: themeColors["Text"])),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      preferences.update("weight_unit", (value) => "lbs");
                      kgColor = Colors.transparent;
                      lbsColor = themeColors["LightBox"];
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: lbsColor,
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.center,
                  ),
                  child: Text("lbs", textAlign: TextAlign.center, style: TextStyle(color: themeColors["Text"])),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
