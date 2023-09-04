import 'package:flutter/material.dart';

import '../theme_colors.dart';
import '../background.dart';

class GetProPage extends StatelessWidget {
  const GetProPage({super.key});

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
          title: Text("Get PRO", style: TextStyle(fontSize: 22, color: themeColors["Text"])),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 12),
                child: Text(
                  "• Est ad sint quis consequat aute consectetur",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16,  color: themeColors["Text"])
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 12),
                child: Text(
                  "• Anim veniam officia dolor eiusmod elit",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: themeColors["Text"])
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 12),
                child: Text(
                  "• Duis ut nostrud duis in aute consectetur dolore",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: themeColors["Text"])
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.transparent
                ),
                child: Container(height: 100,
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  padding: const EdgeInsets.all(6),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: themeColors["Box"],
                    borderRadius: const BorderRadius.all(Radius.circular(25))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Monthly", textAlign: TextAlign.left, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: themeColors["Text"])),
                          const SizedBox(height: 3),
                          Text("Standard!", textAlign: TextAlign.left, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: themeColors["Text"])),
                        ],
                      ),
                      Text("£4.49", textAlign: TextAlign.right, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: themeColors["Text"])),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.transparent
                ),
                child: Container(height: 100,
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  padding: const EdgeInsets.all(6),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: themeColors["Box"],
                    borderRadius: const BorderRadius.all(Radius.circular(25))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Yearly", textAlign: TextAlign.left, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: themeColors["Text"])),
                          const SizedBox(height: 3),
                          Text("= £2.42/mo !", textAlign: TextAlign.left, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: themeColors["Text"])),
                        ],
                      ),
                      Text("£28.99", textAlign: TextAlign.right, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: themeColors["Text"])),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.transparent
                ),
                child: Container(height: 100,
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  padding: const EdgeInsets.all(6),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: themeColors["Box"],
                    borderRadius: const BorderRadius.all(Radius.circular(25))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Lifetime", textAlign: TextAlign.left, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: themeColors["Text"])),
                          const SizedBox(height: 3),
                          Text("Best Value!", textAlign: TextAlign.left, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: themeColors["Text"])),
                        ],
                      ),
                      Text("£48.99", textAlign: TextAlign.right, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: themeColors["Text"])),
                    ],
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
