// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_web_browser/flutter_web_browser.dart';

Future<void> openInAppBrowser(String url) async {
  await FlutterWebBrowser.openWebPage(
    url: url,
    customTabsOptions: CustomTabsOptions(
      colorScheme: CustomTabsColorScheme.dark,
      toolbarColor: Colors.deepPurple,
      secondaryToolbarColor: Colors.green,
      navigationBarColor: Colors.amber,
      addDefaultShareMenuItem: true,
      instantAppsEnabled: true,
      showTitle: true,
      urlBarHidingEnabled: true,
    ),
  );
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
