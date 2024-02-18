import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'account_feedback_write_widget.dart' show AccountFeedbackWriteWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccountFeedbackWriteModel
    extends FlutterFlowModel<AccountFeedbackWriteWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for feedback widget.
  FocusNode? feedbackFocusNode;
  TextEditingController? feedbackController;
  String? Function(BuildContext, String?)? feedbackControllerValidator;
  // Stores action output result for [Backend Call - API (uploadFeedback)] action in Button widget.
  ApiCallResponse? uploadFeedback;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    feedbackFocusNode?.dispose();
    feedbackController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
