import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'limitpage_update_step0_model.dart';
export 'limitpage_update_step0_model.dart';

class LimitpageUpdateStep0Widget extends StatefulWidget {
  const LimitpageUpdateStep0Widget({Key? key}) : super(key: key);

  @override
  _LimitpageUpdateStep0WidgetState createState() =>
      _LimitpageUpdateStep0WidgetState();
}

class _LimitpageUpdateStep0WidgetState
    extends State<LimitpageUpdateStep0Widget> {
  late LimitpageUpdateStep0Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LimitpageUpdateStep0Model());
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                    child: SvgPicture.network(
                                      'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Arrow%20left.svg',
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  height: 2.0,
                                  decoration: BoxDecoration(),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Opacity(
                                        opacity: 0.2,
                                        child: Container(
                                          width: 16.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .greyLight,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 16.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .greyLight,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 6.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .greyLight,
                                              offset: Offset(0.0, 0.0),
                                            )
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 10.0)),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 127.0)),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
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
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
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
                                          'assets/images/wallet.png',
                                          width: 147.0,
                                          height: 147.0,
                                          fit: BoxFit.cover,
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
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'bpoup6iu' /* Select the boundary for replen... */,
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
                                  ].divide(SizedBox(height: 12.0)),
                                ),
                              ),
                            ].divide(SizedBox(height: 32.0)),
                          ),
                        ),
                      ].divide(SizedBox(height: 40.0)),
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
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().overdraftimit = 100;
                              });

                              context.pushNamed('Limitpage_step1');
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      FFAppState().overdraftimit = 1000;
                                    });

                                    context.pushNamed('Limitpage_step1');
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .greyLine,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 24.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'c4obscqh' /* €1000 */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Rajdhani',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .greyLight,
                                                ),
                                          ),
                                        ],
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
                                    setState(() {
                                      FFAppState().overdraftimit = 500;
                                    });

                                    context.pushNamed('Limitpage_step1');
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .greyLine,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 24.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '67zw591o' /* €500 */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Rajdhani',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .greyLight,
                                                ),
                                          ),
                                        ],
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
                                    setState(() {
                                      FFAppState().overdraftimit = 250;
                                    });

                                    context.pushNamed('Limitpage_step1');
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .greyLine,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 24.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'y9pqpzi3' /* €250 */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Rajdhani',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .greyLight,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).greyLine,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 24.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'x59pur3e' /* €100 */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
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
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.overdraftProttectionCancel =
                                await OverdraftprotectionGroup
                                    .overdraftprotectionCall
                                    .call(
                              userId: currentUserUid,
                              balanceLimit: 0,
                              optInStatus: false,
                              desiredSum: 0,
                            );
                            if ((_model.overdraftProttectionCancel?.succeeded ??
                                true)) {
                              context.pushNamed('limitDefault');
                            } else {
                              context.pushNamed('limitError');
                            }

                            setState(() {});
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'imf204zc' /* Stop auto advance */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .brandLight,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ].divide(SizedBox(height: 28.0)),
                    ),
                  ),
                ].divide(SizedBox(height: 40.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
