import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return const MaterialApp(
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Map themeColors = {
    "Text"        : const Color(0xFFFFFFFF),
    "Background"  : const Color(0xFF0F0F0F),
    "Primary"     : const Color(0xFFB996F3),
    "Secondary"   : const Color(0xFF47346B),
    "Accent"      : const Color(0xFFF64B79),
  };

  
  int navbarIndex = 2;

  void navbarTap(int index) {
    setState(() {
      navbarIndex = index;
    });
  }



  List<Widget> pages() => <Widget>[
    
    // History
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[
        Text("HISTORY Coming Soon...", textAlign: TextAlign.center, style: TextStyle(color: themeColors["Text"]))
      ],
    ),

    // Split
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text("SPLIT Coming Soon...", textAlign: TextAlign.center, style: TextStyle(color: themeColors["Text"]))
      ],
    ),

    // Workouts
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[
        Text("WORKOUTS Coming Soon...", textAlign: TextAlign.center, style: TextStyle(color: themeColors["Text"])),
      ],
    ),

    // Exercises
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[
        Text("EXERCISES Coming Soon...", textAlign: TextAlign.center, style: TextStyle(color: themeColors["Text"]))
      ],
    ),

    // Stats
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text("STATS Coming Soon...", textAlign: TextAlign.center, style: TextStyle(color: themeColors["Text"]))
      ],
    ),

  ];

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,                 // top bar bg color
      systemNavigationBarColor: themeColors["Background"],  // bottom bar bg color
      systemNavigationBarIconBrightness: Brightness.light,  // bottom bar icon color
    ));

    // inits go here

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Workout App",
      theme: ThemeData(
        scaffoldBackgroundColor: themeColors["Background"],
        fontFamily: "Inter",
      ),
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        resizeToAvoidBottomInset: false,
        
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            elevation: 0,
            backgroundColor: themeColors["Background"],
            iconTheme: IconThemeData(color: themeColors["Text"]),
            title: Text("Workouts", style: TextStyle(fontSize: 22, color: themeColors["Text"])),
            centerTitle: true,
          )
        ),

        bottomNavigationBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
            child: BottomNavigationBar(
              elevation: 0,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: themeColors["Accent"],
              unselectedItemColor: themeColors["Text"],
              selectedFontSize: 16,
              unselectedFontSize: 14,
              iconSize: 32,
              
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.circle),
                  label: "History",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.circle),
                  label: "Split",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.circle),
                  label: "Workouts",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.circle),
                  label: "Exercises",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.circle),
                  label: "Stats",
                ),
              ],
          
              currentIndex: navbarIndex,
              onTap: navbarTap,
            ),
          ),
        ),

        body: pages()[navbarIndex],
      )
    );
  }
}
