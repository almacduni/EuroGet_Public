import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'account_support_write_widget.dart' show AccountSupportWriteWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccountSupportWriteModel
    extends FlutterFlowModel<AccountSupportWriteWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for support widget.
  FocusNode? supportFocusNode;
  TextEditingController? supportController;
  String? Function(BuildContext, String?)? supportControllerValidator;
  // Stores action output result for [Backend Call - API (uploadSupport)] action in Button widget.
  ApiCallResponse? uploadSupportCopy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    supportFocusNode?.dispose();
    supportController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
