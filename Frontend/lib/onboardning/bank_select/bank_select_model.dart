import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'bank_select_widget.dart' show BankSelectWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BankSelectModel extends FlutterFlowModel<BankSelectWidget> {
  ///  Local state fields for this page.

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (updateOnboardingPersistence)] action in bankSelect widget.
  ApiCallResponse? apiResultav3;
  // Stores action output result for [Backend Call - API (createAgreement)] action in Container widget.
  ApiCallResponse? createAgreement;
  // Stores action output result for [Backend Call - API (createlLnk)] action in Container widget.
  ApiCallResponse? createLink;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
