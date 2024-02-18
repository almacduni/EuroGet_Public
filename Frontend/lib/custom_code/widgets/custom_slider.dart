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

class CustomSlider extends StatefulWidget {
  final double? width;
  final double? height;
  final int min; // Changed to int
  final int max; // Changed to int
  final int initialValue; // Changed to int

  const CustomSlider({
    Key? key,
    this.width,
    this.height,
    required this.min, // 'required' keyword is kept
    required this.max, // 'required' keyword is kept
    required this.initialValue, // 'required' keyword is kept
  }) : super(key: key);

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  late double
      _currentValue; // Keeping as double because Slider widget uses double

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue.toDouble(); // Converting int to double
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: <Widget>[
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Color(0xFF00E599),
              inactiveTrackColor: Color(0xFFF7F7F4),
              trackShape: RoundedRectSliderTrackShape(),
              trackHeight: 7.0,
              thumbColor: Colors.white,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16.0),
              overlayColor: Colors.white,
              overlayShape: RoundSliderOverlayShape(overlayRadius: 16.0),
            ),
            child: Slider(
              value: _currentValue,
              min: widget.min.toDouble(), // Converting int to double
              max: widget.max.toDouble(), // Converting int to double
              onChanged: (value) {
                setState(() {
                  _currentValue = value;
                });
              },
              onChangeEnd: (value) {
                // Assuming FFAppState is accessible and properly imported
                FFAppState().update(() {
                  FFAppState().sliderValue =
                      value.toInt(); // Converting double to int
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${widget.min}', // .toInt() is removed because 'min' is already int
                  style: TextStyle(
                    color: Color(0xFF88898A),
                    fontFamily: 'Inter',
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${widget.max}', // .toInt() is removed because 'max' is already int
                  style: TextStyle(
                    color: Color(0xFF88898A),
                    fontFamily: 'Inter',
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
