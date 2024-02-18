import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'welcome_model.dart';
export 'welcome_model.dart';

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({Key? key}) : super(key: key);

  @override
  _WelcomeWidgetState createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  late WelcomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {
          await actions.statusDynamic(
            context,
          );
        }(),
      );
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
                  if (_model.carouselStep == 1)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          _model.carouselStep = 2;
                        });
                      },
                      child: Container(
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
                                  Container(
                                    width: 108.0,
                                    height: 2.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .greyLight,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 6.0,
                                          color: FlutterFlowTheme.of(context)
                                              .greyLight,
                                          offset: Offset(0.0, 0.0),
                                        )
                                      ],
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.2,
                                    child: Container(
                                      width: 108.0,
                                      height: 2.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .greyLight,
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.2,
                                    child: Container(
                                      width: 108.0,
                                      height: 2.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .greyLight,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          Opacity(
                                            opacity: 0.3,
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
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
                                            alignment:
                                                AlignmentDirectional(0.05, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/percent.png',
                                                width: 204.0,
                                                height: 204.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              height: 200.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '8xos3obn' /* No Interest rate */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Rajdhani',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greyLight,
                                                lineHeight: 1.0,
                                              ),
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
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'fshd2y22' /* Tight on cash and tired of ask... */,
                                              ),
                                              textAlign: TextAlign.center,
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
                                      ].divide(SizedBox(height: 12.0)),
                                    ),
                                  ].divide(SizedBox(height: 44.0)),
                                ),
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 138.0))
                              .addToStart(SizedBox(height: 28.0)),
                        ),
                      ),
                    ),
                  if (_model.carouselStep == 2)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          _model.carouselStep = 3;
                        });
                      },
                      child: Container(
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
                                  Opacity(
                                    opacity: 0.2,
                                    child: Container(
                                      width: 108.0,
                                      height: 2.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .greyLight,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 108.0,
                                    height: 2.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .greyLight,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 6.0,
                                          color: FlutterFlowTheme.of(context)
                                              .greyLight,
                                          offset: Offset(0.0, 0.0),
                                        )
                                      ],
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.2,
                                    child: Container(
                                      width: 108.0,
                                      height: 2.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .greyLight,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          Opacity(
                                            opacity: 0.3,
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
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
                                            alignment:
                                                AlignmentDirectional(0.05, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/contract.png',
                                                width: 204.0,
                                                height: 204.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              height: 200.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '6wd27x4g' /* No credit checks */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Rajdhani',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greyLight,
                                                lineHeight: 1.0,
                                              ),
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
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ln1xr61p' /* Get cash within 5 minutes* of ... */,
                                              ),
                                              textAlign: TextAlign.center,
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
                                      ].divide(SizedBox(height: 12.0)),
                                    ),
                                  ].divide(SizedBox(height: 44.0)),
                                ),
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 138.0))
                              .addToStart(SizedBox(height: 28.0)),
                        ),
                      ),
                    ),
                  if (_model.carouselStep == 3)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          _model.carouselStep = 1;
                        });
                      },
                      child: Container(
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
                                  Opacity(
                                    opacity: 0.2,
                                    child: Container(
                                      width: 108.0,
                                      height: 2.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .greyLight,
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.2,
                                    child: Container(
                                      width: 108.0,
                                      height: 2.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .greyLight,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 108.0,
                                    height: 2.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .greyLight,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 6.0,
                                          color: FlutterFlowTheme.of(context)
                                              .greyLight,
                                          offset: Offset(0.0, 0.0),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          Opacity(
                                            opacity: 0.3,
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
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
                                            alignment:
                                                AlignmentDirectional(0.05, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/euro.png',
                                                width: 204.0,
                                                height: 204.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              height: 200.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '5kp3ief1' /* Borrow up to 500€ */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Rajdhani',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greyLight,
                                                lineHeight: 1.0,
                                              ),
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
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'w626ksps' /* Need extra cash to make it to ... */,
                                              ),
                                              textAlign: TextAlign.center,
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
                                      ].divide(SizedBox(height: 12.0)),
                                    ),
                                  ].divide(SizedBox(height: 44.0)),
                                ),
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 138.0))
                              .addToStart(SizedBox(height: 28.0)),
                        ),
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 66.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('signup');
                              },
                              child: Container(
                                width: 165.0,
                                height: 44.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).greyLight,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'toghbprz' /* Sign up */,
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
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('login');
                              },
                              child: Container(
                                width: 165.0,
                                height: 44.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).lineBlack,
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'bhu1aax7' /* Log in */,
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
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ].divide(SizedBox(height: 16.0)),
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
