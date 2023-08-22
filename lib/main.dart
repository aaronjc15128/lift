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
                    Text("Workout App", style: TextStyle(fontSize: 22, color: themeColors["Text"])),
                    const SizedBox(height: 3),
                    Text("Created by Aaron Chauhan", style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.show_chart_rounded, color: themeColors["Text"],),
                title: Text("Get PRO", style: TextStyle(color: themeColors["Text"])),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage(themeColors: themeColors)));
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

        body: pages()[navbarIndex],
      )
    );
  }
}

class DonatePage extends StatelessWidget {
  final Map themeColors;
  const DonatePage({Key? key, required this.themeColors}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Workout App",
      
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: themeColors["Background"],
          iconTheme: IconThemeData(color: themeColors["Text"]),
          title: Text("Donate", style: TextStyle(fontSize: 22, color: themeColors["Text"])),
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
            children: <Widget>[
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 12),
                child: Text(
                  "As a young indie developer, who has created an app without any ads, I make no money from this app whatsoever",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16,  color: themeColors["Text"])
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 12),
                child: Text(
                  "I would really appreciate it if you'd donate, as little as £1, to help support the development of this app, and my others apps too",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: themeColors["Text"])
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 12),
                child: Text(
                  "Simply follow the link below and you can donate as little or as much as you want",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: themeColors["Text"])
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Text(
                  "All donations, no matter how big or small, are appreciated greatly :)",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: themeColors["Text"])
                ),
              ),
              const SizedBox(height: 50),
              Container(
                height: 80,
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(95, 0, 95, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {
                    Clipboard.setData(const ClipboardData(text: "https://www.flutter.dev"));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [themeColors["Secondary"], themeColors["Accent"]],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.attach_money_rounded, color: themeColors["Text"]),
                        const SizedBox(width: 8),
                        Text("Donate Link", style: TextStyle(color: themeColors["Text"])),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
            children: <Widget>[
              const SizedBox(height: 30),
              
            ],
          ),
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  final Map themeColors;
  const AboutPage({Key? key, required this.themeColors}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Workout App",
      
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: themeColors["Background"],
          iconTheme: IconThemeData(color: themeColors["Text"]),
          title: Text("About", style: TextStyle(fontSize: 22, color: themeColors["Text"])),
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
            children: <Widget>[
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                      child: const Image(
                        image: AssetImage("assets/images/icon_512.png"),
                        height: 48,
                        width: 48,
                      ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    children: <Widget>[
                      Text("Workout App", style: TextStyle(fontSize: 22, color: themeColors["Text"])),
                      const SizedBox(height: 3),
                      Text("Created by Aaron Chauhan", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: themeColors["Text"])),
                    ]
                  )
                ],
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Text(
                  "Voluptate enim nostrud occaecat exercitation pariatur velit elit occaecat nostrud magna anim occaecat do officia.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15,  color: themeColors["Text"])
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Text(
                  "Ad magna in in dolore nulla laborum laborum quis quis ea ut nulla qui esse excepteur enim reprehenderit amet quis.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: themeColors["Text"])
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Text(
                  "Mollit cupidatat dolore reprehenderit mollit aliquip sint adipisicing dolore excepteur mollit enim.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: themeColors["Text"])
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Text(
                  "Ad aliquip nisi fugiat aliqua id est commodo consequat in et eiusmod velit magna labore Officia aliquip deserunt ad est.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: themeColors["Text"])
                ),
              ),
              const SizedBox(height: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("App:", style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: (){Clipboard.setData(const ClipboardData(text: "https://www.flutter.dev"));},
                        tooltip: "Google Play Store",
                        icon: Icon(Icons.store_mall_directory_rounded,
                        color: themeColors["Text"])
                      ),

                      IconButton(
                        onPressed: (){Clipboard.setData(const ClipboardData(text: "https://www.flutter.dev"));},
                        tooltip: "Apple App Store",
                        icon: Icon(Icons.store_mall_directory_rounded,
                        color: themeColors["Text"])
                      )
                    ],
                  )
                ]
              ),
              const SizedBox(height: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Socials:", style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: (){Clipboard.setData(const ClipboardData(text: "https://www.flutter.dev"));},
                        tooltip: "Email",
                        icon: Icon(Icons.email_outlined,
                        color: themeColors["Text"])
                      ),

                      IconButton(
                        onPressed: (){Clipboard.setData(const ClipboardData(text: "https://github.com/aaronjc15128/workout_app"));},
                        tooltip: "GitHub",
                        icon: Icon(Icons.code_rounded,
                        color: themeColors["Text"])
                      ),

                      IconButton(
                        onPressed: (){Clipboard.setData(const ClipboardData(text: "https://www.flutter.dev"));}, 
                        tooltip: "Donate", 
                        icon: Icon(Icons.attach_money_rounded, 
                        color: themeColors["Text"])
                      )
                    ],
                  )
                ]
              ),
              const SizedBox(height: 70),
              Text("v0.0.0", style: TextStyle(fontSize: 12, color: themeColors["Text"])),
            ],
          ),
        ),
      ),
    );
  }
}
