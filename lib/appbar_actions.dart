import 'package:flutter/material.dart';

import 'theme_colors.dart';

Map appbarActions = <String, List<Widget>>{
  "History" : <IconButton>[

  ],

  "Split" : <IconButton>[

  ],

  "Workouts" : <IconButton>[
    IconButton(
      onPressed: (){},
      tooltip: "Add Template",
      icon: Icon(Icons.post_add_rounded, color: themeColors["Text"])
    ),
    IconButton(
      onPressed: (){},
      tooltip: "Add Empty",
      icon: Icon(Icons.add_rounded, color: themeColors["Text"])
    ),
  ],
  
  "Exercises" : <IconButton>[
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
      tooltip: "Add",
      icon: Icon(Icons.add_rounded, color: themeColors["Text"])
    ),
  ],

  "Stats" : <IconButton>[

  ],
  
};