import '/auth/supabase_auth/auth_util.dart';
import '/components/active_button_dark/active_button_dark_widget.dart';
import '/components/inactive_button_dark/inactive_button_dark_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'account_support_widget.dart' show AccountSupportWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccountSupportModel extends FlutterFlowModel<AccountSupportWidget> {
  ///  Local state fields for this page.

  bool currentSelected = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ActiveButtonDark component.
  late ActiveButtonDarkModel activeButtonDarkModel1;
  // Model for InactiveButtonDark component.
  late InactiveButtonDarkModel inactiveButtonDarkModel1;
  // Model for ActiveButtonDark component.
  late ActiveButtonDarkModel activeButtonDarkModel2;
  // Model for InactiveButtonDark component.
  late InactiveButtonDarkModel inactiveButtonDarkModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    activeButtonDarkModel1 =
        createModel(context, () => ActiveButtonDarkModel());
    inactiveButtonDarkModel1 =
        createModel(context, () => InactiveButtonDarkModel());
    activeButtonDarkModel2 =
        createModel(context, () => ActiveButtonDarkModel());
    inactiveButtonDarkModel2 =
        createModel(context, () => InactiveButtonDarkModel());
  }

  void dispose() {
    unfocusNode.dispose();
    activeButtonDarkModel1.dispose();
    inactiveButtonDarkModel1.dispose();
    activeButtonDarkModel2.dispose();
    inactiveButtonDarkModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
