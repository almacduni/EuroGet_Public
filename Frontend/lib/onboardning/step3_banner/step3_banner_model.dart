import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'step3_banner_widget.dart' show Step3BannerWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Step3BannerModel extends FlutterFlowModel<Step3BannerWidget> {
  ///  Local state fields for this page.

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getAllAccounts)] action in step3Banner widget.
  ApiCallResponse? getAllAccounts;
  // Stores action output result for [Backend Call - API (accountTransactions)] action in step3Banner widget.
  ApiCallResponse? accountTransactions;
  // Stores action output result for [Backend Call - API (fetchBankDetails)] action in step3Banner widget.
  ApiCallResponse? fetchBankAccount;
  // Stores action output result for [Backend Call - API (updateOnboardingPersistence)] action in step3Banner widget.
  ApiCallResponse? updatepersstencecopy23;
  // Stores action output result for [Backend Call - API (creditdecision)] action in Button widget.
  ApiCallResponse? creditDecision;
  // Stores action output result for [Backend Call - API (initialcreditlimit)] action in Button widget.
  ApiCallResponse? initialLimit;
  // Stores action output result for [Backend Call - API (updateOnboardingPersistence)] action in Button widget.
  ApiCallResponse? updatepersstencecopy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
