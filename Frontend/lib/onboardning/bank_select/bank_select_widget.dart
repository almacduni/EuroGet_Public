import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bank_select_model.dart';
export 'bank_select_model.dart';

class BankSelectWidget extends StatefulWidget {
  const BankSelectWidget({Key? key}) : super(key: key);

  @override
  _BankSelectWidgetState createState() => _BankSelectWidgetState();
}

class _BankSelectWidgetState extends State<BankSelectWidget> {
  late BankSelectModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BankSelectModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultav3 =
          await SupabaseGroup.updateOnboardingPersistenceCall.call(
        status: 'ongoing',
        step: 7,
        userId: currentUserUid,
        pageRoute: 'bankSelect',
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
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('countrySelect');
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '6u44plwn' /* Select your bank */,
                                      ),
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
                            ),
                          ].divide(SizedBox(height: 48.0)),
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
                              child: FutureBuilder<ApiCallResponse>(
                                future: BankSearchGroup.institutionsCall.call(
                                  country: FFAppState().countryCode,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final listViewInstitutionsResponse =
                                      snapshot.data!;
                                  return Builder(
                                    builder: (context) {
                                      final banks = getJsonField(
                                        listViewInstitutionsResponse.jsonBody,
                                        r'''$[*]''',
                                      ).toList();
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: banks.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 12.0),
                                        itemBuilder: (context, banksIndex) {
                                          final banksItem = banks[banksIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                _model.loading = true;
                                              });
                                              _model.createAgreement =
                                                  await OpenBankingGroup
                                                      .createAgreementCall
                                                      .call(
                                                institutionId: getJsonField(
                                                  banksItem,
                                                  r'''$.id''',
                                                ).toString(),
                                                userId: currentUserUid,
                                              );
                                              _model.createLink =
                                                  await OpenBankingGroup
                                                      .createlLnkCall
                                                      .call(
                                                userId: currentUserUid,
                                                agreementId: getJsonField(
                                                  (_model.createAgreement
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.agreement_id''',
                                                ).toString(),
                                              );
                                              setState(() {
                                                FFAppState().bankLink =
                                                    getJsonField(
                                                  (_model.createLink
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.link''',
                                                ).toString();
                                                FFAppState().agreementid =
                                                    getJsonField(
                                                  (_model.createAgreement
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.agreement_id''',
                                                ).toString();
                                              });

                                              context.pushNamed(
                                                  'bankaccountConnect');

                                              setState(() {});
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineBlack,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 16.0, 0.0, 20.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 36.0,
                                                            height: 36.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100.0),
                                                              child:
                                                                  Image.network(
                                                                getJsonField(
                                                                  banksItem,
                                                                  r'''$.logo''',
                                                                ).toString(),
                                                                width: 300.0,
                                                                height: 200.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 260.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
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
                                                                  getJsonField(
                                                                    banksItem,
                                                                    r'''$.name''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .greyLight,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 13.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ].divide(SizedBox(height: 40.0)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
