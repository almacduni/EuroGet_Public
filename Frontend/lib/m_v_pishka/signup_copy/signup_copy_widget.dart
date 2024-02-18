import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'signup_copy_model.dart';
export 'signup_copy_model.dart';

class SignupCopyWidget extends StatefulWidget {
  const SignupCopyWidget({Key? key}) : super(key: key);

  @override
  _SignupCopyWidgetState createState() => _SignupCopyWidgetState();
}

class _SignupCopyWidgetState extends State<SignupCopyWidget> {
  late SignupCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignupCopyModel());

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
                            Align(
                              alignment: AlignmentDirectional(0.05, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/cheque.png',
                                  width: double.infinity,
                                  height: 200.0,
                                  fit: BoxFit.cover,
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
                              '2a9ud3zr' /* Welcome to EuroGet */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Rajdhani',
                                  color: FlutterFlowTheme.of(context).greyLight,
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
                              '20nlickw' /* Tell us the email address and ... */,
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
                                        'pema76ay' /* Mail */,
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
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'fnuoi3np' /* youremail@gmail.com */,
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
                                        '2em46c3p' /* Password */,
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
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          '4evgl1et' /* Password */,
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
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              GoRouter.of(context).prepareAuthEvent();
                              if (_model.passwordController.text !=
                                  _model.passwordController.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Passwords don\'t match!',
                                    ),
                                  ),
                                );
                                return;
                              }

                              final user =
                                  await authManager.createAccountWithEmail(
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
                              _model.uploadUsers =
                                  await SupabaseGroup.uploadUsersCall.call(
                                email: currentUserEmail,
                                role: 'user',
                                userId: currentUserUid,
                              );
                              if ((_model.uploadUsers?.succeeded ?? true)) {
                                _model.uploadAccountInfo = await SupabaseGroup
                                    .uploadAccountInfoCall
                                    .call(
                                  email: currentUserEmail,
                                  userId: currentUserUid,
                                );

                                context.pushNamedAuth(
                                    'checkEmail', context.mounted);
                              }

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
                                      'xeo8jiis' /* Continue */,
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
                                'e5sr5dv2' /* or */,
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
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
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
                                    await actions.signInWithApple();
                                  },
                                  child: Container(
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
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 16.0,
                                          height: 16.0,
                                          decoration: BoxDecoration(),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'a6dlb0ex' /* Continue with Apple */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Rajdhani',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .greyLight,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
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
                                  context.pushNamed('login');
                                },
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '6ed9k11z' /* Already have an account? Log i... */,
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
