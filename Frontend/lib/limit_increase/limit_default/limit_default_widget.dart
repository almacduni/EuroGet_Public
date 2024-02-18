import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'limit_default_model.dart';
export 'limit_default_model.dart';

class LimitDefaultWidget extends StatefulWidget {
  const LimitDefaultWidget({Key? key}) : super(key: key);

  @override
  _LimitDefaultWidgetState createState() => _LimitDefaultWidgetState();
}

class _LimitDefaultWidgetState extends State<LimitDefaultWidget> {
  late LimitDefaultModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LimitDefaultModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.checkLimit = await LoanManagementGroup.checkLimitCall.call(
        userId: currentUserUid,
      );
      _model.checkSubscription =
          await MembershipGroup.checksubscriptionCall.call(
        userId: currentUserUid,
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
        backgroundColor: FlutterFlowTheme.of(context).greyLight,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                alignment: AlignmentDirectional(0.0, 1.0),
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: SupabaseGroup.getDataCall.call(
                          tableName: 'overdraft_protection',
                          fields: '*',
                          filterVariable: currentUserUid,
                          filterName: 'user_id',
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
                          final columnGetDataResponse = snapshot.data!;
                          return SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
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
                                        ],
                                      ),
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
                                                    'mawk8bvq' /* €100 through 6 back-to-back pa... */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                    '2hbr5u9s' /* Every installment is biweekly */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                    ]
                                        .divide(SizedBox(height: 48.0))
                                        .addToStart(SizedBox(height: 60.0)),
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
                                            FutureBuilder<ApiCallResponse>(
                                              future: LoanManagementGroup
                                                  .paymentsinarowCall
                                                  .call(
                                                userId: currentUserUid,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final containerPaymentsinarowResponse =
                                                    snapshot.data!;
                                                return Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .greyLine,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      18.0,
                                                                      16.0,
                                                                      15.0),
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
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'qwftmedt' /* Pay on time 6 times in a row */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge,
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                24.0,
                                                                            height:
                                                                                24.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.network(
                                                                                getJsonField(
                                                                                  containerPaymentsinarowResponse.jsonBody,
                                                                                  r'''$.payment_status[0].confirmed''',
                                                                                )
                                                                                    ? 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Check.svg'
                                                                                    : 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Check%20grey.svg',
                                                                                width: 300.0,
                                                                                height: 200.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'qeg9t9a9' /* 1st */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: valueOrDefault<Color>(
                                                                                        getJsonField(
                                                                                          containerPaymentsinarowResponse.jsonBody,
                                                                                          r'''$.payment_status[0].confirmed''',
                                                                                        )
                                                                                            ? FlutterFlowTheme.of(context).brandDark
                                                                                            : FlutterFlowTheme.of(context).greyGrey,
                                                                                        FlutterFlowTheme.of(context).greyGrey,
                                                                                      ),
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ].divide(SizedBox(height: 8.0)),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                24.0,
                                                                            height:
                                                                                24.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.network(
                                                                                getJsonField(
                                                                                  containerPaymentsinarowResponse.jsonBody,
                                                                                  r'''$.payment_status[1].confirmed''',
                                                                                )
                                                                                    ? 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Check.svg'
                                                                                    : 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Check%20grey.svg',
                                                                                width: 300.0,
                                                                                height: 200.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'gpgp7j8t' /* 2nd */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: valueOrDefault<Color>(
                                                                                        getJsonField(
                                                                                          containerPaymentsinarowResponse.jsonBody,
                                                                                          r'''$.payment_status[1].confirmed''',
                                                                                        )
                                                                                            ? FlutterFlowTheme.of(context).brandDark
                                                                                            : FlutterFlowTheme.of(context).greyGrey,
                                                                                        FlutterFlowTheme.of(context).greyGrey,
                                                                                      ),
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ].divide(SizedBox(height: 8.0)),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                24.0,
                                                                            height:
                                                                                24.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.network(
                                                                                getJsonField(
                                                                                  containerPaymentsinarowResponse.jsonBody,
                                                                                  r'''$.payment_status[2].confirmed''',
                                                                                )
                                                                                    ? 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Check.svg'
                                                                                    : 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Check%20grey.svg',
                                                                                width: 300.0,
                                                                                height: 200.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'nkccryp2' /* 3rd */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: valueOrDefault<Color>(
                                                                                        getJsonField(
                                                                                          containerPaymentsinarowResponse.jsonBody,
                                                                                          r'''$.payment_status[2].confirmed''',
                                                                                        )
                                                                                            ? FlutterFlowTheme.of(context).brandDark
                                                                                            : FlutterFlowTheme.of(context).greyGrey,
                                                                                        FlutterFlowTheme.of(context).greyGrey,
                                                                                      ),
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ].divide(SizedBox(height: 8.0)),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                24.0,
                                                                            height:
                                                                                24.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.network(
                                                                                getJsonField(
                                                                                  containerPaymentsinarowResponse.jsonBody,
                                                                                  r'''$.payment_status[3].confirmed''',
                                                                                )
                                                                                    ? 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Check.svg'
                                                                                    : 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Check%20grey.svg',
                                                                                width: 300.0,
                                                                                height: 200.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  't7hgr39i' /* 4th */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: valueOrDefault<Color>(
                                                                                        getJsonField(
                                                                                          containerPaymentsinarowResponse.jsonBody,
                                                                                          r'''$.payment_status[3].confirmed''',
                                                                                        )
                                                                                            ? FlutterFlowTheme.of(context).brandDark
                                                                                            : FlutterFlowTheme.of(context).greyGrey,
                                                                                        FlutterFlowTheme.of(context).greyGrey,
                                                                                      ),
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ].divide(SizedBox(height: 8.0)),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                24.0,
                                                                            height:
                                                                                24.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.network(
                                                                                getJsonField(
                                                                                  containerPaymentsinarowResponse.jsonBody,
                                                                                  r'''$.payment_status[4].confirmed''',
                                                                                )
                                                                                    ? 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Check.svg'
                                                                                    : 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Check%20grey.svg',
                                                                                width: 300.0,
                                                                                height: 200.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'jmth0k6f' /* 5th */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: valueOrDefault<Color>(
                                                                                        getJsonField(
                                                                                          containerPaymentsinarowResponse.jsonBody,
                                                                                          r'''$.payment_status[4].confirmed''',
                                                                                        )
                                                                                            ? FlutterFlowTheme.of(context).brandDark
                                                                                            : FlutterFlowTheme.of(context).greyGrey,
                                                                                        FlutterFlowTheme.of(context).greyGrey,
                                                                                      ),
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ].divide(SizedBox(height: 8.0)),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                24.0,
                                                                            height:
                                                                                24.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.network(
                                                                                getJsonField(
                                                                                  containerPaymentsinarowResponse.jsonBody,
                                                                                  r'''$.payment_status[5].confirmed''',
                                                                                )
                                                                                    ? 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Check.svg'
                                                                                    : 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Check%20grey.svg',
                                                                                width: 300.0,
                                                                                height: 200.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'ti49x8na' /* 6th */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: valueOrDefault<Color>(
                                                                                        getJsonField(
                                                                                          containerPaymentsinarowResponse.jsonBody,
                                                                                          r'''$.payment_status[5].confirmed''',
                                                                                        )
                                                                                            ? FlutterFlowTheme.of(context).brandDark
                                                                                            : FlutterFlowTheme.of(context).greyGrey,
                                                                                        FlutterFlowTheme.of(context).greyGrey,
                                                                                      ),
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ].divide(SizedBox(height: 8.0)),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 16.0)),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .greyLine,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      16.0,
                                                                      16.0,
                                                                      17.0),
                                                          child: Wrap(
                                                            spacing: 0.0,
                                                            runSpacing: 0.0,
                                                            alignment:
                                                                WrapAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                            direction:
                                                                Axis.horizontal,
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
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'inbf4x88' /* Stay on track to unlock your c... */,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
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
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                            if (((String var1) {
                                                  return var1 == '[]';
                                                }(getJsonField(
                                                  columnGetDataResponse
                                                      .jsonBody,
                                                  r'''$''',
                                                ).toString())) ||
                                                (getJsonField(
                                                      columnGetDataResponse
                                                          .jsonBody,
                                                      r'''$[0].opt_in_status''',
                                                    ) ==
                                                    false))
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .greyBG,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 24.0,
                                                          16.0, 28.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
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
                                                                    '9vyn7mgh' /* Help your future self */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium,
                                                                ),
                                                              ],
                                                            ),
                                                            Wrap(
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
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '51rda6p6' /* Set a limit on when we should ... */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .daBlack200,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 10.0)),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                              'Limitpage_step0');
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        36.0,
                                                                        13.0,
                                                                        36.0,
                                                                        15.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'hsrdglmf' /* Set up auto advance */,
                                                                  ),
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
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 20.0)),
                                                  ),
                                                ),
                                              ),
                                            if (getJsonField(
                                                  columnGetDataResponse
                                                      .jsonBody,
                                                  r'''$[0].opt_in_status''',
                                                ) ==
                                                true)
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
                                                      .fromSTEB(16.0, 24.0,
                                                          16.0, 28.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
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
                                                                    'gsfgmoc3' /* Auto account refill is set up */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium,
                                                                ),
                                                              ],
                                                            ),
                                                            Wrap(
                                                              spacing: 0.0,
                                                              runSpacing: 0.0,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .center,
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
                                                                RichText(
                                                                  textScaleFactor:
                                                                      MediaQuery.of(
                                                                              context)
                                                                          .textScaleFactor,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'an0g4ze5' /* FlutterFlow */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).daBlack200,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'zt2xcnt7' /*  - build different. */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).daBlack200,
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'lrc0o3hr' /* Hello World  */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).daBlack200,
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'lmn3msom' /* Hello World  */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).daBlack200,
                                                                            ),
                                                                      )
                                                                    ],
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ],
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 10.0)),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                              'Limitpage_update_step0');
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .greyLine,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        36.0,
                                                                        13.0,
                                                                        36.0,
                                                                        15.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'awdvylpj' /* Edit the settings */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .greyDark,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 20.0)),
                                                  ),
                                                ),
                                              ),
                                          ].divide(SizedBox(height: 12.0)),
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
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .greyLine,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 14.0, 16.0, 14.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'anla9orb' /* What is grace period */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyDark,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      width: 24.0,
                                                      height: 24.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/Question_circle.svg',
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .greyLine,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 14.0, 16.0, 14.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'bjav17lf' /* What is grace period */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyDark,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      width: 24.0,
                                                      height: 24.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/Question_circle.svg',
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 12.0)),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 40.0)),
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(height: 40.0))
                                  .addToEnd(SizedBox(height: 64.0)),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 36.0),
                      child: Container(
                        width: double.infinity,
                        height: 88.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).greyLight,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).greyLine,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              40.0, 10.0, 40.0, 21.0),
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
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 25.0,
                                        height: 24.0,
                                        decoration: BoxDecoration(),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: SvgPicture.network(
                                            'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/home-03-unselected.svg',
                                            width: 300.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '6uhsdxni' /* Home */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .greyGrey,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ].divide(SizedBox(height: 4.0)),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (getJsonField(
                                    (_model.checkSubscription?.jsonBody ?? ''),
                                    r'''$.is_member''',
                                  )) {
                                    context.pushNamed('borrowOptions');

                                    if (!getJsonField(
                                      (_model.checkLimit?.jsonBody ?? ''),
                                      r'''$['funds_available']''',
                                    )) {
                                      context.pushNamed('reachedMaximum');
                                    }
                                  } else {
                                    _model.getDataCancelled =
                                        await SupabaseGroup.getDataCall.call(
                                      tableName: 'memberships',
                                      fields: 'cancelled',
                                      filterVariable: currentUserUid,
                                      filterName: 'user_id',
                                    );
                                    if (getJsonField(
                                      (_model.getDataCancelled?.jsonBody ?? ''),
                                      r'''$[0].cancelled''',
                                    )) {
                                      context.pushNamed(
                                          'membershipBannerResubscribe');
                                    }
                                  }

                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 25.0,
                                        height: 24.0,
                                        decoration: BoxDecoration(),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: SvgPicture.network(
                                            'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Borrow.svg',
                                            width: 300.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'fh6ixo00' /* Borrow */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Inter',
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
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('limitDefault');
                                },
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 25.0,
                                        height: 24.0,
                                        decoration: BoxDecoration(),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: SvgPicture.network(
                                            'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Limit%20active.svg',
                                            width: 300.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '91rcg59h' /* Limit */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .greyDark,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ].divide(SizedBox(height: 4.0)),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('accountDefault');
                                },
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 25.0,
                                        height: 24.0,
                                        decoration: BoxDecoration(),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: SvgPicture.network(
                                            'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/user-02-unselected.svg',
                                            width: 300.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'a9qsgt0c' /* Profile */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Inter',
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
