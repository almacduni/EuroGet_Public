import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'account_feedback_submit_model.dart';
export 'account_feedback_submit_model.dart';

class AccountFeedbackSubmitWidget extends StatefulWidget {
  const AccountFeedbackSubmitWidget({Key? key}) : super(key: key);

  @override
  _AccountFeedbackSubmitWidgetState createState() =>
      _AccountFeedbackSubmitWidgetState();
}

class _AccountFeedbackSubmitWidgetState
    extends State<AccountFeedbackSubmitWidget> {
  late AccountFeedbackSubmitModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountFeedbackSubmitModel());
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
        backgroundColor: FlutterFlowTheme.of(context).greyDark,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
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
                            context.pop();
                          },
                          child: Container(
                            width: 24.0,
                            height: 24.0,
                            decoration: BoxDecoration(),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: SvgPicture.asset(
                                'assets/images/Arrow_left.svg',
                                width: 300.0,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('accountLanguage');
                          },
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    functions.toUpperCase(
                                        FFLocalizations.of(context)
                                            .languageCode),
                                    'en',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Rajdhani',
                                        color: FlutterFlowTheme.of(context)
                                            .greyLight,
                                      ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: Image.network(
                                    () {
                                      if (FFLocalizations.of(context)
                                              .languageCode ==
                                          'en') {
                                        return 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/flags/Flag_of_United_Kingdom_Flat_Round-1024x1024.png';
                                      } else if (FFLocalizations.of(context)
                                              .languageCode ==
                                          'es') {
                                        return 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/flags/Flag_of_Spain_Flat_Round-1024x1024.png';
                                      } else if (FFLocalizations.of(context)
                                              .languageCode ==
                                          'fr') {
                                        return 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/flags/Flag_of_France_Flat_Round-1024x1024.png';
                                      } else if (FFLocalizations.of(context)
                                              .languageCode ==
                                          'de') {
                                        return 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/flags/Flag_of_Germany_Flat_Round-1024x1024.png';
                                      } else if (FFLocalizations.of(context)
                                              .languageCode ==
                                          'it') {
                                        return 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/flags/Flag_of_Italy_Flat_Round-1024x1024.png';
                                      } else {
                                        return 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/flags/Flag_of_United_Kingdom_Flat_Round-1024x1024.png';
                                      }
                                    }(),
                                    width: 24.0,
                                    height: 24.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Stack(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            children: [
                              Opacity(
                                opacity: 0.3,
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Container(
                                    width: 140.0,
                                    height: 76.0,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 150.0,
                                          color: Color(0xFF00FFAA),
                                          offset: Offset(0.0, 0.0),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.05, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/users_black.png',
                                    width: 204.0,
                                    height: 204.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Wrap(
                              spacing: 0.0,
                              runSpacing: 0.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'mc1hd70y' /* Let’s make EuroGet better toge... */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Rajdhani',
                                        color: FlutterFlowTheme.of(context)
                                            .greyLight,
                                        lineHeight: 1.0,
                                      ),
                                ),
                              ],
                            ),
                            Wrap(
                              spacing: 0.0,
                              runSpacing: 0.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'ax3erkd4' /* Help us improve your experienc... */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .greyGrey,
                                        lineHeight: 1.3,
                                      ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ].divide(SizedBox(height: 44.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('accountFeedbackWrite');
                          },
                          child: Container(
                            width: double.infinity,
                            height: 44.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).greyLight,
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'clyp8pg9' /* Start */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Rajdhani',
                                        color: FlutterFlowTheme.of(context)
                                            .greyDark,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 20.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
