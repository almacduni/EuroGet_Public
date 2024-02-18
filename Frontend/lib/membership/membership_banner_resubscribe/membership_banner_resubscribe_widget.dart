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
import 'membership_banner_resubscribe_model.dart';
export 'membership_banner_resubscribe_model.dart';

class MembershipBannerResubscribeWidget extends StatefulWidget {
  const MembershipBannerResubscribeWidget({Key? key}) : super(key: key);

  @override
  _MembershipBannerResubscribeWidgetState createState() =>
      _MembershipBannerResubscribeWidgetState();
}

class _MembershipBannerResubscribeWidgetState
    extends State<MembershipBannerResubscribeWidget> {
  late MembershipBannerResubscribeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MembershipBannerResubscribeModel());
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
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
                                context.pushNamed('HomePage');
                              },
                              child: Container(
                                width: 24.0,
                                height: 24.0,
                                decoration: BoxDecoration(),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: SvgPicture.asset(
                                    'assets/images/Close.svg',
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
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'k8pnxwtu' /* Unlock 500€  for just 9.99€! */,
                                        ),
                                        textAlign: TextAlign.center,
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
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '5ebcanx4' /* Prices may rise for re-subscri... */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 20.0, 0.0, 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 24.0,
                                            height: 24.0,
                                            decoration: BoxDecoration(),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/heck-circle-min.png',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '2bp24mng' /* No credit checks */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .greyLight,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(width: 10.0)),
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 16.0, 0.0, 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 24.0,
                                            height: 24.0,
                                            decoration: BoxDecoration(),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/heck-circle-min.png',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'c3ewd7k8' /* No interest  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .greyLight,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(width: 10.0)),
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 16.0, 0.0, 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 24.0,
                                            height: 24.0,
                                            decoration: BoxDecoration(),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/heck-circle-min.png',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'hl94gntn' /* 1 month free trial */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .greyLight,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(width: 10.0)),
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 16.0, 0.0, 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 24.0,
                                            height: 24.0,
                                            decoration: BoxDecoration(),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/heck-circle-min.png',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'hs9myo45' /* Borrow up to 500€ */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .greyLight,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(width: 10.0)),
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 16.0, 0.0, 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 24.0,
                                            height: 24.0,
                                            decoration: BoxDecoration(),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/heck-circle-min.png',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '4hfacd2o' /* AI overdraft protection */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .greyLight,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(width: 10.0)),
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 16.0, 0.0, 20.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 24.0,
                                            height: 24.0,
                                            decoration: BoxDecoration(),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/heck-circle-min.png',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'b3uzvf0g' /* 24/5 support */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .greyLight,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ].divide(SizedBox(height: 32.0)),
                        ),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            setState(() {
                              _model.loading = true;
                            });
                            _model.getData =
                                await SupabaseGroup.getDataCall.call(
                              tableName: 'gc_payment_users',
                              fields: 'p_mandate_id',
                              filterVariable: currentUserUid,
                              filterName: 'user_id',
                            );
                            setState(() {
                              FFAppState().mandateID = getJsonField(
                                (_model.getData?.jsonBody ?? ''),
                                r'''$[0].p_mandate_id''',
                              ).toString();
                            });

                            context.pushNamed('membershipOptionsResubscribe');

                            setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'f7fw0v6o' /* Get started */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 44.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Rajdhani',
                                  color: FlutterFlowTheme.of(context).greyDark,
                                ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'rwoypxi3' /* Auto-renewable. Cancel anytime... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color:
                                        FlutterFlowTheme.of(context).daBlack200,
                                  ),
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 20.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
