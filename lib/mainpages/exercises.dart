import 'package:flutter/material.dart';

class ExercisesPage extends StatelessWidget {
  final Map themeColors;
  const ExercisesPage({Key? key, required this.themeColors}) : super(key: key);

  @override
  void initState() {

  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        
          children: <Widget>[
            const SizedBox(height: 150),
            Text("EXERCISES Coming Soon...", textAlign: TextAlign.center, style: TextStyle(color: themeColors["Text"])),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class Exercise extends StatelessWidget {
final Map themeColors;
  const Exercise({Key? key, required this.themeColors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.transparent
      ),
      child: Container(height: 50,
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        padding: const EdgeInsets.all(6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: themeColors["Box"],
          borderRadius: const BorderRadius.all(Radius.circular(25))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Ea fugiat est", style: TextStyle(color: themeColors["Text"])),
          ],
        ),
      ),
    );
  }
}
