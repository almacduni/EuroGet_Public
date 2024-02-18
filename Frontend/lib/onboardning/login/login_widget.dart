import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    _model.emailController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.passwordController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
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
                            Container(
                              width: 204.0,
                              height: 204.0,
                              decoration: BoxDecoration(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/3Ds/cheque.png',
                                  width: 300.0,
                                  height: 200.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'vslyyb8f' /* Welcome back */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Rajdhani',
                                  color: FlutterFlowTheme.of(context).greyLight,
                                  lineHeight: 1.0,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '65arx6p1' /* Please enter your email and pa... */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).greyGrey,
                                  lineHeight: 1.3,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
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
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '9vzvdqwj' /* Mail */,
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
                                Container(
                                  width: double.infinity,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .lineBlack,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.emailController,
                                      focusNode: _model.emailFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.emailController',
                                        Duration(milliseconds: 100),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'q2bz7fky' /* youremail@gmail.com */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .greyGrey,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                12.0, 14.0, 0.0, 16.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .greyLight,
                                          ),
                                      validator: _model.emailControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 8.0)),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '098t4dx7' /* Password */,
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
                                Container(
                                  width: double.infinity,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .lineBlack,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.passwordController,
                                      focusNode: _model.passwordFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.passwordController',
                                        Duration(milliseconds: 100),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'u6pbwd52' /* Password */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .greyGrey,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                12.0, 14.0, 0.0, 16.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .greyLight,
                                          ),
                                      validator: _model
                                          .passwordControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 8.0)),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: (_model.emailController.text == null ||
                                        _model.emailController.text == '') ||
                                    (_model.passwordController.text == null ||
                                        _model.passwordController.text == '')
                                ? null
                                : () async {
                                    GoRouter.of(context).prepareAuthEvent();

                                    final user =
                                        await authManager.signInWithEmail(
                                      context,
                                      _model.emailController.text,
                                      _model.passwordController.text,
                                    );
                                    if (user == null) {
                                      return;
                                    }

                                    setState(() {
                                      FFAppState().userid = currentUserUid;
                                    });

                                    context.pushNamedAuth(
                                        'HomePage', context.mounted);
                                  },
                            text: FFLocalizations.of(context).getText(
                              'plbuwu04' /* Continue */,
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
                                    color:
                                        FlutterFlowTheme.of(context).greyDark,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                              disabledColor:
                                  FlutterFlowTheme.of(context).greyLine,
                              disabledTextColor:
                                  FlutterFlowTheme.of(context).greyGrey,
                            ),
                          ),
                        ].divide(SizedBox(height: 16.0)),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 147.0,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).lineBlack,
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'ny9qksep' /* or */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color:
                                        FlutterFlowTheme.of(context).greyGrey,
                                  ),
                            ),
                            Container(
                              width: 147.0,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).lineBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await actions.signInWithApple();
                        },
                        child: Container(
                          width: double.infinity,
                          height: 44.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).lineBlack,
                              width: 1.0,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 16.0,
                                height: 16.0,
                                decoration: BoxDecoration(),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: SvgPicture.asset(
                                    'assets/images/Apple.svg',
                                    width: 300.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'es6qfl8p' /* Login with Apple */,
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
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('signup');
                                },
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'hzid01oc' /* Don't have an account yet? Sig... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .brandLight,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ].divide(SizedBox(height: 24.0)),
                      ),
                    ].divide(SizedBox(height: 30.0)),
                  ),
                ),
              ].addToEnd(SizedBox(height: 32.0)),
            ),
          ),
        ),
      ),
    );
  }
}
