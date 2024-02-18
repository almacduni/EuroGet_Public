import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'account_default_model.dart';
export 'account_default_model.dart';

class AccountDefaultWidget extends StatefulWidget {
  const AccountDefaultWidget({Key? key}) : super(key: key);

  @override
  _AccountDefaultWidgetState createState() => _AccountDefaultWidgetState();
}

class _AccountDefaultWidgetState extends State<AccountDefaultWidget> {
  late AccountDefaultModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountDefaultModel());
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
        final accountDefaultCheckLimitResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).greyLight,
            body: SafeArea(
              top: true,
              child: FutureBuilder<ApiCallResponse>(
                future: MembershipGroup.checksubscriptionCall.call(
                  userId: currentUserUid,
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
                  final containerChecksubscriptionResponse = snapshot.data!;
                  return Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          child: Stack(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            children: [
                              Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 28.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                    'accountLanguage');
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        functions.toUpperCase(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode),
                                                        'en',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Rajdhani',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyDark,
                                                              ),
                                                    ),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                      child: Image.network(
                                                        () {
                                                          if (FFLocalizations.of(
                                                                      context)
                                                                  .languageCode ==
                                                              'en') {
                                                            return 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/flags/Flag_of_United_Kingdom_Flat_Round-1024x1024.png';
                                                          } else if (FFLocalizations
                                                                      .of(
                                                                          context)
                                                                  .languageCode ==
                                                              'es') {
                                                            return 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/flags/Flag_of_Spain_Flat_Round-1024x1024.png';
                                                          } else if (FFLocalizations
                                                                      .of(
                                                                          context)
                                                                  .languageCode ==
                                                              'fr') {
                                                            return 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/flags/Flag_of_France_Flat_Round-1024x1024.png';
                                                          } else if (FFLocalizations
                                                                      .of(
                                                                          context)
                                                                  .languageCode ==
                                                              'de') {
                                                            return 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/flags/Flag_of_Germany_Flat_Round-1024x1024.png';
                                                          } else if (FFLocalizations
                                                                      .of(context)
                                                                  .languageCode ==
                                                              'it') {
                                                            return 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/flags/Flag_of_Italy_Flat_Round-1024x1024.png';
                                                          } else {
                                                            return 'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/flags/Flag_of_United_Kingdom_Flat_Round-1024x1024.png';
                                                          }
                                                        }(),
                                                        width: 24.0,
                                                        height: 24.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 52.0, 16.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(),
                                                child: FutureBuilder<
                                                    List<AccountInfoRow>>(
                                                  future: AccountInfoTable()
                                                      .querySingleRow(
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
                                                    List<AccountInfoRow>
                                                        columnAccountInfoRowList =
                                                        snapshot.data!;
                                                    final columnAccountInfoRow =
                                                        columnAccountInfoRowList
                                                                .isNotEmpty
                                                            ? columnAccountInfoRowList
                                                                .first
                                                            : null;
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 104.0,
                                                          height: 104.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .greyBG,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '5n7vrqkb' /* JS */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Rajdhani',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .greyGrey,
                                                                ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              RichText(
                                                                textScaleFactor:
                                                                    MediaQuery.of(
                                                                            context)
                                                                        .textScaleFactor,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: columnAccountInfoRow!
                                                                          .firstName!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Rajdhani',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).daBlack900,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'jrcsvwei' /*   */,
                                                                      ),
                                                                      style:
                                                                          TextStyle(),
                                                                    ),
                                                                    TextSpan(
                                                                      text: columnAccountInfoRow!
                                                                          .lastName!,
                                                                      style:
                                                                          TextStyle(),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Rajdhani',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .daBlack900,
                                                                        lineHeight:
                                                                            1.0,
                                                                      ),
                                                                ),
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
                                                                  RichText(
                                                                    textScaleFactor:
                                                                        MediaQuery.of(context)
                                                                            .textScaleFactor,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'elk67g00' /* Joined  */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).greyGrey,
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              dateTimeFormat(
                                                                            'yMMMd',
                                                                            columnAccountInfoRow!.createdAt,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).greyGrey,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 2.0)),
                                                          ),
                                                        ),
                                                        if (!getJsonField(
                                                          containerChecksubscriptionResponse
                                                              .jsonBody,
                                                          r'''$.is_member''',
                                                        ))
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .greyDark,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          6.0,
                                                                          12.0,
                                                                          6.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'f62chf3m' /* Upgrade your account to PRO */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .greyLight,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                      ].divide(SizedBox(
                                                          height: 16.0)),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
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
                                                                    16.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'o2gp1azu' /* General */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).greyDark,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context.pushNamed(
                                                                    'accountPersonalInfo');
                                                              },
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          18.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'oe9b3u26' /* Personal information */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).greyGrey,
                                                                            ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            24.0,
                                                                        height:
                                                                            24.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              SvgPicture.network(
                                                                            'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Chevron%20Right.svg',
                                                                            width:
                                                                                300.0,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyLine,
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context.pushNamed(
                                                                    'accountMembership');
                                                              },
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '849rqxim' /* Membership */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).greyGrey,
                                                                            ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            24.0,
                                                                        height:
                                                                            24.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              SvgPicture.network(
                                                                            'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Chevron%20Right.svg',
                                                                            width:
                                                                                300.0,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyLine,
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context.pushNamed(
                                                                    'accountFeedbackSubmit');
                                                              },
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          20.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'qgmww3xa' /* Feedback */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).greyGrey,
                                                                            ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            24.0,
                                                                        height:
                                                                            24.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              SvgPicture.network(
                                                                            'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Chevron%20Right.svg',
                                                                            width:
                                                                                300.0,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
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
                                                    Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
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
                                                                    16.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'a91qht8m' /* Usefull pages */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).greyDark,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context.pushNamed(
                                                                    'accountSupport');
                                                              },
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          18.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'roqssc0a' /* Support */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).greyGrey,
                                                                            ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            24.0,
                                                                        height:
                                                                            24.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              SvgPicture.network(
                                                                            'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Chevron%20Right.svg',
                                                                            width:
                                                                                300.0,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyLine,
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await launchURL(
                                                                    'https://euroget.co/faq');
                                                              },
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          20.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'f6c8fhb1' /* FAQ */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).greyGrey,
                                                                            ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            24.0,
                                                                        height:
                                                                            24.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              SvgPicture.network(
                                                                            'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Chevron%20Right.svg',
                                                                            width:
                                                                                300.0,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
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
                                                    Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
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
                                                                    16.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'pjf9cmtq' /* About us */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).greyDark,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context.pushNamed(
                                                                    'accountContactDetails');
                                                              },
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          18.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'l5edt13o' /* Contact details */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).greyGrey,
                                                                            ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            24.0,
                                                                        height:
                                                                            24.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              SvgPicture.network(
                                                                            'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Chevron%20Right.svg',
                                                                            width:
                                                                                300.0,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyLine,
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await launchURL(
                                                                    'https://euroget.co/privacy-policy');
                                                              },
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '93edk9yo' /* Privacy policy */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).greyGrey,
                                                                            ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            24.0,
                                                                        height:
                                                                            24.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              SvgPicture.network(
                                                                            'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Chevron%20Right.svg',
                                                                            width:
                                                                                300.0,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greyLine,
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await launchURL(
                                                                    'https://euroget.co/terms-of-use');
                                                              },
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          20.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'nn8v361i' /* Terms of use */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).greyGrey,
                                                                            ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            24.0,
                                                                        height:
                                                                            24.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              SvgPicture.network(
                                                                            'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Chevron%20Right.svg',
                                                                            width:
                                                                                300.0,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
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
                                                  ].divide(
                                                      SizedBox(height: 12.0)),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  GoRouter.of(context)
                                                      .prepareAuthEvent();
                                                  await authManager.signOut();
                                                  GoRouter.of(context)
                                                      .clearRedirectLocation();

                                                  context.goNamedAuth('welcome',
                                                      context.mounted);
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 44.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .greyLight,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .greyLine,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ubxg2lho' /* Log out */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
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
                                              ),
                                            ]
                                                .divide(SizedBox(height: 40.0))
                                                .addToEnd(
                                                    SizedBox(height: 148.0)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 36.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 88.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .greyLight,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .greyLine,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40.0, 10.0, 40.0, 21.0),
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
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: SvgPicture.network(
                                                        'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/home-03-unselected.svg',
                                                        width: 300.0,
                                                        height: 200.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'n40mlayu' /* Home */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                                containerChecksubscriptionResponse
                                                    .jsonBody,
                                                r'''$.is_member''',
                                              )) {
                                                context.pushNamed(
                                                    'paymentCalculator');

                                                if (!getJsonField(
                                                  accountDefaultCheckLimitResponse
                                                      .jsonBody,
                                                  r'''$['funds_available']''',
                                                )) {
                                                  context.pushNamed(
                                                      'reachedMaximum');
                                                }
                                              } else {
                                                _model.getDataCancelled =
                                                    await SupabaseGroup
                                                        .getDataCall
                                                        .call(
                                                  tableName: 'memberships',
                                                  fields: 'cancelled',
                                                  filterVariable:
                                                      currentUserUid,
                                                  filterName: 'user_id',
                                                );
                                                if (getJsonField(
                                                  (_model.getDataCancelled
                                                          ?.jsonBody ??
                                                      ''),
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
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: SvgPicture.network(
                                                        'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Borrow.svg',
                                                        width: 300.0,
                                                        height: 200.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'zf8gkd7j' /* Borrow */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: SvgPicture.network(
                                                        'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Limit%20inactive.svg',
                                                        width: 300.0,
                                                        height: 200.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '5tq99qgu' /* Limit */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ),
                                          Container(
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
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: SvgPicture.network(
                                                      'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/user-02-selected.svg',
                                                      width: 300.0,
                                                      height: 200.0,
                                                      fit: BoxFit.cover,
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
                                                        '5eha6k30' /* Profile */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .greyDark,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
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
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
