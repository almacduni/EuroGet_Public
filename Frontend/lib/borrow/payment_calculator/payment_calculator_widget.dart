import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_calculator_model.dart';
export 'payment_calculator_model.dart';

class PaymentCalculatorWidget extends StatefulWidget {
  const PaymentCalculatorWidget({Key? key}) : super(key: key);

  @override
  _PaymentCalculatorWidgetState createState() =>
      _PaymentCalculatorWidgetState();
}

class _PaymentCalculatorWidgetState extends State<PaymentCalculatorWidget> {
  late PaymentCalculatorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentCalculatorModel());
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
        final paymentCalculatorCheckLimitResponse = snapshot.data!;
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
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
                                          setState(() {
                                            FFAppState().sliderValue = 0;
                                          });
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
                                              'ovp57nkh' /* Payment calculator */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Rajdhani',
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
                                              'ibkn65j7' /* Use the slider to estimate you... */,
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
                              ]
                                  .divide(SizedBox(height: 48.0))
                                  .addToStart(SizedBox(height: 28.0)),
                            ),
                          ),
                          if (paymentCalculatorCheckLimitResponse.succeeded)
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 24.0, 16.0, 15.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    RichText(
                                                      textScaleFactor:
                                                          MediaQuery.of(context)
                                                              .textScaleFactor,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '3diguxgk' /* € */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Rajdhani',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .daBlack900,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text: FFAppState()
                                                                        .sliderValue !=
                                                                    0
                                                                ? FFAppState()
                                                                    .sliderValue
                                                                    .toString()
                                                                : (getJsonField(
                                                                          paymentCalculatorCheckLimitResponse
                                                                              .jsonBody,
                                                                          r'''$.loan_available''',
                                                                        ) ~/
                                                                        2)
                                                                    .toString(),
                                                            style: TextStyle(),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Rajdhani',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .daBlack900,
                                                                  lineHeight:
                                                                      1.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
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
                                                        'dzwz7jjg' /* Hello World */,
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
                                                  ],
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 47.0,
                                            decoration: BoxDecoration(),
                                            child: Container(
                                              width: double.infinity,
                                              height: 200.0,
                                              child:
                                                  custom_widgets.CustomSlider(
                                                width: double.infinity,
                                                height: 200.0,
                                                min: 1,
                                                max: getJsonField(
                                                  paymentCalculatorCheckLimitResponse
                                                      .jsonBody,
                                                  r'''$.loan_available''',
                                                ),
                                                initialValue:
                                                    valueOrDefault<int>(
                                                  getJsonField(
                                                        paymentCalculatorCheckLimitResponse
                                                            .jsonBody,
                                                        r'''$.loan_available''',
                                                      ) ~/
                                                      2,
                                                  50,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 1.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).greyLine,
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'bxgzlsxc' /* Payment plan */,
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
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '4li33czt' /* Pay in 4 */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .greyGrey,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
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
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 72.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .greyBG,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 14.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: SvgPicture
                                                                .network(
                                                              'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Frame%201321320917.svg',
                                                              width: 300.0,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
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
                                                                            '4ibxtosw' /* € */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).greyDark,
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              formatNumber(
                                                                            FFAppState().sliderValue ~/
                                                                                4,
                                                                            formatType:
                                                                                FormatType.custom,
                                                                            format:
                                                                                '##',
                                                                            locale:
                                                                                '',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).greyDark,
                                                                              ),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
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
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'num9s1it' /* Today */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
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
                                                                height: 4.0)),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 12.0)),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 72.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .greyBG,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                2.0, 14.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: SvgPicture
                                                                .network(
                                                              'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Frame%201321320917%202.svg',
                                                              width: 300.0,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
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
                                                                            '4dfy907m' /* € */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).greyDark,
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              formatNumber(
                                                                            FFAppState().sliderValue ~/
                                                                                4,
                                                                            formatType:
                                                                                FormatType.custom,
                                                                            format:
                                                                                '##',
                                                                            locale:
                                                                                '',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).greyDark,
                                                                              ),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
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
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'pdcxi4pd' /* In 2 weeks */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
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
                                                                height: 4.0)),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 12.0)),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 72.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .greyBG,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 14.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: SvgPicture
                                                                .network(
                                                              'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Frame%201321320917%203.svg',
                                                              width: 300.0,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
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
                                                                            'g5ebvxdg' /* € */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).greyDark,
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              formatNumber(
                                                                            FFAppState().sliderValue ~/
                                                                                4,
                                                                            formatType:
                                                                                FormatType.custom,
                                                                            format:
                                                                                '##',
                                                                            locale:
                                                                                '',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).greyDark,
                                                                              ),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
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
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'emcsur4a' /* In 4 weeks */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
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
                                                                height: 4.0)),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 12.0)),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 72.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .greyBG,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 14.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: SvgPicture
                                                                .network(
                                                              'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Frame%201321320917%204.svg',
                                                              width: 300.0,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
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
                                                                            'isbnh09r' /* € */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).greyDark,
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              formatNumber(
                                                                            FFAppState().sliderValue ~/
                                                                                4,
                                                                            formatType:
                                                                                FormatType.custom,
                                                                            format:
                                                                                '##',
                                                                            locale:
                                                                                '',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).greyDark,
                                                                              ),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
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
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'rkzj31xg' /* In 6 weeks */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
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
                                                                height: 4.0)),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 12.0)),
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                                                  '3zsql0l5' /* No interest */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .greyGrey,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ]
                            .divide(SizedBox(height: 40.0))
                            .addToEnd(SizedBox(height: 40.0)),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.getStatus =
                              await SupabaseGroup.getDataCall.call(
                            tableName: 'statuses',
                            fields: '*',
                            filterVariable: '1',
                            filterName: 'id',
                          );
                          if (getJsonField(
                            (_model.getStatus?.jsonBody ?? ''),
                            r'''$[0].run_out_cash''',
                          )) {
                            context.pushNamed('cantServeYouATM');
                          } else {
                            context.pushNamed('borrowCheckout');

                            setState(() {
                              FFAppState().sliderValue =
                                  FFAppState().sliderValue != 0
                                      ? FFAppState().sliderValue
                                      : (getJsonField(
                                            paymentCalculatorCheckLimitResponse
                                                .jsonBody,
                                            r'''$.loan_available''',
                                          ) ~/
                                          2);
                              FFAppState().loanType = 'installment';
                              FFAppState().loanChargeDate = '2023-11-15';
                            });
                          }

                          setState(() {});
                        },
                        child: Container(
                          width: double.infinity,
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).greyDark,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'v3ul775e' /* Continue */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Rajdhani',
                                      color: FlutterFlowTheme.of(context)
                                          .greyLight,
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
          ),
        );
      },
    );
  }
}
