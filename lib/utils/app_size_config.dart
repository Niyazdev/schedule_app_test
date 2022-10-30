import 'package:flutter/cupertino.dart';
import 'dart:developer' as developer;

class SC {
  // SC -> Size Configuration
  static late double _screenWidth;
  static late double _screenHeight;
  static double? _blockWidth;
  static double? _blockHeight;

  static double? t;
  static double? i;
  static double? h;
  static double? w;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    t = _blockHeight;
    i = _blockWidth;
    h = _blockHeight;
    w = _blockWidth;

    developer.log('$_blockWidth', name: 'HORIZONTAL');
    developer.log('$_blockHeight', name: 'VERTICAL');
  }

  static double primaryBox = 6.5;
  static double secondaryBox = 5.5;
  static double sheetHeadingBox = 10;
}
