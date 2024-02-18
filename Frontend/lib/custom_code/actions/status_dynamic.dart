// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';

bool isStatusBarSet = false;

Future<void> statusDynamic(BuildContext context) async {
  if (isStatusBarSet) return;

  // Get the color of the nearest Material widget up the tree
  Color backgroundColor = Theme.of(context).scaffoldBackgroundColor;

  SystemUiOverlayStyle style = SystemUiOverlayStyle.light; // Default value

  if (backgroundColor == FlutterFlowTheme.of(context).greyLight) {
    style = SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: Brightness.dark,
    );
  } else if (backgroundColor == FlutterFlowTheme.of(context).greyDark) {
    style = SystemUiOverlayStyle.light.copyWith(
      statusBarIconBrightness: Brightness.light,
    );
  }

  SystemChrome.setSystemUIOverlayStyle(style);
  isStatusBarSet = true;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
