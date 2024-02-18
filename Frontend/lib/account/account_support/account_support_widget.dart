import '/auth/supabase_auth/auth_util.dart';
import '/components/active_button_dark/active_button_dark_widget.dart';
import '/components/inactive_button_dark/inactive_button_dark_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'account_support_model.dart';
export 'account_support_model.dart';

class AccountSupportWidget extends StatefulWidget {
  const AccountSupportWidget({Key? key}) : super(key: key);

  @override
  _AccountSupportWidgetState createState() => _AccountSupportWidgetState();
}

class _AccountSupportWidgetState extends State<AccountSupportWidget> {
  late AccountSupportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountSupportModel());
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
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 28.0, 0.0, 0.0),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .greyLight,
                                            ),
                                      ),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        child: Image.network(
                                          () {
                                            if (FFLocalizations.of(context)
                                                    .languageCode ==
                                                'en') {
                                              return 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/flags/Flag_of_United_Kingdom_Flat_Round-1024x1024.png';
                                            } else if (FFLocalizations.of(
                                                        context)
                                                    .languageCode ==
                                                'es') {
                                              return 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/flags/Flag_of_Spain_Flat_Round-1024x1024.png';
                                            } else if (FFLocalizations.of(
                                                        context)
                                                    .languageCode ==
                                                'fr') {
                                              return 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/flags/Flag_of_France_Flat_Round-1024x1024.png';
                                            } else if (FFLocalizations.of(
                                                        context)
                                                    .languageCode ==
                                                'de') {
                                              return 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/flags/Flag_of_Germany_Flat_Round-1024x1024.png';
                                            } else if (FFLocalizations.of(
                                                        context)
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
                          child: Container(
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
                                      Wrap(
                                        spacing: 0.0,
                                        runSpacing: 0.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'ljpuefsw' /* Talk to support */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Rajdhani',
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'xmv1tyok' /* Help us improve your experienc... */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .greyGrey,
                                                  lineHeight: 1.3,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ].divide(SizedBox(height: 12.0)),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.currentSelected == false) {
                                            setState(() {
                                              _model.currentSelected = true;
                                            });
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineBlack,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(24.0, 24.0,
                                                          20.0, 26.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '5e60zuf6' /* Current email */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Rajdhani',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .greyLight,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            currentUserEmail,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .daBlack200,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 8.0)),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 20.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (_model
                                                              .currentSelected ==
                                                          true)
                                                        wrapWithModel(
                                                          model: _model
                                                              .activeButtonDarkModel1,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              ActiveButtonDarkWidget(),
                                                        ),
                                                      if (_model
                                                              .currentSelected ==
                                                          false)
                                                        wrapWithModel(
                                                          model: _model
                                                              .inactiveButtonDarkModel1,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              InactiveButtonDarkWidget(),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.currentSelected == true) {
                                            setState(() {
                                              _model.currentSelected = false;
                                            });
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineBlack,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(24.0, 24.0,
                                                          20.0, 26.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'favkfuuq' /* Use another one */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Rajdhani',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .greyLight,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'h1u5rg5a' /* Add other email */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .daBlack200,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 8.0)),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 20.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (_model
                                                              .currentSelected ==
                                                          false)
                                                        wrapWithModel(
                                                          model: _model
                                                              .activeButtonDarkModel2,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              ActiveButtonDarkWidget(),
                                                        ),
                                                      if (_model
                                                              .currentSelected ==
                                                          true)
                                                        wrapWithModel(
                                                          model: _model
                                                              .inactiveButtonDarkModel2,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              InactiveButtonDarkWidget(),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 12.0)),
                                  ),
                                ),
                              ].divide(SizedBox(height: 40.0)),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 112.0)),
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
                            if (_model.currentSelected == true) {
                              setState(() {
                                FFAppState().supportEmail = currentUserEmail;
                              });

                              context.pushNamed('accountSupportWrite');
                            } else {
                              context.pushNamed('accountSupportAddNewEmail');
                            }
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
                                    'wzbe9z30' /* Start */,
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
