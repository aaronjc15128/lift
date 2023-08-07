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
  
  // Variables & Functions go here

  List<Widget> pages() => <Widget>[

    // pages go here

  ];

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.red,                         // top bar bg color
      systemNavigationBarColor: Colors.red,               // bottom bar bg color
      systemNavigationBarIconBrightness: Brightness.light,  // bottom bar icon color
    ));

    // inits go here

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "title",

      home: Scaffold(
        /*
        appBar: ,
        drawer: ,
        bottomNavigationBar: ,
        body: pages()[],
        */
      ),
    );
  }
}
