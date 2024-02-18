// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> isDateAtLeast7DaysAhead(String dateString) async {
  try {
    // Split the string by '.' and convert each part to an integer
    List<String> parts = dateString.split('.');
    if (parts.length != 3) {
      return false; // Incorrect format
    }

    int day = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int year = int.parse(parts[2]);

    // Create a DateTime object for the input date
    DateTime inputDate = DateTime(year, month, day);

    // Calculate the difference between the input date and current date
    Duration difference = inputDate.difference(DateTime.now());

    // Check if the difference is greater than or equal to 7 days
    return difference.inDays >= 7;
  } catch (e) {
    // If parsing or any other operation fails, return false
    return false;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
