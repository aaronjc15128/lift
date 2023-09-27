import 'package:flutter/material.dart';

import 'theme_colors.dart';

Map appbarActions = <String, List<Widget>>{
  "History" : [

  ],

  "Split" : [

  ],

  "Workouts" : [

  ],
  
  "Exercises" : [
    IconButton(
      onPressed: (){},
      tooltip: "Search",
      icon: Icon(Icons.search_rounded, color: themeColors["Text"])
    ),
    IconButton(
      onPressed: (){},
      tooltip: "Filter",
      icon: Icon(Icons.filter_list_rounded, color: themeColors["Text"])
    ),
    IconButton(
      onPressed: (){},
      tooltip: "Add Exercise",
      icon: Icon(Icons.add_rounded, color: themeColors["Text"])
    ),
  ],

  "Stats" : [

  ],
  
};