import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'membership_options_widget.dart' show MembershipOptionsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MembershipOptionsModel extends FlutterFlowModel<MembershipOptionsWidget> {
  ///  Local state fields for this page.

  bool monthlySelected = false;

  bool annualSelected = true;

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getData)] action in Button widget.
  ApiCallResponse? getDataSub;
  // Stores action output result for [Backend Call - API (createbankaccount)] action in Button widget.
  ApiCallResponse? createBankAccount;
  // Stores action output result for [Backend Call - API (createmandate)] action in Button widget.
  ApiCallResponse? mandateCreate;
  // Stores action output result for [Backend Call - API (memberCreate)] action in Button widget.
  ApiCallResponse? memberCreate;
  // Stores action output result for [Backend Call - API (subscribe)] action in Button widget.
  ApiCallResponse? apiResult49m;
  // Stores action output result for [Backend Call - API (memberCreate)] action in Button widget.
  ApiCallResponse? memberCreateCopy;
  // Stores action output result for [Backend Call - API (subscribe)] action in Button widget.
  ApiCallResponse? apiResult49mmm;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
