import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String? toUpperCase(String? text) {
  if (text is String) {
    return text.toUpperCase();
  } else {
    return null;
  }
}

void main() {
  dynamic var1 = "var1 is a string";
  print(toUpperCase(var1)); // Outputs: VAR1 IS A STRING
}

String? convertDateFormat(String? date) {
  // Check if the date is null
  if (date == null) {
    return null;
  }

  List<String> parts = date.split('.');
  if (parts.length != 3) {
    return "Invalid date format";
  }

  String day = parts[0];
  String month = parts[1];
  String year = parts[2];

  return "$year-$month-$day";
}
