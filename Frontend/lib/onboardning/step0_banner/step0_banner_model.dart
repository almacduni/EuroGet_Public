import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'step0_banner_widget.dart' show Step0BannerWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Step0BannerModel extends FlutterFlowModel<Step0BannerWidget> {
  ///  Local state fields for this page.

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getData)] action in step0Banner widget.
  ApiCallResponse? getDataLogin;
  // Stores action output result for [Backend Call - API (getData)] action in Button widget.
  ApiCallResponse? getUsers;
  // Stores action output result for [Backend Call - API (uploadUsers)] action in Button widget.
  ApiCallResponse? uploadUsers;
  // Stores action output result for [Backend Call - API (uploadAccountInfo)] action in Button widget.
  ApiCallResponse? uploadAccount;
  // Stores action output result for [Backend Call - API (uploadOnboardingPersistence)] action in Button widget.
  ApiCallResponse? uplaodOnboardingPersitance;
  // Stores action output result for [Backend Call - API (updateOnboardingPersistence)] action in Button widget.
  ApiCallResponse? updatePersistence;
  // Stores action output result for [Backend Call - API (getData)] action in Button widget.
  ApiCallResponse? getData;
  // Stores action output result for [Backend Call - API (createapplicant)] action in Button widget.
  ApiCallResponse? createApplicant;
  // Stores action output result for [Backend Call - API (kyccreatekyclink)] action in Button widget.
  ApiCallResponse? createLink;
  // Stores action output result for [Backend Call - API (kyccreatekyclink)] action in Button widget.
  ApiCallResponse? createLinkCopy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
