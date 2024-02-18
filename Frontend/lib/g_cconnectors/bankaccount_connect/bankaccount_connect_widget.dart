import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
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
import 'bankaccount_connect_model.dart';
export 'bankaccount_connect_model.dart';

class BankaccountConnectWidget extends StatefulWidget {
  const BankaccountConnectWidget({Key? key}) : super(key: key);

  @override
  _BankaccountConnectWidgetState createState() =>
      _BankaccountConnectWidgetState();
}

class _BankaccountConnectWidgetState extends State<BankaccountConnectWidget> {
  late BankaccountConnectModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BankaccountConnectModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.openInAppBrowser(
        FFAppState().bankLink,
      );
      _model.apiResultav3 =
          await SupabaseGroup.updateOnboardingPersistenceCall.call(
        status: 'ongoing',
        step: 8,
        userId: currentUserUid,
        pageRoute: 'bankaccountConnect',
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                                context.pushNamed('bankSelect');
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
                                                'xxf1m1fs' /* Please  finish connecting the ... */,
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
                                                '5sb34cq9' /* In order to get a cash advance... */,
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
                        FutureBuilder<List<GcBankConnectsRow>>(
                          future: GcBankConnectsTable().querySingleRow(
                            queryFn: (q) => q.eq(
                              'user_id',
                              currentUserUid,
                            ),
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
                            List<GcBankConnectsRow>
                                containerGcBankConnectsRowList = snapshot.data!;
                            final containerGcBankConnectsRow =
                                containerGcBankConnectsRowList.isNotEmpty
                                    ? containerGcBankConnectsRowList.first
                                    : null;
                            return Container(
                              width: double.infinity,
                              height: 44.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).greyLight,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  unawaited(
                                    () async {
                                      await actions.openInAppBrowser(
                                        containerGcBankConnectsRow!.link!,
                                      );
                                    }(),
                                  );
                                  _model.checkStatus = await OpenBankingGroup
                                      .gcobcheckstatusCall
                                      .call(
                                    requisitionId: FFAppState().requisitionid,
                                  );
                                  if ((String var1) {
                                    return var1 == "LN";
                                  }(getJsonField(
                                    (_model.checkStatus?.jsonBody ?? ''),
                                    r'''$.status''',
                                  ).toString())) {
                                    context.pushNamed('step3Banner');
                                  }

                                  setState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'ke9vu5vi' /* Next */,
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
                            );
                          },
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
