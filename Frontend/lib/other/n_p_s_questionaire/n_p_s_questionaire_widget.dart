import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'n_p_s_questionaire_model.dart';
export 'n_p_s_questionaire_model.dart';

class NPSQuestionaireWidget extends StatefulWidget {
  const NPSQuestionaireWidget({Key? key}) : super(key: key);

  @override
  _NPSQuestionaireWidgetState createState() => _NPSQuestionaireWidgetState();
}

class _NPSQuestionaireWidgetState extends State<NPSQuestionaireWidget> {
  late NPSQuestionaireModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NPSQuestionaireModel());

    _model.npsController ??= TextEditingController();
    _model.npsFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('HomePage');
                              },
                              child: Container(
                                width: 24.0,
                                height: 24.0,
                                decoration: BoxDecoration(),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: SvgPicture.asset(
                                    'assets/images/Close.svg',
                                    width: 300.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'wp0eiiab' /* How would you  rate this proce... */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Rajdhani',
                                            color: FlutterFlowTheme.of(context)
                                                .greyLight,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .lineBlack,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          31.0, 30.0, 32.0, 32.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 40.0,
                                            child:
                                                custom_widgets.CustomStarSlider(
                                              width: double.infinity,
                                              height: 40.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 32.0)),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).lineBlack,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 14.0, 12.0, 16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: TextFormField(
                                        controller: _model.npsController,
                                        focusNode: _model.npsFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.npsController',
                                          Duration(milliseconds: 100),
                                          () => setState(() {}),
                                        ),
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'k2521pe3' /* We really value your opinion */,
                                          ),
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelSmall
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greyGrey,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .greyLight,
                                            ),
                                        maxLines: null,
                                        minLines: 5,
                                        validator: _model.npsControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 20.0)),
                        ),
                      ),
                    ].divide(SizedBox(height: 112.0)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 32.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          _model.apiResult1du =
                              await SupabaseGroup.uploadNPSCall.call(
                            nps: FFAppState().nps,
                            message: _model.npsController.text,
                            userId: currentUserUid,
                          );

                          context.pushNamed('HomePage');

                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'y2xy6hba' /* Submit */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 44.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Rajdhani',
                                color: FlutterFlowTheme.of(context).greyDark,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ].divide(SizedBox(height: 14.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
