import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notifications_default_model.dart';
export 'notifications_default_model.dart';

class NotificationsDefaultWidget extends StatefulWidget {
  const NotificationsDefaultWidget({Key? key}) : super(key: key);

  @override
  _NotificationsDefaultWidgetState createState() =>
      _NotificationsDefaultWidgetState();
}

class _NotificationsDefaultWidgetState
    extends State<NotificationsDefaultWidget> {
  late NotificationsDefaultModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsDefaultModel());
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
                                    child: SvgPicture.network(
                                      'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Arrow%20left%20(1).svg',
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 48.0, 0.0, 0.0),
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
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '4iv42mbd' /* Notifications */,
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
                                    ].divide(SizedBox(height: 40.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 40.0, 0.0, 0.0),
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
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'h23qestu' /* Today */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
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
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 16.0,
                                                          16.0, 21.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                                  'dljperj9' /* Fancy */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium,
                                                              ),
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'wktpy8fw' /* $200 */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium,
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 4.0)),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '81bg1guo' /* Yesterday */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
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
                                                        ],
                                                      ),
                                                      Wrap(
                                                        spacing: 0.0,
                                                        runSpacing: 0.0,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                        direction:
                                                            Axis.horizontal,
                                                        runAlignment:
                                                            WrapAlignment.start,
                                                        verticalDirection:
                                                            VerticalDirection
                                                                .down,
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'uhzfh5te' /* A grace period is a period imm... */,
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
                                                        SizedBox(height: 6.0)),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 12.0)),
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
                      ],
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
