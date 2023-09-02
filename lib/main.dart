import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'background.dart';

import 'mainpages/history.dart';
import 'mainpages/split.dart';
import 'mainpages/workouts.dart';
import 'mainpages/exercises.dart';
import 'mainpages/stats.dart';

import 'subpages/getpro.dart';
import 'subpages/donate.dart';
import 'subpages/settings.dart';
import 'subpages/about.dart';

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

    "Box"         : const Color(0x33555555),
  };

  List appbarTexts = ["History", "Split", "Workouts", "Exercises", "Stats"];
  String appbarText = "Workouts";
  int navbarIndex = 2;

  void navbarTap(int index) {
    setState(() {
      navbarIndex = index;
      appbarText = appbarTexts[index];
    });
  }



  List<Widget> pages() => <Widget>[
    HistoryPage(themeColors: themeColors),
    SplitPage(themeColors: themeColors),
    WorkoutsPage(themeColors: themeColors),
    ExercisesPage(themeColors: themeColors),
    StatsPage(themeColors: themeColors),
  ];



  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black.withOpacity(0.002), 
      systemNavigationBarColor: Colors.black.withOpacity(0.002),
      systemNavigationBarIconBrightness: Brightness.light,
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
        
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: themeColors["Text"]),
            title: Text(appbarText, style: TextStyle(fontSize: 22, color: themeColors["Text"])),
            centerTitle: true,
          )
        ),

        drawer: Drawer(
          backgroundColor: themeColors["Background"],
          child: Column(
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 12),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: const Image(
                          image: AssetImage("assets/images/icon_512.png"),
                          height: 48,
                          width: 48,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text("Lift", style: TextStyle(fontSize: 22, color: themeColors["Text"])),
                    const SizedBox(height: 3),
                    Text("Aaron Chauhan", style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.show_chart_rounded, color: themeColors["Text"],),
                title: Text("Get PRO", style: TextStyle(color: themeColors["Text"])),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GetProPage(themeColors: themeColors)));
                },
              ),
              ListTile(
                leading: Icon(Icons.attach_money_rounded, color: themeColors["Text"],),
                title: Text("Donate", style: TextStyle(color: themeColors["Text"])),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DonatePage(themeColors: themeColors)));
                },
              ),
              const Spacer(),
              ListTile(
                leading: Icon(Icons.settings_rounded, color: themeColors["Text"],),
                title: Text("Settings", style: TextStyle(color: themeColors["Text"])),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(themeColors: themeColors)));
                },
              ),
              ListTile(
                leading: Icon(Icons.info_outline_rounded, color: themeColors["Text"],),
                title: Text("About", style: TextStyle(color: themeColors["Text"])),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage(themeColors: themeColors)));
                },
              ),
            ],
          ),
        ),

        bottomNavigationBar: SafeArea(
          bottom: true,
          child: Container(
            height: 90,
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            decoration: BoxDecoration(
              color: themeColors["Box"],
              borderRadius: const BorderRadius.all(Radius.circular(25))
            ),
            child: Theme(
              data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
              child: BottomNavigationBar(
                elevation: 0,
                showSelectedLabels: true,
                showUnselectedLabels: false,
                selectedItemColor: themeColors["Accent"],
                unselectedItemColor: themeColors["Text"],
                selectedFontSize: 16,
                iconSize: 32,
                
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.history_rounded),
                    label: "History",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.splitscreen_outlined),
                    label: "Split",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.monitor_weight_rounded),
                    label: "Workouts",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.sports_gymnastics_rounded),
                    label: "Exercises",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.bar_chart_rounded),
                    label: "Stats",
                  ),
                ],
            
                currentIndex: navbarIndex,
                onTap: navbarTap,
              ),
            ),
          ),
        ),

        body: Background(page: pages()[navbarIndex]),
      )
    );
  }
}