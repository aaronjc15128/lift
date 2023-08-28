import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


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
              ),
            ],
          ),
        ),
      ),
    );
  }
}