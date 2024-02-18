import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'personalinformation_location_widget.dart'
    show PersonalinformationLocationWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PersonalinformationLocationModel
    extends FlutterFlowModel<PersonalinformationLocationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (updateOnboardingPersistence)] action in personalinformationLocation widget.
  ApiCallResponse? apiResultav3;
  // State field(s) for country widget.
  FocusNode? countryFocusNode;
  TextEditingController? countryController;
  String? Function(BuildContext, String?)? countryControllerValidator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityController;
  String? Function(BuildContext, String?)? cityControllerValidator;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressController;
  String? Function(BuildContext, String?)? addressControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    countryFocusNode?.dispose();
    countryController?.dispose();

    cityFocusNode?.dispose();
    cityController?.dispose();

    addressFocusNode?.dispose();
    addressController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
