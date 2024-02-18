// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> supaRealtime(
  BuildContext context,
  String? tableName,
  String? userId,
) async {
  final supabase = SupaFlow.client;
  String table = tableName ?? '*';
  final channel = supabase.channel('public:' + table);
  channel.on(
    RealtimeListenTypes.postgresChanges,
    ChannelFilter(event: '*', schema: 'public', table: table),
    (payload, [ref]) {
      if (payload['new']['user_id'] == userId) {
        if (payload['new']['status'] == 'applicantReviewed') {
          FFAppState().update(() {
            FFAppState().isReviewed = true;
          });
          print('AppState updated to true.');

          // Use FlutterFlow's navigation system to navigate to the 'step1Banner' page
          if (ModalRoute.of(context)?.settings?.name != 'step1Banner') {
            context.pushNamed('step1Banner');
          }
        }
      }
    },
  ).subscribe();
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
