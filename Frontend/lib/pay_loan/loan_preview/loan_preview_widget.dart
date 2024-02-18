import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'loan_preview_model.dart';
export 'loan_preview_model.dart';

class LoanPreviewWidget extends StatefulWidget {
  const LoanPreviewWidget({Key? key}) : super(key: key);

  @override
  _LoanPreviewWidgetState createState() => _LoanPreviewWidgetState();
}

class _LoanPreviewWidgetState extends State<LoanPreviewWidget> {
  late LoanPreviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoanPreviewModel());
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: FutureBuilder<ApiCallResponse>(
                      future: LoanManagementGroup.installmentdetailsCall.call(
                        installmentId: FFAppState().installmentid,
                        userId: currentUserUid,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        final columnInstallmentdetailsResponse = snapshot.data!;
                        return Column(
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
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
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
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'jxx5mmbo' /* Cash Advance */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Rajdhani',
                                                        lineHeight: 1.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              dateTimeFormat(
                                                'yMMMd',
                                                dateTimeFromSecondsSinceEpoch(
                                                    getJsonField(
                                                  columnInstallmentdetailsResponse
                                                      .jsonBody,
                                                  r'''$.next_payment_date''',
                                                )),
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .greyGrey,
                                                        lineHeight: 1.3,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ].divide(SizedBox(height: 6.0)),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        getJsonField(
                                                          columnInstallmentdetailsResponse
                                                              .jsonBody,
                                                          r'''$.details.confirmed_debt''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Rajdhani',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .daBlack200,
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
                                                          'aqmeobsg' /* Paid */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                ].divide(SizedBox(height: 2.0)),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      RichText(
                                                        textScaleFactor:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaleFactor,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: getJsonField(
                                                                        columnInstallmentdetailsResponse
                                                                            .jsonBody,
                                                                        r'''$.details.outstanding_debt''',
                                                                      ).toString() ==
                                                                      0.0
                                                                  ? ' '
                                                                  : '€',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Rajdhani',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .greyDark,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: getJsonField(
                                                                        columnInstallmentdetailsResponse
                                                                            .jsonBody,
                                                                        r'''$.details.outstanding_debt''',
                                                                      ).toString() ==
                                                                      0.0
                                                                  ? 'Finished'
                                                                  : getJsonField(
                                                                      columnInstallmentdetailsResponse
                                                                          .jsonBody,
                                                                      r'''$.details.outstanding_debt''',
                                                                    ).toString(),
                                                              style:
                                                                  TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Rajdhani',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyDark,
                                                              ),
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
                                                          'l7drv08v' /* remaining */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                ].divide(SizedBox(height: 2.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .greyLine,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(6.0),
                                                  child: LinearPercentIndicator(
                                                    percent:
                                                        valueOrDefault<double>(
                                                      getJsonField(
                                                            columnInstallmentdetailsResponse
                                                                .jsonBody,
                                                            r'''$.details.confirmed_debt''',
                                                          ) /
                                                          (getJsonField(
                                                                columnInstallmentdetailsResponse
                                                                    .jsonBody,
                                                                r'''$.details.confirmed_debt''',
                                                              ) +
                                                              getJsonField(
                                                                columnInstallmentdetailsResponse
                                                                    .jsonBody,
                                                                r'''$.details.outstanding_debt''',
                                                              ) +
                                                              0.0000001),
                                                      0.0,
                                                    ),
                                                    lineHeight: 12.0,
                                                    animation: true,
                                                    animateFromLastPercent:
                                                        true,
                                                    progressColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .brandMedium,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .greyLight,
                                                    barRadius:
                                                        Radius.circular(8.0),
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 12.0)),
                                    ),
                                  ),
                                ]
                                    .divide(SizedBox(height: 20.0))
                                    .addToStart(SizedBox(height: 28.0)),
                              ),
                            ),
                            if (_model.scheduleSelected == true)
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
                                        if (_model.scheduleSelected == true) {
                                          setState(() {
                                            _model.scheduleSelected = false;
                                          });
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 0.0, 2.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 6.0,
                                                height: 6.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .greyDark,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                ),
                                              ),
                                              Container(
                                                width: 6.0,
                                                height: 6.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .greyLine,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 6.0)),
                                          ),
                                        ),
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
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 6.0,
                                                                height: 6.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: () {
                                                                    if (getJsonField(
                                                                      columnInstallmentdetailsResponse
                                                                          .jsonBody,
                                                                      r'''$.details.payments[0].paid''',
                                                                    )) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .brandMedium;
                                                                    } else if ((String
                                                                        var1) {
                                                                      return var1 ==
                                                                          'failed';
                                                                    }(getJsonField(
                                                                      columnInstallmentdetailsResponse
                                                                          .jsonBody,
                                                                      r'''$.details.payments[0].status''',
                                                                    ).toString())) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .error;
                                                                    } else {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .greyLine;
                                                                    }
                                                                  }(),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              1000.0),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 1.0,
                                                                height: 41.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: () {
                                                                    if (getJsonField(
                                                                      columnInstallmentdetailsResponse
                                                                          .jsonBody,
                                                                      r'''$.details.payments[0].paid''',
                                                                    )) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .brandMedium;
                                                                    } else if ((String
                                                                        var1) {
                                                                      return var1 ==
                                                                          'failed';
                                                                    }(getJsonField(
                                                                      columnInstallmentdetailsResponse
                                                                          .jsonBody,
                                                                      r'''$.details.payments[0].status''',
                                                                    ).toString())) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .error;
                                                                    } else {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .greyLine;
                                                                    }
                                                                  }(),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 4.0)),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'lduuxlyd' /* First payment */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).greyDark,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    dateTimeFormat(
                                                                      'MMMEd',
                                                                      dateTimeFromSecondsSinceEpoch(
                                                                          getJsonField(
                                                                        columnInstallmentdetailsResponse
                                                                            .jsonBody,
                                                                        r'''$.details.payments[0].charge_date''',
                                                                      )),
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).greyGrey,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 6.0)),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 12.0)),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        RichText(
                                                          textScaleFactor:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaleFactor,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    getJsonField(
                                                                  columnInstallmentdetailsResponse
                                                                      .jsonBody,
                                                                  r'''$.details.payments[0].paid''',
                                                                )
                                                                        ? ' '
                                                                        : '€',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color:
                                                                          () {
                                                                        if (getJsonField(
                                                                          columnInstallmentdetailsResponse
                                                                              .jsonBody,
                                                                          r'''$.details.payments[0].paid''',
                                                                        )) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greyGrey;
                                                                        } else if ((String
                                                                            var1) {
                                                                          return var1 ==
                                                                              'failed';
                                                                        }(getJsonField(
                                                                          columnInstallmentdetailsResponse
                                                                              .jsonBody,
                                                                          r'''$.details.payments[0].status''',
                                                                        ).toString())) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .error;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greyDark;
                                                                        }
                                                                      }(),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: () {
                                                                  if (getJsonField(
                                                                    columnInstallmentdetailsResponse
                                                                        .jsonBody,
                                                                    r'''$.details.payments[0].paid''',
                                                                  )) {
                                                                    return 'Paid';
                                                                  } else if ((String
                                                                      var1) {
                                                                    return var1 ==
                                                                        'failed';
                                                                  }(getJsonField(
                                                                    columnInstallmentdetailsResponse
                                                                        .jsonBody,
                                                                    r'''$.details.payments[0].status''',
                                                                  ).toString())) {
                                                                    return 'Overdue';
                                                                  } else {
                                                                    return getJsonField(
                                                                      columnInstallmentdetailsResponse
                                                                          .jsonBody,
                                                                      r'''$.details.payments[0].payment_amount''',
                                                                    ).toString();
                                                                  }
                                                                }(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color:
                                                                          () {
                                                                        if (getJsonField(
                                                                          columnInstallmentdetailsResponse
                                                                              .jsonBody,
                                                                          r'''$.details.payments[0].paid''',
                                                                        )) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greyGrey;
                                                                        } else if ((String
                                                                            var1) {
                                                                          return var1 ==
                                                                              'failed';
                                                                        }(getJsonField(
                                                                          columnInstallmentdetailsResponse
                                                                              .jsonBody,
                                                                          r'''$.details.payments[0].status''',
                                                                        ).toString())) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .error;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greyDark;
                                                                        }
                                                                      }(),
                                                                    ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .greyGrey,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 6.0,
                                                                height: 6.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: () {
                                                                    if (getJsonField(
                                                                      columnInstallmentdetailsResponse
                                                                          .jsonBody,
                                                                      r'''$.details.payments[1].paid''',
                                                                    )) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .brandMedium;
                                                                    } else if ((String
                                                                        var1) {
                                                                      return var1 ==
                                                                          'failed';
                                                                    }(getJsonField(
                                                                      columnInstallmentdetailsResponse
                                                                          .jsonBody,
                                                                      r'''$.details.payments[1].status''',
                                                                    ).toString())) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .error;
                                                                    } else {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .greyLine;
                                                                    }
                                                                  }(),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              1000.0),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 1.0,
                                                                height: 41.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: () {
                                                                    if (getJsonField(
                                                                      columnInstallmentdetailsResponse
                                                                          .jsonBody,
                                                                      r'''$.details.payments[1].paid''',
                                                                    )) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .brandMedium;
                                                                    } else if ((String
                                                                        var1) {
                                                                      return var1 ==
                                                                          'failed';
                                                                    }(getJsonField(
                                                                      columnInstallmentdetailsResponse
                                                                          .jsonBody,
                                                                      r'''$.details.payments[1].status''',
                                                                    ).toString())) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .error;
                                                                    } else {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .greyLine;
                                                                    }
                                                                  }(),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 4.0)),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'lis82a0w' /* Second payment */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).greyDark,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    dateTimeFormat(
                                                                      'MMMEd',
                                                                      dateTimeFromSecondsSinceEpoch(
                                                                          getJsonField(
                                                                        columnInstallmentdetailsResponse
                                                                            .jsonBody,
                                                                        r'''$.details.payments[1].charge_date''',
                                                                      )),
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).greyGrey,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 6.0)),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 12.0)),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        RichText(
                                                          textScaleFactor:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaleFactor,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    getJsonField(
                                                                  columnInstallmentdetailsResponse
                                                                      .jsonBody,
                                                                  r'''$.details.payments[1].paid''',
                                                                )
                                                                        ? ' '
                                                                        : '€',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color:
                                                                          () {
                                                                        if (getJsonField(
                                                                          columnInstallmentdetailsResponse
                                                                              .jsonBody,
                                                                          r'''$.details.payments[1].paid''',
                                                                        )) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greyGrey;
                                                                        } else if ((String
                                                                            var1) {
                                                                          return var1 ==
                                                                              'failed';
                                                                        }(getJsonField(
                                                                          columnInstallmentdetailsResponse
                                                                              .jsonBody,
                                                                          r'''$.details.payments[1].status''',
                                                                        ).toString())) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .error;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greyDark;
                                                                        }
                                                                      }(),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: () {
                                                                  if (getJsonField(
                                                                    columnInstallmentdetailsResponse
                                                                        .jsonBody,
                                                                    r'''$.details.payments[1].paid''',
                                                                  )) {
                                                                    return 'Paid';
                                                                  } else if ((String
                                                                      var1) {
                                                                    return var1 ==
                                                                        'failed';
                                                                  }(getJsonField(
                                                                    columnInstallmentdetailsResponse
                                                                        .jsonBody,
                                                                    r'''$.details.payments[1].status''',
                                                                  ).toString())) {
                                                                    return 'Overdue';
                                                                  } else {
                                                                    return getJsonField(
                                                                      columnInstallmentdetailsResponse
                                                                          .jsonBody,
                                                                      r'''$.details.payments[1].payment_amount''',
                                                                    ).toString();
                                                                  }
                                                                }(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color:
                                                                          () {
                                                                        if (getJsonField(
                                                                          columnInstallmentdetailsResponse
                                                                              .jsonBody,
                                                                          r'''$.details.payments[1].paid''',
                                                                        )) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greyGrey;
                                                                        } else if ((String
                                                                            var1) {
                                                                          return var1 ==
                                                                              'failed';
                                                                        }(getJsonField(
                                                                          columnInstallmentdetailsResponse
                                                                              .jsonBody,
                                                                          r'''$.details.payments[1].status''',
                                                                        ).toString())) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .error;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greyDark;
                                                                        }
                                                                      }(),
                                                                    ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .greyGrey,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 6.0,
                                                                height: 6.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: () {
                                                                    if (getJsonField(
                                                                      columnInstallmentdetailsResponse
                                                                          .jsonBody,
                                                                      r'''$.details.payments[2].paid''',
                                                                    )) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .brandMedium;
                                                                    } else if ((String
                                                                        var1) {
                                                                      return var1 ==
                                                                          'failed';
                                                                    }(getJsonField(
                                                                      columnInstallmentdetailsResponse
                                                                          .jsonBody,
                                                                      r'''$.details.payments[2].status''',
                                                                    ).toString())) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .error;
                                                                    } else {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .greyLine;
                                                                    }
                                                                  }(),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              1000.0),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 1.0,
                                                                height: 41.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: () {
                                                                    if (getJsonField(
                                                                      columnInstallmentdetailsResponse
                                                                          .jsonBody,
                                                                      r'''$.details.payments[2].paid''',
                                                                    )) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .brandMedium;
                                                                    } else if ((String
                                                                        var1) {
                                                                      return var1 ==
                                                                          'failed';
                                                                    }(getJsonField(
                                                                      columnInstallmentdetailsResponse
                                                                          .jsonBody,
                                                                      r'''$.details.payments[2].status''',
                                                                    ).toString())) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .error;
                                                                    } else {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .greyLine;
                                                                    }
                                                                  }(),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 4.0)),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'j2re58dj' /* Third payment */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).greyDark,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    dateTimeFormat(
                                                                      'MMMEd',
                                                                      dateTimeFromSecondsSinceEpoch(
                                                                          getJsonField(
                                                                        columnInstallmentdetailsResponse
                                                                            .jsonBody,
                                                                        r'''$.details.payments[2].charge_date''',
                                                                      )),
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).greyGrey,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 6.0)),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 12.0)),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        RichText(
                                                          textScaleFactor:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaleFactor,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    getJsonField(
                                                                  columnInstallmentdetailsResponse
                                                                      .jsonBody,
                                                                  r'''$.details.payments[2].paid''',
                                                                )
                                                                        ? ' '
                                                                        : '€',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color:
                                                                          () {
                                                                        if (getJsonField(
                                                                          columnInstallmentdetailsResponse
                                                                              .jsonBody,
                                                                          r'''$.details.payments[2].paid''',
                                                                        )) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greyGrey;
                                                                        } else if ((String
                                                                            var1) {
                                                                          return var1 ==
                                                                              'failed';
                                                                        }(getJsonField(
                                                                          columnInstallmentdetailsResponse
                                                                              .jsonBody,
                                                                          r'''$.details.payments[2].status''',
                                                                        ).toString())) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .error;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greyDark;
                                                                        }
                                                                      }(),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: () {
                                                                  if (getJsonField(
                                                                    columnInstallmentdetailsResponse
                                                                        .jsonBody,
                                                                    r'''$.details.payments[2].paid''',
                                                                  )) {
                                                                    return 'Paid';
                                                                  } else if ((String
                                                                      var1) {
                                                                    return var1 ==
                                                                        'failed';
                                                                  }(getJsonField(
                                                                    columnInstallmentdetailsResponse
                                                                        .jsonBody,
                                                                    r'''$.details.payments[2].status''',
                                                                  ).toString())) {
                                                                    return 'Overdue';
                                                                  } else {
                                                                    return getJsonField(
                                                                      columnInstallmentdetailsResponse
                                                                          .jsonBody,
                                                                      r'''$.details.payments[2].payment_amount''',
                                                                    ).toString();
                                                                  }
                                                                }(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color:
                                                                          () {
                                                                        if (getJsonField(
                                                                          columnInstallmentdetailsResponse
                                                                              .jsonBody,
                                                                          r'''$.details.payments[2].paid''',
                                                                        )) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greyGrey;
                                                                        } else if ((String
                                                                            var1) {
                                                                          return var1 ==
                                                                              'failed';
                                                                        }(getJsonField(
                                                                          columnInstallmentdetailsResponse
                                                                              .jsonBody,
                                                                          r'''$.details.payments[2].status''',
                                                                        ).toString())) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .error;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greyDark;
                                                                        }
                                                                      }(),
                                                                    ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .greyGrey,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 6.0,
                                                                height: 6.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: () {
                                                                    if (getJsonField(
                                                                      columnInstallmentdetailsResponse
                                                                          .jsonBody,
                                                                      r'''$.details.payments[3].paid''',
                                                                    )) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .brandMedium;
                                                                    } else if ((String
                                                                        var1) {
                                                                      return var1 ==
                                                                          'failed';
                                                                    }(getJsonField(
                                                                      columnInstallmentdetailsResponse
                                                                          .jsonBody,
                                                                      r'''$.details.payments[3].status''',
                                                                    ).toString())) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .error;
                                                                    } else {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .greyLine;
                                                                    }
                                                                  }(),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              1000.0),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 1.0,
                                                                height: 41.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: () {
                                                                    if (getJsonField(
                                                                      columnInstallmentdetailsResponse
                                                                          .jsonBody,
                                                                      r'''$.details.payments[3].paid''',
                                                                    )) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .brandMedium;
                                                                    } else if ((String
                                                                        var1) {
                                                                      return var1 ==
                                                                          'failed';
                                                                    }(getJsonField(
                                                                      columnInstallmentdetailsResponse
                                                                          .jsonBody,
                                                                      r'''$.details.payments[3].status''',
                                                                    ).toString())) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .error;
                                                                    } else {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .greyLine;
                                                                    }
                                                                  }(),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 4.0)),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'k777qt2v' /* Final payment */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).greyDark,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    dateTimeFormat(
                                                                      'MMMEd',
                                                                      dateTimeFromSecondsSinceEpoch(
                                                                          getJsonField(
                                                                        columnInstallmentdetailsResponse
                                                                            .jsonBody,
                                                                        r'''$.details.payments[3].charge_date''',
                                                                      )),
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).greyGrey,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 6.0)),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 12.0)),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        RichText(
                                                          textScaleFactor:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaleFactor,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    getJsonField(
                                                                  columnInstallmentdetailsResponse
                                                                      .jsonBody,
                                                                  r'''$.details.payments[3].paid''',
                                                                )
                                                                        ? ' '
                                                                        : '€',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color:
                                                                          () {
                                                                        if (getJsonField(
                                                                          columnInstallmentdetailsResponse
                                                                              .jsonBody,
                                                                          r'''$.details.payments[3].paid''',
                                                                        )) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greyGrey;
                                                                        } else if ((String
                                                                            var1) {
                                                                          return var1 ==
                                                                              'failed';
                                                                        }(getJsonField(
                                                                          columnInstallmentdetailsResponse
                                                                              .jsonBody,
                                                                          r'''$.details.payments[3].status''',
                                                                        ).toString())) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .error;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greyDark;
                                                                        }
                                                                      }(),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: () {
                                                                  if (getJsonField(
                                                                    columnInstallmentdetailsResponse
                                                                        .jsonBody,
                                                                    r'''$.details.payments[3].paid''',
                                                                  )) {
                                                                    return 'Paid';
                                                                  } else if ((String
                                                                      var1) {
                                                                    return var1 ==
                                                                        'failed';
                                                                  }(getJsonField(
                                                                    columnInstallmentdetailsResponse
                                                                        .jsonBody,
                                                                    r'''$.details.payments[3].status''',
                                                                  ).toString())) {
                                                                    return 'Overdue';
                                                                  } else {
                                                                    return getJsonField(
                                                                      columnInstallmentdetailsResponse
                                                                          .jsonBody,
                                                                      r'''$.details.payments[3].payment_amount''',
                                                                    ).toString();
                                                                  }
                                                                }(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color:
                                                                          () {
                                                                        if (getJsonField(
                                                                          columnInstallmentdetailsResponse
                                                                              .jsonBody,
                                                                          r'''$.details.payments[3].paid''',
                                                                        )) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greyGrey;
                                                                        } else if ((String
                                                                            var1) {
                                                                          return var1 ==
                                                                              'failed';
                                                                        }(getJsonField(
                                                                          columnInstallmentdetailsResponse
                                                                              .jsonBody,
                                                                          r'''$.details.payments[3].status''',
                                                                        ).toString())) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .error;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greyDark;
                                                                        }
                                                                      }(),
                                                                    ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .greyGrey,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 6.0)),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            if (_model.scheduleSelected == false)
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
                                        if (_model.scheduleSelected != true) {
                                          setState(() {
                                            _model.scheduleSelected = true;
                                          });
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 0.0, 2.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 6.0,
                                                height: 6.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .greyLine,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                ),
                                              ),
                                              Container(
                                                width: 6.0,
                                                height: 6.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .greyDark,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 6.0)),
                                          ),
                                        ),
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
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 16.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(),
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
                                                            'kdym6ogr' /* Date of issuance */,
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
                                                          dateTimeFormat(
                                                            'd/M/y',
                                                            dateTimeFromSecondsSinceEpoch(
                                                                getJsonField(
                                                              columnInstallmentdetailsResponse
                                                                  .jsonBody,
                                                              r'''$.details.payments[0].charge_date''',
                                                            )),
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
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
                                                  ],
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 16.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(),
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
                                                            'gkh6qgok' /* Sum taken */,
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
                                                        RichText(
                                                          textScaleFactor:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaleFactor,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '99jnt55e' /* € */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .greyGrey,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    getJsonField(
                                                                  columnInstallmentdetailsResponse
                                                                      .jsonBody,
                                                                  r'''$.details.total_debt''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .greyGrey,
                                                                    ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 16.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(),
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
                                                            '4ysqp9p0' /* Outstanding debt */,
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
                                                        RichText(
                                                          textScaleFactor:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaleFactor,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'ulwf15m7' /* € */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .greyGrey,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    getJsonField(
                                                                  columnInstallmentdetailsResponse
                                                                      .jsonBody,
                                                                  r'''$.details.outstanding_debt''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .greyGrey,
                                                                    ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
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
                                              await launchURL(
                                                  'https://euroget.framer.website/advance-terms');
                                            },
                                            child: Container(
                                              width: 165.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .greyLine,
                                                  width: 1.0,
                                                ),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 6.0, 12.0, 8.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'a2i8ounl' /* Advance  terms */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .greyDark,
                                                      ),
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
                                              context.pushNamed(
                                                  'advanceVerification');
                                            },
                                            child: Container(
                                              width: 165.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .greyLine,
                                                  width: 1.0,
                                                ),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 6.0, 12.0, 8.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'c39ktthw' /* Advance verification */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .greyDark,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 12.0)),
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 32.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('payScreenPayment');
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).greyDark,
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'ocnhln2m' /* Pay off the installment */,
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
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 40.0))
                              .addToEnd(SizedBox(height: 40.0)),
                        );
                      },
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
