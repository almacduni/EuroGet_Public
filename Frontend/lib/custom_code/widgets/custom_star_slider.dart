// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_svg/flutter_svg.dart';

class CustomStarSlider extends StatefulWidget {
  final double? width;
  final double? height;

  const CustomStarSlider({Key? key, this.width, this.height}) : super(key: key);

  @override
  _CustomStarSliderState createState() => _CustomStarSliderState();
}

class _CustomStarSliderState extends State<CustomStarSlider> {
  int _currentValue = 0; // Initial star rating set to 0

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, // Evenly space the stars
        children: List.generate(5, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _currentValue = index + 1;
                // Update AppState here
                FFAppState().nps = _currentValue;
              });
            },
            child: _currentValue > index
                ? SvgPicture.network(
                    'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/StarFilled.svg',
                  )
                : SvgPicture.network(
                    'https://isddthgxttxvmszhpemb.supabase.co/storage/v1/object/public/public_images/icons/StarUnfilled.svg',
                  ),
          );
        }),
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
