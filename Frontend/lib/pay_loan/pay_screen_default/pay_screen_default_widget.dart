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
import 'package:provider/provider.dart';
import 'pay_screen_default_model.dart';
export 'pay_screen_default_model.dart';

class PayScreenDefaultWidget extends StatefulWidget {
  const PayScreenDefaultWidget({Key? key}) : super(key: key);

  @override
  _PayScreenDefaultWidgetState createState() => _PayScreenDefaultWidgetState();
}

class _PayScreenDefaultWidgetState extends State<PayScreenDefaultWidget> {
  late PayScreenDefaultModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PayScreenDefaultModel());
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
          child: FutureBuilder<ApiCallResponse>(
            future: LoanManagementGroup.allUserinstallmentsCall.call(
              filter: 'upcoming',
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
              final columnAllUserinstallmentsResponse = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Container(
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
                                          await launchURL(
                                              'https://euroget.framer.website/faq');
                                        },
                                        child: Container(
                                          width: 24.0,
                                          height: 24.0,
                                          decoration: BoxDecoration(),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: SvgPicture.network(
                                              'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Question%20circle.svg',
                                              width: 300.0,
                                              height: 200.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
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
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'umm3svco' /* Unpaid debt */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .daBlack200,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              FutureBuilder<ApiCallResponse>(
                                                future: LoanManagementGroup
                                                    .checkLimitCall
                                                    .call(
                                                  userId: currentUserUid,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final rowCheckLimitResponse =
                                                      snapshot.data!;
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      RichText(
                                                        textScaleFactor:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaleFactor,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'e3kbzufj' /* € */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .displayLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Rajdhani',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  getJsonField(
                                                                rowCheckLimitResponse
                                                                    .jsonBody,
                                                                r'''$['active_loan']''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .displayLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Rajdhani',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                lineHeight: 1.0,
                                                              ),
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ].divide(SizedBox(height: 6.0)),
                                          ),
                                        ),
                                        if (getJsonField(
                                              columnAllUserinstallmentsResponse
                                                  .jsonBody,
                                              r'''$.next_payment_date''',
                                            ) !=
                                            null)
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greyLine,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 12.0, 16.0, 12.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '8qyw6gcg' /* Next payment */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                                      Text(
                                                        dateTimeFormat(
                                                          'MMMEd',
                                                          dateTimeFromSecondsSinceEpoch(
                                                              getJsonField(
                                                            columnAllUserinstallmentsResponse
                                                                .jsonBody,
                                                            r'''$.next_payment_date''',
                                                          )),
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'tlh3yp91' /* Amount */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                                      RichText(
                                                        textScaleFactor:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaleFactor,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'v0vqrgs9' /* € */,
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
                                                            TextSpan(
                                                              text:
                                                                  getJsonField(
                                                                columnAllUserinstallmentsResponse
                                                                    .jsonBody,
                                                                r'''$.next_payment_amount''',
                                                              ).toString(),
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
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 10.0)),
                                              ),
                                            ),
                                          ),
                                      ].divide(SizedBox(height: 24.0)),
                                    ),
                                  ),
                                ]
                                    .divide(SizedBox(height: 48.0))
                                    .addToStart(SizedBox(height: 28.0)),
                              ),
                            ),
                          ),
                          if (_model.upSelected)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
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
                                        padding: EdgeInsets.all(6.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 165.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greyDark,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 6.0, 12.0, 6.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'fo615hys' /* Upcoming payments */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyLight,
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
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  _model.upSelected = false;
                                                });
                                              },
                                              child: Container(
                                                width: 165.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 6.0, 12.0, 6.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'gmy4pxz7' /* History */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .daBlack900,
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
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Visibility(
                                        visible:
                                            columnAllUserinstallmentsResponse
                                                .succeeded,
                                        child: Builder(
                                          builder: (context) {
                                            final test = getJsonField(
                                              columnAllUserinstallmentsResponse
                                                  .jsonBody,
                                              r'''$.installments''',
                                            ).toList();
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  test.length, (testIndex) {
                                                final testItem =
                                                    test[testIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if ((String var1) {
                                                      return var1
                                                          .contains("payments");
                                                    }(getJsonField(
                                                      testItem,
                                                      r'''$''',
                                                    ).toString())) {
                                                      setState(() {
                                                        FFAppState()
                                                                .installmentid =
                                                            getJsonField(
                                                          testItem,
                                                          r'''$.installment_id''',
                                                        ).toString();
                                                      });

                                                      context.pushNamed(
                                                          'loanPreview');
                                                    } else {
                                                      setState(() {
                                                        FFAppState().paymentid =
                                                            getJsonField(
                                                          testItem,
                                                          r'''$.payment_id''',
                                                        ).toString();
                                                      });

                                                      context.pushNamed(
                                                          'paydayPreview');
                                                    }
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .greyLine,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  12.0,
                                                                  16.0,
                                                                  15.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: 120.0,
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
                                                                    RichText(
                                                                      textScaleFactor:
                                                                          MediaQuery.of(context)
                                                                              .textScaleFactor,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'w4eziuja' /* Payment  */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).greyDark,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                testIndex.toString(),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).greyDark,
                                                                                ),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
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
                                                                      (String var1) {
                                                                        return var1
                                                                            .contains("payments");
                                                                      }(getJsonField(
                                                                        testItem,
                                                                        r'''$''',
                                                                      ).toString())
                                                                          ? dateTimeFormat(
                                                                              'MMMEd',
                                                                              dateTimeFromSecondsSinceEpoch(getJsonField(
                                                                                testItem,
                                                                                r'''$.next_payment_date''',
                                                                              )),
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            )
                                                                          : dateTimeFormat(
                                                                              'MMMEd',
                                                                              dateTimeFromSecondsSinceEpoch(getJsonField(
                                                                                testItem,
                                                                                r'''$.date''',
                                                                              )),
                                                                              locale: FFLocalizations.of(context).languageCode,
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
                                                          if ((String var1) {
                                                            return var1
                                                                .contains(
                                                                    "payments");
                                                          }(getJsonField(
                                                            testItem,
                                                            r'''$''',
                                                          ).toString()))
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: 6.0,
                                                                    height: 6.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color:
                                                                          () {
                                                                        if (getJsonField(
                                                                          testItem,
                                                                          r'''$.payments[0].paid''',
                                                                        )) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .brandMedium;
                                                                        } else if ((String
                                                                            var1) {
                                                                          return var1 ==
                                                                              'failed';
                                                                        }(getJsonField(
                                                                          testItem,
                                                                          r'''$.payments[0].status''',
                                                                        ).toString())) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .error;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greyLine;
                                                                        }
                                                                      }(),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              100.0),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 6.0,
                                                                    height: 6.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color:
                                                                          () {
                                                                        if (getJsonField(
                                                                          testItem,
                                                                          r'''$.payments[1].paid''',
                                                                        )) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .brandMedium;
                                                                        } else if ((String
                                                                            var1) {
                                                                          return var1 ==
                                                                              'failed';
                                                                        }(getJsonField(
                                                                          testItem,
                                                                          r'''$.payments[1].status''',
                                                                        ).toString())) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .error;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greyLine;
                                                                        }
                                                                      }(),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              100.0),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 6.0,
                                                                    height: 6.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color:
                                                                          () {
                                                                        if (getJsonField(
                                                                          testItem,
                                                                          r'''$.payments[2].paid''',
                                                                        )) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .brandMedium;
                                                                        } else if ((String
                                                                            var1) {
                                                                          return var1 ==
                                                                              'failed';
                                                                        }(getJsonField(
                                                                          testItem,
                                                                          r'''$.payments[2].status''',
                                                                        ).toString())) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .error;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greyLine;
                                                                        }
                                                                      }(),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              100.0),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 6.0,
                                                                    height: 6.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color:
                                                                          () {
                                                                        if (getJsonField(
                                                                          testItem,
                                                                          r'''$.payments[3].paid''',
                                                                        )) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .brandMedium;
                                                                        } else if ((String
                                                                            var1) {
                                                                          return var1 ==
                                                                              'failed';
                                                                        }(getJsonField(
                                                                          testItem,
                                                                          r'''$.payments[3].status''',
                                                                        ).toString())) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .error;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greyLine;
                                                                        }
                                                                      }(),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              100.0),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                          Container(
                                                            width: 120.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    RichText(
                                                                      textScaleFactor:
                                                                          MediaQuery.of(context)
                                                                              .textScaleFactor,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'p3o167aq' /* € */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).daBlack900,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text: (String var1) {
                                                                              return var1.contains("payments");
                                                                            }(getJsonField(
                                                                              testItem,
                                                                              r'''$''',
                                                                            ).toString())
                                                                                ? getJsonField(
                                                                                    testItem,
                                                                                    r'''$.outstanding_debt''',
                                                                                  ).toString()
                                                                                : getJsonField(
                                                                                    testItem,
                                                                                    r'''$.total_debt''',
                                                                                  ).toString(),
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).daBlack900,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'oo6fbg7r' /* Remaining */,
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }).divide(SizedBox(height: 12.0)),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    if (columnAllUserinstallmentsResponse
                                            .statusCode ==
                                        404)
                                      Container(
                                        width: double.infinity,
                                        height: 263.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .greyLine,
                                            width: 1.0,
                                          ),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  46.0, 20.0, 46.0, 21.0),
                                          child: Wrap(
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
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '11g6k232' /* You don’t have any upcoming pa... */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineLarge
                                                    .override(
                                                      fontFamily: 'Rajdhani',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .lineDark,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                              ),
                            ),
                          if (!_model.upSelected)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: LoanManagementGroup
                                    .allUserinstallmentsCall
                                    .call(
                                  filter: 'historical',
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final containerAllUserinstallmentsResponse =
                                      snapshot.data!;
                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .greyLine,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(6.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    setState(() {
                                                      _model.upSelected = true;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 165.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  6.0,
                                                                  12.0,
                                                                  6.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'ru5j0ne0' /* Upcoming payments */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .daBlack900,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 165.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .daBlack900,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 6.0,
                                                                12.0, 6.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '0944cmn0' /* History */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyLight,
                                                              ),
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
                                          child: Visibility(
                                            visible:
                                                columnAllUserinstallmentsResponse
                                                    .succeeded,
                                            child: Builder(
                                              builder: (context) {
                                                final historical = getJsonField(
                                                  containerAllUserinstallmentsResponse
                                                      .jsonBody,
                                                  r'''$.installments''',
                                                ).toList();
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      historical.length,
                                                      (historicalIndex) {
                                                    final historicalItem =
                                                        historical[
                                                            historicalIndex];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if ((String var1) {
                                                          return var1.contains(
                                                              "payments");
                                                        }(getJsonField(
                                                          historicalItem,
                                                          r'''$''',
                                                        ).toString())) {
                                                          setState(() {
                                                            FFAppState()
                                                                    .installmentid =
                                                                getJsonField(
                                                              historicalItem,
                                                              r'''$.installment_id''',
                                                            ).toString();
                                                          });

                                                          context.pushNamed(
                                                              'loanPreview');
                                                        } else {
                                                          setState(() {
                                                            FFAppState()
                                                                    .paymentid =
                                                                getJsonField(
                                                              historicalItem,
                                                              r'''$.payment_id''',
                                                            ).toString();
                                                          });

                                                          context.pushNamed(
                                                              'paydayPreview');
                                                        }
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .greyLine,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      12.0,
                                                                      16.0,
                                                                      15.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                width: 120.0,
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
                                                                        RichText(
                                                                          textScaleFactor:
                                                                              MediaQuery.of(context).textScaleFactor,
                                                                          text:
                                                                              TextSpan(
                                                                            children: [
                                                                              TextSpan(
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  '03fr7uim' /* Payment  */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).greyDark,
                                                                                    ),
                                                                              ),
                                                                              TextSpan(
                                                                                text: historicalIndex.toString(),
                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).greyDark,
                                                                                    ),
                                                                              )
                                                                            ],
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
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
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'zfy5n4p2' /* Paid */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).greyGrey,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          6.0)),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 120.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        RichText(
                                                                          textScaleFactor:
                                                                              MediaQuery.of(context).textScaleFactor,
                                                                          text:
                                                                              TextSpan(
                                                                            children: [
                                                                              TextSpan(
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'rjtblzb0' /* € */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).greyGrey,
                                                                                    ),
                                                                              ),
                                                                              TextSpan(
                                                                                text: getJsonField(
                                                                                  historicalItem,
                                                                                  r'''$.total_debt''',
                                                                                ).toString(),
                                                                                style: TextStyle(),
                                                                              )
                                                                            ],
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).greyGrey,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'utfhxj87' /* Paid */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).greyGrey,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          6.0)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }).divide(
                                                      SizedBox(height: 12.0)),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        if (columnAllUserinstallmentsResponse
                                                .statusCode ==
                                            404)
                                          Container(
                                            width: double.infinity,
                                            height: 263.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greyLine,
                                                width: 1.0,
                                              ),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      46.0, 20.0, 46.0, 21.0),
                                              child: Wrap(
                                                spacing: 0.0,
                                                runSpacing: 0.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '4sx1eavv' /* You don’t have any hsitorical ... */,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              'Rajdhani',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lineDark,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        if (columnAllUserinstallmentsResponse
                                                .statusCode ==
                                            404)
                                          Container(
                                            width: double.infinity,
                                            height: 44.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .greyLine,
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    's52pfks5' /* Pay all */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Rajdhani',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .greyGrey,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                      ].divide(SizedBox(height: 20.0)),
                                    ),
                                  );
                                },
                              ),
                            ),
                          if (columnAllUserinstallmentsResponse.succeeded)
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 32.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('payScreenPayAll');
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 44.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .greyDark,
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'cphpbt46' /* Pay all */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Rajdhani',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .greyLight,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                              ),
                            ),
                        ]
                            .divide(SizedBox(height: 40.0))
                            .addToEnd(SizedBox(height: 64.0)),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 40.0)),
              );
            },
          ),
        ),
      ),
    );
  }
}
