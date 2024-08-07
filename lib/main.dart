import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'theme_colors.dart';
import 'background.dart';
import 'appbar_actions.dart';

import 'mainpages/history.dart';
import 'mainpages/split.dart';
import 'mainpages/workouts.dart';
import 'mainpages/exercises.dart';
import 'mainpages/stats.dart';

import 'subpages/getpro.dart';
import 'subpages/donate.dart';
import 'subpages/comingsoon.dart';
import 'subpages/settings.dart';
import 'subpages/about.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
  List<String> appbarTexts = ["History", "Split", "Workouts", "Exercises", "Stats"];
  String appbarText = "Workouts";
  List<Widget> appbarAction = appbarActions["Workouts"];
  int navbarIndex = 2;

  void navbarTap(int index) {
    setState(() {
      navbarIndex = index;
      appbarText = appbarTexts[index];
      appbarAction = appbarActions[appbarText];
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
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lift",
      theme: ThemeData(fontFamily: "Inter", colorScheme: ColorScheme.fromSwatch().copyWith(secondary: themeColors["Accent"])),

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
            actions: appbarAction,
          )
        ),

        drawer: Drawer(
          backgroundColor: themeColors["Background"],
          child: Column(
            children: <Widget>[
              const SizedBox(height: 60),
              Column(
                children: <Widget>[
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const Image(
                      image: AssetImage("assets/images/icon_512.png"),
                      height: 48,
                      width: 48,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text("Lift", style: TextStyle(fontSize: 22, color: themeColors["Text"])),
                  const SizedBox(height: 3),
                  Text("aaronjc15128", style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                ],
              ),
              const SizedBox(height: 30),
              ListTile(
                leading: Icon(Icons.show_chart_rounded, color: themeColors["Text"],),
                title: Text("Get PRO", style: TextStyle(color: themeColors["Text"])),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const GetProPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.attach_money_rounded, color: themeColors["Text"],),
                title: Text("Donate", style: TextStyle(color: themeColors["Text"])),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const DonatePage()));
                },
              ),
              const Spacer(),
              ListTile(
                leading: Icon(Icons.access_time_rounded, color: themeColors["Text"],),
                title: Text("Coming Soon", style: TextStyle(color: themeColors["Text"])),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ComingSoonPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.settings_outlined, color: themeColors["Text"],),
                title: Text("Settings", style: TextStyle(color: themeColors["Text"])),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.info_outline_rounded, color: themeColors["Text"],),
                title: Text("About", style: TextStyle(color: themeColors["Text"])),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
                },
              ),
              const SizedBox(height: 45),
            ],
          ),
        ),

        bottomNavigationBar: SafeArea(
          bottom: true,
          child: Container(
            height: 90,
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            decoration: BoxDecoration(
              color: themeColors["DarkBox"],
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
                    icon: Icon(Icons.bolt_rounded),
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