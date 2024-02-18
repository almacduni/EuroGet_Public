import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'borrow_select_payday_model.dart';
export 'borrow_select_payday_model.dart';

class BorrowSelectPaydayWidget extends StatefulWidget {
  const BorrowSelectPaydayWidget({Key? key}) : super(key: key);

  @override
  _BorrowSelectPaydayWidgetState createState() =>
      _BorrowSelectPaydayWidgetState();
}

class _BorrowSelectPaydayWidgetState extends State<BorrowSelectPaydayWidget> {
  late BorrowSelectPaydayModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BorrowSelectPaydayModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.chargeDateController ??= TextEditingController();
    _model.chargeDateFocusNode ??= FocusNode();
    _model.chargeDateFocusNode!.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
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
        final borrowSelectPaydayCheckLimitResponse = snapshot.data!;
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
                                              'wzxsdv32' /* Choose next payday */,
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
                                              '4niun0c7' /* Select a date to align your pa... */,
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
                          if (!(isWeb
                              ? MediaQuery.viewInsetsOf(context).bottom > 0
                              : _isKeyboardVisible))
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).greyLine,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 24.0, 16.0, 33.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
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
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '4hjwqile' /* € */,
                                                      ),
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
                                                                    borrowSelectPaydayCheckLimitResponse
                                                                        .jsonBody,
                                                                    r'''$.loan_available''',
                                                                  ) ~/
                                                                  2)
                                                              .toString(),
                                                      style: TextStyle(),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Rajdhani',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .daBlack900,
                                                        lineHeight: 1.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'njt7y4rx' /* Hello World */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                        child: custom_widgets.CustomSlider(
                                          width: double.infinity,
                                          height: 200.0,
                                          min: 1,
                                          max: getJsonField(
                                            borrowSelectPaydayCheckLimitResponse
                                                .jsonBody,
                                            r'''$.loan_available''',
                                          ),
                                          initialValue: valueOrDefault<int>(
                                            getJsonField(
                                                  borrowSelectPaydayCheckLimitResponse
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).greyLine,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 21.0),
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
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    width: 311.0,
                                                    height: 36.0,
                                                    decoration: BoxDecoration(),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .chargeDateController,
                                                      focusNode: _model
                                                          .chargeDateFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.chargeDateController',
                                                        Duration(
                                                            milliseconds: 300),
                                                        () => setState(() {}),
                                                      ),
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        alignLabelWithHint:
                                                            false,
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'zj4sr9jm' /* DD.MM.YYYY */,
                                                        ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Rajdhani',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .greyDark,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .displaySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Rajdhani',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyDark,
                                                              ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      validator: _model
                                                          .chargeDateControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        _model.chargeDateMask
                                                      ],
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
                                                        'rxv34a8j' /* The day of the next paycheck */,
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
                                              ].divide(SizedBox(height: 8.0)),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Theme(
                                          data: ThemeData(
                                            checkboxTheme: CheckboxThemeData(
                                              visualDensity:
                                                  VisualDensity.compact,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                            ),
                                            unselectedWidgetColor:
                                                FlutterFlowTheme.of(context)
                                                    .greyLine,
                                          ),
                                          child: Checkbox(
                                            value: _model.checkboxValue ??=
                                                true,
                                            onChanged: (newValue) async {
                                              setState(() => _model
                                                  .checkboxValue = newValue!);
                                            },
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .greyLine,
                                            checkColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'l24mrg9u' /* Remember my choise */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ].divide(SizedBox(height: 46.0)),
                              ),
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
                            _model.validateDate =
                                await actions.validateFutureDate(
                              _model.chargeDateController.text,
                            );
                            if (_model.validateDate!) {
                              _model.atleast7days =
                                  await actions.isDateAtLeast7DaysAhead(
                                _model.chargeDateController.text,
                              );
                              if (_model.atleast7days!) {
                                context.pushNamed('borrowCheckout');

                                setState(() {
                                  FFAppState().sliderValue =
                                      FFAppState().sliderValue != 0
                                          ? FFAppState().sliderValue
                                          : (getJsonField(
                                                borrowSelectPaydayCheckLimitResponse
                                                    .jsonBody,
                                                r'''$.loan_available''',
                                              ) ~/
                                              2);
                                  FFAppState().loanType = 'payday_loan';
                                  FFAppState().loanChargeDate =
                                      functions.convertDateFormat(
                                          _model.chargeDateController.text)!;
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'The date must be at least 7 days from now',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .greyLight,
                                          ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).greyDark,
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'The date must be in the future',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .greyLight,
                                        ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).greyDark,
                                ),
                              );
                            }
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
                                  'e9lnft4d' /* Continue */,
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
