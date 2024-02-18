import '/components/active_button_white/active_button_white_widget.dart';
import '/components/inactive_button_white/inactive_button_white_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'account_language_widget.dart' show AccountLanguageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccountLanguageModel extends FlutterFlowModel<AccountLanguageWidget> {
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
  // Model for ActiveButtonWhite component.
  late ActiveButtonWhiteModel activeButtonWhiteModel3;
  // Model for InactiveButtonWhite component.
  late InactiveButtonWhiteModel inactiveButtonWhiteModel3;
  // Model for ActiveButtonWhite component.
  late ActiveButtonWhiteModel activeButtonWhiteModel4;
  // Model for InactiveButtonWhite component.
  late InactiveButtonWhiteModel inactiveButtonWhiteModel4;
  // Model for ActiveButtonWhite component.
  late ActiveButtonWhiteModel activeButtonWhiteModel5;
  // Model for InactiveButtonWhite component.
  late InactiveButtonWhiteModel inactiveButtonWhiteModel5;

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
    activeButtonWhiteModel3 =
        createModel(context, () => ActiveButtonWhiteModel());
    inactiveButtonWhiteModel3 =
        createModel(context, () => InactiveButtonWhiteModel());
    activeButtonWhiteModel4 =
        createModel(context, () => ActiveButtonWhiteModel());
    inactiveButtonWhiteModel4 =
        createModel(context, () => InactiveButtonWhiteModel());
    activeButtonWhiteModel5 =
        createModel(context, () => ActiveButtonWhiteModel());
    inactiveButtonWhiteModel5 =
        createModel(context, () => InactiveButtonWhiteModel());
  }

  void dispose() {
    unfocusNode.dispose();
    activeButtonWhiteModel1.dispose();
    inactiveButtonWhiteModel1.dispose();
    activeButtonWhiteModel2.dispose();
    inactiveButtonWhiteModel2.dispose();
    activeButtonWhiteModel3.dispose();
    inactiveButtonWhiteModel3.dispose();
    activeButtonWhiteModel4.dispose();
    inactiveButtonWhiteModel4.dispose();
    activeButtonWhiteModel5.dispose();
    inactiveButtonWhiteModel5.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
