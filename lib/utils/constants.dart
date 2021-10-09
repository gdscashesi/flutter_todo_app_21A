

import 'package:flutter/material.dart';

const Color primaryColor = Color(0xff39a1a1);
const Color secondaryColor = Color(0xFF384777);



const List<String> days = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday"
];


///List of a key value pair with key being month and value being number of
///weeks in that month
const List<Map<String,int>> months = [
  {"January": 4},
  {"February": 4},
  {"March": 4},
  {"April": 5},
  {"May": 5},
  {"June": 4},
  {"July": 4},
  {"August": 5},
  {"September": 5},
  {"October": 4},
  {"November": 4},
  {"December": 5},
];


const List<String> tasks = [
  "Do the laundry",
  "Computer programming assignment",
  "Change bedsheets",
  "Buy stuff for the house",
  "Take dogs on a walk",
  "Call the driver",
  "Sleep"
];



Map<int, Color> primaryColorSwatch = {
  50: primaryColor.withOpacity(0.1),
  100: primaryColor.withOpacity(0.2),
  200: primaryColor.withOpacity(0.3),
  300: primaryColor.withOpacity(0.4),
  400: primaryColor.withOpacity(0.5),
  500: primaryColor.withOpacity(0.6),
  600: primaryColor.withOpacity(0.7),
  700: primaryColor.withOpacity(0.8),
  800: primaryColor.withOpacity(0.9),
  900: primaryColor.withOpacity(1),
};


Map<int, Color> secondaryColorSwatch = {
  50: secondaryColor.withOpacity(0.1),
  100: secondaryColor.withOpacity(0.2),
  200: secondaryColor.withOpacity(0.3),
  300: secondaryColor.withOpacity(0.4),
  400: secondaryColor.withOpacity(0.5),
  500: secondaryColor.withOpacity(0.6),
  600: secondaryColor.withOpacity(0.7),
  700: secondaryColor.withOpacity(0.8),
  800: secondaryColor.withOpacity(0.9),
  900: secondaryColor.withOpacity(1),
};