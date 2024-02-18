import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'account_contact_details_model.dart';
export 'account_contact_details_model.dart';

class AccountContactDetailsWidget extends StatefulWidget {
  const AccountContactDetailsWidget({Key? key}) : super(key: key);

  @override
  _AccountContactDetailsWidgetState createState() =>
      _AccountContactDetailsWidgetState();
}

class _AccountContactDetailsWidgetState
    extends State<AccountContactDetailsWidget> {
  late AccountContactDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountContactDetailsModel());
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
        backgroundColor: FlutterFlowTheme.of(context).greyLight,
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
                  child: SingleChildScrollView(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: SvgPicture.network(
                                            'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Arrow%20left%20(1).svg',
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
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Rajdhani',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .greyDark,
                                                      ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              child: Image.network(
                                                () {
                                                  if (FFLocalizations.of(
                                                              context)
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 52.0, 0.0, 0.0),
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
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'rjm57l8h' /* Contact details */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Rajdhani',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .greyDark,
                                                        lineHeight: 1.0,
                                                      ),
                                            ),
                                          ].divide(SizedBox(height: 12.0)),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .greyLine,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'z3b6gtws' /* Name */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyDark,
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
                                                            'kktehqi4' /* COZYCODE LTD */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyGrey,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 1.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greyLine,
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'ye7vdum7' /* Mail */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyDark,
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
                                                            'ph7avn1x' /* support@euroget.com */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyGrey,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 1.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greyLine,
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '2hl3cf2h' /* Country */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyDark,
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
                                                            'gah9xkuh' /* England */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyGrey,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 1.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greyLine,
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '0lhqsfhw' /* City */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyDark,
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
                                                            'dcbv6mcy' /* London */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyGrey,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 1.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greyLine,
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'tx31kupf' /* Address */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyDark,
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
                                                            '0i0dyy7g' /* 71-75 Shelton Street */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyGrey,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 1.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greyLine,
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '93ydcrfg' /* Zip code */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyDark,
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
                                                            'xzgq2h0k' /* WC2H 9JQ */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyGrey,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 40.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
