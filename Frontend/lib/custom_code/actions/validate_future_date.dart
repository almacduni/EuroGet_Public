// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> validateFutureDate(String dateString) async {
  try {
    // Split the string by '.' and convert each part to an integer
    List<String> parts = dateString.split('.');
    if (parts.length != 3) {
      return false; // Incorrect format
    }

    int day = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int year = int.parse(parts[2]);

    // Create a DateTime object
    DateTime date = DateTime(year, month, day);

    // Check if the date is in the future compared to the current date
    return date.isAfter(DateTime.now());
  } catch (e) {
    // If parsing fails, return false
    return false;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
