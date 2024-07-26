import 'package:flutter/material.dart';

import '../storage/workout_history.dart';
import '../theme_colors.dart';
import '../conversions.dart';

class HistoryPage extends StatefulWidget {
  final Map themeColors;
  const HistoryPage({super.key, required this.themeColors});
  
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  
  List<Widget> widgets = <Widget>[];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < workoutHistory.length; i++) {
      setState(() {
        Map<String, Object> workout = workoutHistory[i];

        String code = workout['datetime'].toString();
        String hour = code.substring(0, 2);
        String minute = code.substring(2, 4);
        String weekdayNum = code.substring(4, 6);
        String day = code.substring(6, 8);
        String monthNum = code.substring(8, 10);
        String year = code.substring(10, 14);
        String weekday = numToWeekday[weekdayNum].toString();
        String month = numToMonth[monthNum].toString();
        String datetimeText = '$weekday $day $month $year $hour:$minute';

        int seconds = workout['time'] as int;
        int hours = seconds ~/ 3600;
        int minutes = (seconds % 3600) ~/ 60;
        String timeText = '${hours}h ${minutes.toString().padLeft(2, '0')}m';

        String setsText = '${workout['sets'].toString()} sets';

        widgets.add(
          ElevatedButton(
            onPressed: () {
              
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            child: Container(
              decoration: BoxDecoration(color: themeColors["DarkBox"], borderRadius: const BorderRadius.all(Radius.circular(15))),
              padding: const EdgeInsets.fromLTRB(30, 20, 20, 20),
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 200,
                        child: Text(workout['name'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: themeColors["Text"])),
                      ),
                      SizedBox(
                        width: 70,
                        child: Text("#${(workout['split'] as List<int>)[0]} #${(workout['split'] as List<int>)[1]}",
                          textAlign: TextAlign.right,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: themeColors["LightIcon"])
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 150,
                        child: Text(datetimeText, style: TextStyle(fontSize: 12, color: themeColors["Text"])),
                      ),
                      SizedBox(
                        width: 120,
                        child: Text(timeText+(' '*5)+setsText, textAlign: TextAlign.right, style: TextStyle(fontSize: 12, color: themeColors["Text"])),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        );
        widgets.add(const SizedBox(height: 10));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 888,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: widgets,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
