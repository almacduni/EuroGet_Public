import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/active_button_white/active_button_white_widget.dart';
import '/components/inactive_button_white/inactive_button_white_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'borrow_checkout_widget.dart' show BorrowCheckoutWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BorrowCheckoutModel extends FlutterFlowModel<BorrowCheckoutWidget> {
  ///  Local state fields for this page.

  bool instantSelected = true;

  String transferType = 'instant';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ActiveButtonWhite component.
  late ActiveButtonWhiteModel activeButtonWhiteModel1;
  // Model for InactiveButtonWhite component.
  late InactiveButtonWhiteModel inactiveButtonWhiteModel1;
  // Model for ActiveButtonWhite component.
  late ActiveButtonWhiteModel activeButtonWhiteModel2;
  // Model for InactiveButtonWhite component.
  late InactiveButtonWhiteModel inactiveButtonWhiteModel2;
  // Stores action output result for [Backend Call - API (loanrequest)] action in Button widget.
  ApiCallResponse? loanrequest;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    activeButtonWhiteModel1 =
        createModel(context, () => ActiveButtonWhiteModel());
    inactiveButtonWhiteModel1 =
        createModel(context, () => InactiveButtonWhiteModel());
    activeButtonWhiteModel2 =
        createModel(context, () => ActiveButtonWhiteModel());
    inactiveButtonWhiteModel2 =
        createModel(context, () => InactiveButtonWhiteModel());
  }

  void dispose() {
    unfocusNode.dispose();
    activeButtonWhiteModel1.dispose();
    inactiveButtonWhiteModel1.dispose();
    activeButtonWhiteModel2.dispose();
    inactiveButtonWhiteModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
