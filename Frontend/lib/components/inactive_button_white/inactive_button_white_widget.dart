import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'inactive_button_white_model.dart';
export 'inactive_button_white_model.dart';

class InactiveButtonWhiteWidget extends StatefulWidget {
  const InactiveButtonWhiteWidget({Key? key}) : super(key: key);

  @override
  _InactiveButtonWhiteWidgetState createState() =>
      _InactiveButtonWhiteWidgetState();
}

class _InactiveButtonWhiteWidgetState extends State<InactiveButtonWhiteWidget> {
  late InactiveButtonWhiteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InactiveButtonWhiteModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 24.0,
      height: 24.0,
      decoration: BoxDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: SvgPicture.network(
          'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/Radio%20button%20white%20inactive.svg',
          width: 24.0,
          height: 24.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
