import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'kyc_errorred_model.dart';
export 'kyc_errorred_model.dart';

class KycErrorredWidget extends StatefulWidget {
  const KycErrorredWidget({Key? key}) : super(key: key);

  @override
  _KycErrorredWidgetState createState() => _KycErrorredWidgetState();
}

class _KycErrorredWidgetState extends State<KycErrorredWidget> {
  late KycErrorredModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KycErrorredModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.supaRealtime(
        context,
        'kyc_data',
        currentUserUid,
      );
      unawaited(
        () async {
          await actions.openInAppBrowser(
            FFAppState().kycLink,
          );
        }(),
      );
      _model.apiResultav3 =
          await SupabaseGroup.updateOnboardingPersistenceCall.call(
        status: 'ongoing',
        step: 1,
        userId: currentUserUid,
        pageRoute: 'kycSDK',
        completed: false,
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
                            EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
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
                                context.goNamed('step0Banner');
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: SvgPicture.network(
                                  'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Arrow%20left.svg',
                                  width: 24.0,
                                  height: 24.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('accountSupport');
                              },
                              child: Container(
                                width: 24.0,
                                height: 24.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: SvgPicture.network(
                                    'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Support.svg',
                                    width: 24.0,
                                    height: 24.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ].divide(SizedBox(height: 244.0)),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
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
                                  alignment: AlignmentDirectional(0.0, 1.0),
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
                                alignment: AlignmentDirectional(0.05, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/umbrella.png',
                                    width: 204.0,
                                    height: 204.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Wrap(
                                spacing: 0.0,
                                runSpacing: 0.0,
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'b6be1kvv' /* We couldn't process your ident... */,
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
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Wrap(
                                spacing: 0.0,
                                runSpacing: 0.0,
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.center,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '3357uji9' /* Please try once again, if it d... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .greyGrey,
                                          lineHeight: 1.3,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ].divide(SizedBox(height: 44.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                  child: Container(
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
                            _model.updateLink =
                                await KycGroup.kyccreatekyclinkCall.call(
                              userId: currentUserUid,
                            );
                            setState(() {
                              FFAppState().kycLink = getJsonField(
                                (_model.updateLink?.jsonBody ?? ''),
                                r'''$.kyc_link''',
                              ).toString();
                            });
                            unawaited(
                              () async {
                                await actions.openInAppBrowser(
                                  FFAppState().kycLink,
                                );
                              }(),
                            );

                            setState(() {});
                          },
                          child: Container(
                            width: double.infinity,
                            height: 44.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).greyLight,
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '0zu1poz2' /* Try again */,
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
                      ].divide(SizedBox(height: 14.0)),
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
