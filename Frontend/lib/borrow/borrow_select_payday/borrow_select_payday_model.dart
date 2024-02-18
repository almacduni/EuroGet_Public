import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'borrow_select_payday_widget.dart' show BorrowSelectPaydayWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class BorrowSelectPaydayModel
    extends FlutterFlowModel<BorrowSelectPaydayWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChargeDate widget.
  FocusNode? chargeDateFocusNode;
  TextEditingController? chargeDateController;
  final chargeDateMask = MaskTextInputFormatter(mask: '##.##.####');
  String? Function(BuildContext, String?)? chargeDateControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - API (getData)] action in Container widget.
  ApiCallResponse? getStatus;
  // Stores action output result for [Custom Action - validateFutureDate] action in Container widget.
  bool? validateDate;
  // Stores action output result for [Custom Action - isDateAtLeast7DaysAhead] action in Container widget.
  bool? atleast7days;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    chargeDateFocusNode?.dispose();
    chargeDateController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
