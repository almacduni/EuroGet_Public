import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'n_p_s_questionaire_widget.dart' show NPSQuestionaireWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NPSQuestionaireModel extends FlutterFlowModel<NPSQuestionaireWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for nps widget.
  FocusNode? npsFocusNode;
  TextEditingController? npsController;
  String? Function(BuildContext, String?)? npsControllerValidator;
  // Stores action output result for [Backend Call - API (uploadNPS)] action in Button widget.
  ApiCallResponse? apiResult1du;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    npsFocusNode?.dispose();
    npsController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
