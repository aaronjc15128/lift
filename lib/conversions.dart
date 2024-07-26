import 'package:flutter/material.dart';

Map<String, IconData> typeToIcon = {
  "Barbell"    : Icons.bar_chart_rounded,
  "Bodyweight" : Icons.person_rounded,
  "Cable"      : Icons.cable_rounded,
  "Dumbbell"   : Icons.monitor_weight_rounded,
  "Machine"    : Icons.settings_rounded,
  "Misc"       : Icons.question_mark_rounded,
};

Map<String, String> codeToType = {
  "Ba" : "Barbell",
  "Bo" : "Bodyweight",
  "Ca" : "Cable",
  "Du" : "Dumbbell",
  "Ma" : "Machine",
  "Mi" : "Misc",
};
  
Map<String, String> codeToMuscle = {
  "Ab" : "Abs",
  "Ba" : "Back",
  "Bi" : "Biceps",
  "Ca" : "Calves",
  "Ch" : "Chest",
  "Fo" : "Forearms",
  "Gl" : "Glutes",
  "Ha" : "Hamstrings",
  "Ne" : "Neck",
  "Qu" : "Quadriceps",
  "Sh" : "Shoulders",
  "Tr" : "Triceps",
};

Map<String, String> numToWeekday = {
  '01': 'Mon',
  '02': 'Tue',
  '03': 'Wed',
  '04': 'Thu',
  '05': 'Fri',
  '06': 'Sat',
  '07': 'Sun',
};

Map<String, String> numToMonth = {
  '01': 'Jan',
  '02': 'Feb',
  '03': 'Mar',
  '04': 'Apr',
  '05': 'May',
  '06': 'Jun',
  '07': 'Jul',
  '08': 'Aug',
  '09': 'Sep',
  '10': 'Oct',
  '11': 'Nov',
  '12': 'Dec',
};