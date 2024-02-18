import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'personalinformation_name_widget.dart'
    show PersonalinformationNameWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PersonalinformationNameModel
    extends FlutterFlowModel<PersonalinformationNameWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (updateOnboardingPersistence)] action in personalinformationName widget.
  ApiCallResponse? apiResultav3;
  // State field(s) for first widget.
  FocusNode? firstFocusNode;
  TextEditingController? firstController;
  String? Function(BuildContext, String?)? firstControllerValidator;
  // State field(s) for last widget.
  FocusNode? lastFocusNode;
  TextEditingController? lastController;
  String? Function(BuildContext, String?)? lastControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    firstFocusNode?.dispose();
    firstController?.dispose();

    lastFocusNode?.dispose();
    lastController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
