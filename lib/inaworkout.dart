import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main.dart';
import 'storage/workout_history.dart';
import 'storage/workout_list.dart';
import 'storage/preferences.dart';
import 'theme_colors.dart';
import 'background.dart';
import 'conversions.dart';

class InAWorkoutPage extends StatefulWidget {
  final int workoutIndex;
  const InAWorkoutPage({super.key, required this.workoutIndex});

  @override
  State<InAWorkoutPage> createState() => _InAWorkoutPageState();
}

class _InAWorkoutPageState extends State<InAWorkoutPage> {
  late int epochStartTime;
  late int epochEndTime;

  late Map<String, Object> workout;
  late List<List<bool>> done;

  void checkmarkToggle(int exerciseIndex, int setIndex) {
    setState(() {
      done[exerciseIndex][setIndex] = !done[exerciseIndex][setIndex];
    });
  }

  void finishWorkout() {
    
    // ~ data to add to workout_history.dart
    epochEndTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    int epochElapsedTime = epochEndTime - epochStartTime;
    
    DateTime now = DateTime.now();
    String weekday = "0${now.weekday}".toString();
    String day = now.day.toString();
    String month = now.month.toString().length == 1 ? '0${now.month}' : now.month.toString();
    String year = now.year.toString();
    String hours = now.hour.toString().padLeft(2, '0');
    String minutes = now.minute.toString().padLeft(2, '0');
    String datetimeCode = hours + minutes + weekday + day + month + year;

    workoutHistory.insert(0,
      <String, Object>{
        'name' : workout['name'].toString(),
        'split' : workout['split'] as List<int>,
        'datetime' : datetimeCode,
        'time' : epochElapsedTime,
        'sets' : done.expand((list) => list).where((element) => element).length,
      },
    );

    //~ data to send to WorkoutComplete()

    Map<String, Object> sendWorkout = workoutHistory[0];
    String sendCode = sendWorkout['datetime'].toString();
    String sendHour = sendCode.substring(0, 2);
    String sendMinute = sendCode.substring(2, 4);
    String sendWeekdaynum = sendCode.substring(4, 6);
    String sendDay = sendCode.substring(6, 8);
    String sendMonthnum = sendCode.substring(8, 10);
    String sendYear = sendCode.substring(10, 14);
    String sendWeekday = numToWeekday[sendWeekdaynum].toString();
    String sendMonth = numToMonth[sendMonthnum].toString();
    String sendDatetimetext = '$sendWeekday $sendDay $sendMonth $sendYear $sendHour:$sendMinute';

    int sendSeconds = sendWorkout['time'] as int;
    int sendHours = sendSeconds ~/ 3600;
    int sendMinutes = (sendSeconds % 3600) ~/ 60;
    String sendTimetext = '${sendHours}h ${sendMinutes.toString().padLeft(2, '0')}m';

    String sendSetstext = '${sendWorkout['sets'].toString()} sets';

    String sendWorkoutnumber = workoutHistory.length.toString();

    Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutComplete(
      workout: sendWorkout,
      datetimeText: sendDatetimetext,
      timeText: sendTimetext,
      setsText: sendSetstext,
      workoutNumber: sendWorkoutnumber,
    )));
  }

  @override
  void initState() {
    super.initState();

    epochStartTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    //TextEditingController controller = TextEditingController();

    workout = workoutList[widget.workoutIndex];

    List<dynamic> workoutContent = workout['content'] as List<dynamic>;

    done = List.generate(workoutContent.length, (index) => []);
    for (var n = 0; n < workoutContent.length; n++) {
      for (var v = 0; v < workoutContent[n]['sets'].length; v++) {
        done[n].add(false);
      }
    }
  }

  List<Widget> buildWidgets() {
    List<Widget> widgets = [];
    List<dynamic> workoutContent = workout['content'] as List<dynamic>;

    widgets.add(const SizedBox(height: 60));
    for (var i = 0; i < workoutContent.length; i++) {
      Map<String, dynamic> exercise = workoutContent[i] as Map<String, dynamic>;
      widgets.add(
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(exercise['name'].toString(), style: TextStyle(fontSize: 16, color: themeColors['Text'])),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <SizedBox>[
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 30,
                    child: Text("set", textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: themeColors['HintText60'])),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 120,
                    child: Text("weight in ${preferences['weight_unit']}", textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: themeColors['HintText60'])),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 120,
                    child: Text("reps", textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: themeColors['HintText60'])),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 30,
                    child: Text("done", textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: themeColors['HintText60'])),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      );

      List<dynamic> sets = workoutContent[i]['sets'] as List<dynamic>;
      late Color setColor;
      int count = 0;

      for (var j = 0; j < exercise['sets'].length; j++) {
        String set = sets[j] as String;
        if (set == 'n') {
          count++;
          set = count.toString();
          setColor = themeColors['Primary'];
        }
        else if (set == 'w') {
          setColor = themeColors['Primary'];
        }
        else if (set == 'f') {
          setColor = themeColors['Accent'];
        }

        //Icon checkmarkIcon = checkmark(i, j);

        widgets.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              SizedBox(
                width: 30,
                child: Text(set, textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: setColor)),
              ),
              const SizedBox(width: 20),
              SizedBox(
                width: 120,
                child: Container(
                  decoration: BoxDecoration(
                    color: done[i][j] ? Colors.transparent : themeColors["LightBox"],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextField(
                    //controller: controller,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(4)],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Inter', color: themeColors['Text']),
                    cursorColor: themeColors['Text'],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '10',
                      hintStyle: TextStyle(fontFamily: 'Inter', color: themeColors['HintText30']),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 120,
                child: Container(
                  decoration: BoxDecoration(
                    color: done[i][j] ? Colors.transparent : themeColors["LightBox"],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextField(
                    //controller: controller,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(3)],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Inter', color: themeColors['Text']),
                    cursorColor: themeColors['Text'],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '8',
                      hintStyle: TextStyle(fontFamily: 'Inter', color: themeColors['HintText30']),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              SizedBox(
                width: 30,
                child: IconButton(
                  icon: Icon(
                    done[i][j] ? Icons.check_rounded : Icons.check_rounded,
                    color: done[i][j] ? setColor : themeColors['HintText30'],
                  ),
                  iconSize: 20,
                  onPressed: () {
                    checkmarkToggle(i, j);
                  },
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        );
        widgets.add(const SizedBox(height: 10));
      }
      widgets.add(const SizedBox(height: 50));
    }
    widgets.add(const SizedBox(height: 30));
    widgets.add(
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                backgroundColor: Colors.transparent,
                child: AlertDialog(
                  backgroundColor: themeColors["Background"],
                  title: Text("Finish Workout?", style: TextStyle(fontSize: 24, color: themeColors["Text"])),
                  content: Text("Are you sure you want to finish this workout?", style: TextStyle(fontSize: 12, color: themeColors["Text"])),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {Navigator.of(context).pop();},
                      child: Text("Cancel", style: TextStyle(color: themeColors["Primary"])),
                    ),
                    TextButton(
                      onPressed: () {
                        finishWorkout();
                        Navigator.of(context).pop();
                      },
                      child: Text("Finish", style: TextStyle(color: themeColors["Accent"])),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12),
          width: 160,
          height: 45,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[themeColors["Secondary"], themeColors["Accent"]],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text("Finish Workout", style: TextStyle(color: themeColors["Text"])),
        ),
      ),
    );
    widgets.add(const SizedBox(height: 400));
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: themeColors["Text"]),
        title: Text(workout["name"].toString(), style: TextStyle(fontSize: 22, color: themeColors["Text"])),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: Background(
        page: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 80),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: buildWidgets(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutComplete extends StatelessWidget {
  final Map<String, Object> workout;
  final String datetimeText;
  final String timeText;
  final String setsText;
  final String workoutNumber;
  const WorkoutComplete({super.key, required this.workout, required this.datetimeText, required this.timeText, required this.setsText, required this.workoutNumber});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lift",
      theme: ThemeData(fontFamily: "Inter"),
      
      home: Scaffold(
        extendBodyBehindAppBar: true,

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: themeColors["Text"]),
          title: Text('Workout Complete', style: TextStyle(fontSize: 22, color: themeColors["Text"])),
          centerTitle: true,
        ),

        body: Background(
          page: Column(
            children: [
              const SizedBox(height: 130),
              Text('Added to History', style: TextStyle(fontSize: 16, color: themeColors["Text"])),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(color: themeColors["DarkBox"], borderRadius: const BorderRadius.all(Radius.circular(15))),
                padding: const EdgeInsets.fromLTRB(30, 20, 20, 20),
                margin: const EdgeInsets.fromLTRB(45, 0, 45, 0),
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
              const SizedBox(height: 30),
              Text("that's workout number", style: TextStyle(fontSize: 16, color: themeColors["Text"])),
              const SizedBox(height: 10),
              Text(workoutNumber, style: TextStyle(fontSize: 22, color: themeColors["Text"])),
              const SizedBox(height: 300),
              IconButton(
                icon: Icon(Icons.check_rounded, color: themeColors['Text'],),
                iconSize: 25,
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const MainApp()));},
              ),
            ],
          ),
        ),
      ),
    );
  }
}