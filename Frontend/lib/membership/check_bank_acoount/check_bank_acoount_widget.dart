import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'check_bank_acoount_model.dart';
export 'check_bank_acoount_model.dart';

class CheckBankAcoountWidget extends StatefulWidget {
  const CheckBankAcoountWidget({Key? key}) : super(key: key);

  @override
  _CheckBankAcoountWidgetState createState() => _CheckBankAcoountWidgetState();
}

class _CheckBankAcoountWidgetState extends State<CheckBankAcoountWidget> {
  late CheckBankAcoountModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckBankAcoountModel());
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
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 168.0, 0.0, 0.0),
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
                                      'assets/images/bank.png',
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
                              Wrap(
                                spacing: 0.0,
                                runSpacing: 0.0,
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'azmu8pt9' /* Please check  your bank accoun... */,
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
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ].divide(SizedBox(height: 44.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
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
                                  'kx4y2q7w' /* Thanks */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Rajdhani',
                                      color:
                                          FlutterFlowTheme.of(context).greyDark,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ].divide(SizedBox(height: 20.0)),
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
