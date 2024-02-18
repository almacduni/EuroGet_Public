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
import 'kyc_s_d_k_model.dart';
export 'kyc_s_d_k_model.dart';

class KycSDKWidget extends StatefulWidget {
  const KycSDKWidget({Key? key}) : super(key: key);

  @override
  _KycSDKWidgetState createState() => _KycSDKWidgetState();
}

class _KycSDKWidgetState extends State<KycSDKWidget> {
  late KycSDKModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KycSDKModel());

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
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'iaso2wxx' /* Please complete the KYC proces... */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Rajdhani',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'i9bhdg49' /* In order to get a cash advance... */,
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
                                  ),
                                ].divide(SizedBox(height: 40.0)),
                              ),
                            ),
                          ].divide(SizedBox(height: 56.0)),
                        ),
                      ),
                    ].divide(SizedBox(height: 244.0)),
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
                                    'kc5ar1uf' /* Get Link */,
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
