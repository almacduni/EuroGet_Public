import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'limit_default_widget.dart' show LimitDefaultWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LimitDefaultModel extends FlutterFlowModel<LimitDefaultWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (checkLimit)] action in limitDefault widget.
  ApiCallResponse? checkLimit;
  // Stores action output result for [Backend Call - API (checksubscription)] action in limitDefault widget.
  ApiCallResponse? checkSubscription;
  // Stores action output result for [Backend Call - API (getData)] action in Container widget.
  ApiCallResponse? getDataCancelled;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
