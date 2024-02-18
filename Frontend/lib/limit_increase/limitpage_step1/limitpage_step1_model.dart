import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'limitpage_step1_widget.dart' show LimitpageStep1Widget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LimitpageStep1Model extends FlutterFlowModel<LimitpageStep1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (overdraftprotection)] action in Container widget.
  ApiCallResponse? overdraftProttection500;
  // Stores action output result for [Backend Call - API (overdraftprotection)] action in Container widget.
  ApiCallResponse? overdraftProttection250;
  // Stores action output result for [Backend Call - API (overdraftprotection)] action in Container widget.
  ApiCallResponse? overdraftProttection100;
  // Stores action output result for [Backend Call - API (overdraftprotection)] action in Container widget.
  ApiCallResponse? overdraftProttection50;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
