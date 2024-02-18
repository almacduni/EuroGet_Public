import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getData = await SupabaseGroup.getDataCall.call(
        tableName: 'onboarding_persistance',
        fields: 'completed,pageRoute',
        filterVariable: currentUserUid,
        filterName: 'user_id',
      );
      if (!getJsonField(
        (_model.getData?.jsonBody ?? ''),
        r'''$[0].completed''',
      )) {
        if (getJsonField(
          (_model.getData?.jsonBody ?? ''),
          r'''$[0].pageRoute''',
        ).toString().toString().isEmpty) {
          context.pushNamed('step0Banner');
        } else {
          await actions.redirectToPage(
            context,
            getJsonField(
              (_model.getData?.jsonBody ?? ''),
              r'''$[0].pageRoute''',
            ).toString().toString(),
          );
        }
      }
    });
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

    return FutureBuilder<ApiCallResponse>(
      future: LoanManagementGroup.checkLimitCall.call(
        userId: currentUserUid,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).greyLight,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final homePageCheckLimitResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).greyLight,
            body: SafeArea(
              top: true,
              child: Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(),
                child: FutureBuilder<ApiCallResponse>(
                  future: MembershipGroup.checksubscriptionCall.call(
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
                    final columnChecksubscriptionResponse = snapshot.data!;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(),
                              child: SingleChildScrollView(
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
                                            if (_model.balanceLowTrigger)
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                        context.pushNamed(
                                                            'paymentCalculator');
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .greyBG,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .greyLine,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      12.0,
                                                                      16.0,
                                                                      16.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
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
                                                                    Wrap(
                                                                      spacing:
                                                                          0.0,
                                                                      runSpacing:
                                                                          0.0,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          WrapCrossAlignment
                                                                              .start,
                                                                      direction:
                                                                          Axis.horizontal,
                                                                      runAlignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      verticalDirection:
                                                                          VerticalDirection
                                                                              .down,
                                                                      clipBehavior:
                                                                          Clip.none,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '2ixte5ku' /* One of your balances is runnin... */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).greyDark,
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
                                                                            'y0l1nxrn' /* €250 is available to borrow */,
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
                                                                          8.0)),
                                                                ),
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .greyLight,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .greyLine,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          6.0,
                                                                          12.0,
                                                                          8.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'gazbfi8t' /* Borrow */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
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
                                            Container(
                                              decoration: BoxDecoration(),
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
                                                          '6arysg2w' /* Available credit */,
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
                                                                      .daBlack200,
                                                                ),
                                                      ),
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
                                                          context.pushNamed(
                                                              'notificationsDefault');
                                                        },
                                                        child: Container(
                                                          width: 24.0,
                                                          height: 24.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/images/Bell.svg',
                                                              width: 300.0,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
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
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                '7dknyb82' /* € */,
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
                                                                  valueOrDefault<
                                                                      String>(
                                                                getJsonField(
                                                                  homePageCheckLimitResponse
                                                                      .jsonBody,
                                                                  r'''$['loan_available']''',
                                                                ).toString(),
                                                                '0',
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
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
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
                                                      context.pushNamed(
                                                          'payScreenDefault');
                                                    },
                                                    child: Container(
                                                      width: 165.0,
                                                      height: 44.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .greyLight,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .greyLine,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (getJsonField(
                                                                homePageCheckLimitResponse
                                                                    .jsonBody,
                                                                r'''$.active_loan''',
                                                              ) ==
                                                              0) {
                                                            context.pushNamed(
                                                                'emptyLoans');
                                                          } else {
                                                            context.pushNamed(
                                                                'payScreenDefault');
                                                          }
                                                        },
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
                                                                'y3i1qasf' /* Pay */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Rajdhani',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .greyDark,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
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
                                                      if (getJsonField(
                                                        columnChecksubscriptionResponse
                                                            .jsonBody,
                                                        r'''$.is_member''',
                                                      )) {
                                                        context.pushNamed(
                                                            'borrowOptions');

                                                        if (!getJsonField(
                                                          homePageCheckLimitResponse
                                                              .jsonBody,
                                                          r'''$['funds_available']''',
                                                        )) {
                                                          context.pushNamed(
                                                              'reachedMaximum');
                                                        }
                                                      } else {
                                                        _model.getDataCancelled =
                                                            await SupabaseGroup
                                                                .getDataCall
                                                                .call(
                                                          tableName:
                                                              'memberships',
                                                          fields: 'cancelled',
                                                          filterVariable:
                                                              currentUserUid,
                                                          filterName: 'user_id',
                                                        );
                                                        if (getJsonField(
                                                          (_model.getDataCancelled
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$[0].cancelled''',
                                                        )) {
                                                          context.pushNamed(
                                                              'membershipBannerResubscribe');
                                                        }
                                                      }

                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      width: 165.0,
                                                      height: 44.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .greyDark,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          width: 1.0,
                                                        ),
                                                      ),
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
                                                              'x01s4x5z' /* Borrow */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
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
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]
                                              .divide(SizedBox(height: 20.0))
                                              .addToStart(
                                                  SizedBox(height: 60.0)),
                                        ),
                                      ),
                                    ),
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .greyLine,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        20.0,
                                                                        16.0,
                                                                        20.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      LinearPercentIndicator(
                                                                    percent:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      valueOrDefault<
                                                                              int>(
                                                                            getJsonField(
                                                                              homePageCheckLimitResponse.jsonBody,
                                                                              r'''$['active_loan']''',
                                                                            ),
                                                                            1,
                                                                          ) /
                                                                          valueOrDefault<
                                                                              int>(
                                                                            getJsonField(
                                                                              homePageCheckLimitResponse.jsonBody,
                                                                              r'''$['credit_limit']''',
                                                                            ),
                                                                            1,
                                                                          ),
                                                                      0.01,
                                                                    ),
                                                                    lineHeight:
                                                                        12.0,
                                                                    animation:
                                                                        true,
                                                                    animateFromLastPercent:
                                                                        true,
                                                                    progressColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .brandMedium,
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .greyBG,
                                                                    barRadius: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                6.0,
                                                                            height:
                                                                                6.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).brandMedium,
                                                                              borderRadius: BorderRadius.circular(100.0),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'n1pwxpm3' /* Used: */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).greyDark,
                                                                                ),
                                                                          ),
                                                                          RichText(
                                                                            textScaleFactor:
                                                                                MediaQuery.of(context).textScaleFactor,
                                                                            text:
                                                                                TextSpan(
                                                                              children: [
                                                                                TextSpan(
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    '4nis6z8k' /* € */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                ),
                                                                                TextSpan(
                                                                                  text: valueOrDefault<String>(
                                                                                    getJsonField(
                                                                                      homePageCheckLimitResponse.jsonBody,
                                                                                      r'''$['active_loan']''',
                                                                                    ).toString(),
                                                                                    '0',
                                                                                  ),
                                                                                  style: TextStyle(),
                                                                                )
                                                                              ],
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FlutterFlowTheme.of(context).greyDark,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 6.0)),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                6.0,
                                                                            height:
                                                                                6.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).greyBG,
                                                                              borderRadius: BorderRadius.circular(100.0),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).greyLine,
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'dl16fyby' /* Your limit: */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).greyDark,
                                                                                ),
                                                                          ),
                                                                          RichText(
                                                                            textScaleFactor:
                                                                                MediaQuery.of(context).textScaleFactor,
                                                                            text:
                                                                                TextSpan(
                                                                              children: [
                                                                                TextSpan(
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'i6pnlzqj' /* € */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                ),
                                                                                TextSpan(
                                                                                  text: valueOrDefault<String>(
                                                                                    getJsonField(
                                                                                      homePageCheckLimitResponse.jsonBody,
                                                                                      r'''$['credit_limit']''',
                                                                                    ).toString(),
                                                                                    '0',
                                                                                  ),
                                                                                  style: TextStyle(),
                                                                                )
                                                                              ],
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FlutterFlowTheme.of(context).greyDark,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 6.0)),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      16.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: OpenBankingGroup
                                                        .gcobgetbankaccountbalancesCall
                                                        .call(
                                                      userId: currentUserUid,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                      final containerGcobgetbankaccountbalancesResponse =
                                                          snapshot.data!;
                                                      return Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            setState(() {
                                                              _model.balanceLowTrigger =
                                                                  getJsonField(
                                                                containerGcobgetbankaccountbalancesResponse
                                                                    .jsonBody,
                                                                r'''$.low''',
                                                              );
                                                            });
                                                          },
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (homePageCheckLimitResponse
                                                                        .succeeded)
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).greyLine,
                                                                                  width: 1.0,
                                                                                ),
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 18.0, 16.0, 17.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 44.0,
                                                                                                height: 44.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(100.0),
                                                                                                ),
                                                                                                child: ClipRRect(
                                                                                                  borderRadius: BorderRadius.circular(100.0),
                                                                                                  child: Image.network(
                                                                                                    getJsonField(
                                                                                                      containerGcobgetbankaccountbalancesResponse.jsonBody,
                                                                                                      r'''$.data[0].bank_logo''',
                                                                                                    ).toString(),
                                                                                                    width: 300.0,
                                                                                                    height: 200.0,
                                                                                                    fit: BoxFit.cover,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          getJsonField(
                                                                                                            containerGcobgetbankaccountbalancesResponse.jsonBody,
                                                                                                            r'''$.data[0].bank_name''',
                                                                                                          ).toString().maybeHandleOverflow(
                                                                                                                maxChars: 13,
                                                                                                                replacement: '…',
                                                                                                              ),
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).greyDark,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          getJsonField(
                                                                                                            containerGcobgetbankaccountbalancesResponse.jsonBody,
                                                                                                            r'''$.data[0].iban''',
                                                                                                          ).toString().maybeHandleOverflow(
                                                                                                                maxChars: 8,
                                                                                                                replacement: '…',
                                                                                                              ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                lineHeight: 1.3,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 4.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 12.0)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              RichText(
                                                                                                textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                                                                                text: TextSpan(
                                                                                                  children: [
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        'rsk5x0o1' /* € */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).headlineMedium,
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: getJsonField(
                                                                                                        containerGcobgetbankaccountbalancesResponse.jsonBody,
                                                                                                        r'''$.data[0].balance_amount''',
                                                                                                      ).toString(),
                                                                                                      style: FlutterFlowTheme.of(context).headlineMedium,
                                                                                                    )
                                                                                                  ],
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).greyBG,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 14.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Stack(
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      width: 24.0,
                                                                                                      height: 24.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        borderRadius: BorderRadius.circular(100.0),
                                                                                                      ),
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                        child: Image.asset(
                                                                                                          'assets/images/unnamed-min_(1).png',
                                                                                                          width: 300.0,
                                                                                                          height: 200.0,
                                                                                                          fit: BoxFit.cover,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                      child: Container(
                                                                                                        width: 24.0,
                                                                                                        height: 24.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                                                        ),
                                                                                                        child: ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                          child: Image.asset(
                                                                                                            'assets/images/1901_N26_App_Icon-min.png',
                                                                                                            width: 300.0,
                                                                                                            height: 200.0,
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
                                                                                                      child: Container(
                                                                                                        width: 24.0,
                                                                                                        height: 24.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                                                        ),
                                                                                                        child: ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                          child: Image.asset(
                                                                                                            'assets/images/unnamed-min.png',
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
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'ldfmqs7a' /* Add another account */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Inter',
                                                                                                        color: FlutterFlowTheme.of(context).greyDark,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 13.0)),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 24.0,
                                                                                            height: 24.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: SvgPicture.asset(
                                                                                                'assets/images/Chevron_Right.svg',
                                                                                                width: 300.0,
                                                                                                height: 200.0,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 12.0)),
                                                                        ),
                                                                      ).animateOnPageLoad(
                                                                          animationsMap[
                                                                              'containerOnPageLoadAnimation1']!),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          12.0)),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 12.0)),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 16.0)),
                                              ),
                                            ),
                                            if (homePageCheckLimitResponse
                                                .succeeded)
                                              FutureBuilder<ApiCallResponse>(
                                                future: LoanManagementGroup
                                                    .allUserinstallmentsCall
                                                    .call(
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
                                                  final upcomingPaymentsAllUserinstallmentsResponse =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
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
                                                                      'knu9sowp' /* Upcoming Payments */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context.pushNamed(
                                                                      'payScreenDefault');
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .greyLine,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            6.0,
                                                                            12.0,
                                                                            8.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'vk1p56bs' /* View more */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        if (upcomingPaymentsAllUserinstallmentsResponse
                                                                .statusCode
                                                                .toString() ==
                                                            '404')
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyLine,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          46.0,
                                                                          20.0,
                                                                          46.0,
                                                                          21.0),
                                                              child: Wrap(
                                                                spacing: 0.0,
                                                                runSpacing: 0.0,
                                                                alignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    WrapCrossAlignment
                                                                        .start,
                                                                direction: Axis
                                                                    .horizontal,
                                                                runAlignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                verticalDirection:
                                                                    VerticalDirection
                                                                        .down,
                                                                clipBehavior:
                                                                    Clip.none,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ym1pqwyp' /* You don’t have any upcoming pa... */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).greyGrey,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Visibility(
                                                            visible:
                                                                upcomingPaymentsAllUserinstallmentsResponse
                                                                    .succeeded,
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final test =
                                                                    getJsonField(
                                                                  upcomingPaymentsAllUserinstallmentsResponse
                                                                      .jsonBody,
                                                                  r'''$.installments''',
                                                                ).toList();
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: List
                                                                      .generate(
                                                                          test.length,
                                                                          (testIndex) {
                                                                    final testItem =
                                                                        test[
                                                                            testIndex];
                                                                    return InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        if ((String
                                                                            var1) {
                                                                          return var1
                                                                              .contains("payments");
                                                                        }(getJsonField(
                                                                          testItem,
                                                                          r'''$''',
                                                                        ).toString())) {
                                                                          setState(
                                                                              () {
                                                                            FFAppState().installmentid =
                                                                                getJsonField(
                                                                              testItem,
                                                                              r'''$.installment_id''',
                                                                            ).toString();
                                                                          });

                                                                          context
                                                                              .pushNamed('loanPreview');
                                                                        } else {
                                                                          setState(
                                                                              () {
                                                                            FFAppState().paymentid =
                                                                                getJsonField(
                                                                              testItem,
                                                                              r'''$.payment_id''',
                                                                            ).toString();
                                                                          });

                                                                          context
                                                                              .pushNamed('paydayPreview');
                                                                        }
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).greyLine,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              12.0,
                                                                              16.0,
                                                                              15.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Container(
                                                                                width: 120.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      children: [
                                                                                        RichText(
                                                                                          textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                                                                          text: TextSpan(
                                                                                            children: [
                                                                                              TextSpan(
                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                  'nikh8gqy' /* Payment  */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: FlutterFlowTheme.of(context).greyDark,
                                                                                                    ),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: testIndex.toString(),
                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: FlutterFlowTheme.of(context).greyDark,
                                                                                                    ),
                                                                                              )
                                                                                            ],
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          (String var1) {
                                                                                            return var1.contains("payments");
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
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).greyGrey,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 6.0)),
                                                                                ),
                                                                              ),
                                                                              if ((String var1) {
                                                                                return var1.contains("payments");
                                                                              }(getJsonField(
                                                                                testItem,
                                                                                r'''$''',
                                                                              ).toString()))
                                                                                Container(
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 6.0,
                                                                                        height: 6.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: valueOrDefault<Color>(
                                                                                            () {
                                                                                              if (getJsonField(
                                                                                                testItem,
                                                                                                r'''$.payments[0].paid''',
                                                                                              )) {
                                                                                                return FlutterFlowTheme.of(context).brandMedium;
                                                                                              } else if ((String var1) {
                                                                                                return var1 == 'failed';
                                                                                              }(getJsonField(
                                                                                                testItem,
                                                                                                r'''$.payments[0].status''',
                                                                                              ).toString())) {
                                                                                                return FlutterFlowTheme.of(context).error;
                                                                                              } else {
                                                                                                return FlutterFlowTheme.of(context).greyLine;
                                                                                              }
                                                                                            }(),
                                                                                            FlutterFlowTheme.of(context).greyLine,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        width: 6.0,
                                                                                        height: 6.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: valueOrDefault<Color>(
                                                                                            () {
                                                                                              if (getJsonField(
                                                                                                testItem,
                                                                                                r'''$.payments[1].paid''',
                                                                                              )) {
                                                                                                return FlutterFlowTheme.of(context).brandMedium;
                                                                                              } else if ((String var1) {
                                                                                                return var1 == 'failed';
                                                                                              }(getJsonField(
                                                                                                testItem,
                                                                                                r'''$.payments[1].status''',
                                                                                              ).toString())) {
                                                                                                return FlutterFlowTheme.of(context).error;
                                                                                              } else {
                                                                                                return FlutterFlowTheme.of(context).greyLine;
                                                                                              }
                                                                                            }(),
                                                                                            FlutterFlowTheme.of(context).greyLine,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        width: 6.0,
                                                                                        height: 6.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: valueOrDefault<Color>(
                                                                                            () {
                                                                                              if (getJsonField(
                                                                                                testItem,
                                                                                                r'''$.payments[2].paid''',
                                                                                              )) {
                                                                                                return FlutterFlowTheme.of(context).brandMedium;
                                                                                              } else if ((String var1) {
                                                                                                return var1 == 'failed';
                                                                                              }(getJsonField(
                                                                                                testItem,
                                                                                                r'''$.payments[2].status''',
                                                                                              ).toString())) {
                                                                                                return FlutterFlowTheme.of(context).error;
                                                                                              } else {
                                                                                                return FlutterFlowTheme.of(context).greyLine;
                                                                                              }
                                                                                            }(),
                                                                                            FlutterFlowTheme.of(context).greyLine,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        width: 6.0,
                                                                                        height: 6.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: () {
                                                                                            if (getJsonField(
                                                                                              testItem,
                                                                                              r'''$.payments[3].paid''',
                                                                                            )) {
                                                                                              return FlutterFlowTheme.of(context).brandMedium;
                                                                                            } else if ((String var1) {
                                                                                              return var1 == 'failed';
                                                                                            }(getJsonField(
                                                                                              testItem,
                                                                                              r'''$.payments[3].status''',
                                                                                            ).toString())) {
                                                                                              return FlutterFlowTheme.of(context).error;
                                                                                            } else {
                                                                                              return FlutterFlowTheme.of(context).greyLine;
                                                                                            }
                                                                                          }(),
                                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 8.0)),
                                                                                  ),
                                                                                ),
                                                                              Container(
                                                                                width: 120.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      children: [
                                                                                        RichText(
                                                                                          textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                                                                          text: TextSpan(
                                                                                            children: [
                                                                                              TextSpan(
                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                  '4l9kmjq0' /* € */,
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
                                                                                                style: TextStyle(),
                                                                                              )
                                                                                            ],
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).daBlack900,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      children: [
                                                                                        Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '8glnndbx' /* Remaining */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).greyGrey,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 6.0)),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }).divide(SizedBox(
                                                                      height:
                                                                          12.0)),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 19.0)),
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation2']!);
                                                },
                                              ),
                                          ].divide(SizedBox(height: 35.0)),
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 40.0))
                                      .addToEnd(SizedBox(height: 128.0)),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 36.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 88.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).greyLight,
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).greyLine,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        40.0, 10.0, 40.0, 21.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 25.0,
                                                height: 24.0,
                                                decoration: BoxDecoration(),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: SvgPicture.network(
                                                    'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/home-selected.svg',
                                                    width: 300.0,
                                                    height: 200.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '3rxxe4vn' /* Home */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .greyDark,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (getJsonField(
                                              columnChecksubscriptionResponse
                                                  .jsonBody,
                                              r'''$.is_member''',
                                            )) {
                                              context
                                                  .pushNamed('borrowOptions');

                                              if (!getJsonField(
                                                homePageCheckLimitResponse
                                                    .jsonBody,
                                                r'''$['funds_available']''',
                                              )) {
                                                context.pushNamed(
                                                    'reachedMaximum');
                                              }
                                            } else {
                                              _model.getDataCancelledCopy =
                                                  await SupabaseGroup
                                                      .getDataCall
                                                      .call(
                                                tableName: 'memberships',
                                                fields: 'cancelled',
                                                filterVariable: currentUserUid,
                                                filterName: 'user_id',
                                              );
                                              if (getJsonField(
                                                (_model.getDataCancelled
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$[0].cancelled''',
                                              )) {
                                                context.pushNamed(
                                                    'membershipBannerResubscribe');
                                              }
                                            }

                                            setState(() {});
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 25.0,
                                                  height: 24.0,
                                                  decoration: BoxDecoration(),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: SvgPicture.network(
                                                      'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Borrow.svg',
                                                      width: 300.0,
                                                      height: 200.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '4qqblr73' /* Borrow */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
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
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.goNamed('limitDefault');
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 25.0,
                                                  height: 24.0,
                                                  decoration: BoxDecoration(),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: SvgPicture.network(
                                                      'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Limit%20inactive.svg',
                                                      width: 300.0,
                                                      height: 200.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'hu97uzz5' /* Limit */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
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
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.goNamed('accountDefault');
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 25.0,
                                                  height: 24.0,
                                                  decoration: BoxDecoration(),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: SvgPicture.network(
                                                      'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/user-02-unselected.svg',
                                                      width: 300.0,
                                                      height: 200.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '3gnwqphy' /* Profile */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
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
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 40.0)),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
