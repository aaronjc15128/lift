import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme_colors.dart';
import '../background.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Lift",
      theme: ThemeData(fontFamily: "Inter"),
      
      home: Scaffold(
        extendBodyBehindAppBar: true,

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
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

        body: Background(
          page: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 80),
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
                      Text("Lift", style: TextStyle(fontSize: 22, color: themeColors["Text"])),
                      const SizedBox(height: 3),
                      Text("Aaron Chauhan", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: themeColors["Text"])),
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
                    children: <IconButton>[
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
                    children: <IconButton>[
                      IconButton(
                        onPressed: (){Clipboard.setData(const ClipboardData(text: "https://www.flutter.dev"));},
                        tooltip: "Email",
                        icon: Icon(Icons.email_outlined,
                        color: themeColors["Text"])
                      ),
                      IconButton(
                        onPressed: (){Clipboard.setData(const ClipboardData(text: "https://github.com/aaronjc15128/lift"));},
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
