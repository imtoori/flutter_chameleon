import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChameleonActivityIndicator extends Widget {
  final double strokeWidth;
  final double value;
  final Key key;
  final Color backgroundColor;
  final Animation<Color> valueColor;
  final bool animating;

  const ChameleonActivityIndicator({
    this.key,
    this.value,
    this.backgroundColor,
    this.valueColor,
    this.strokeWidth: 4.0,
    this.animating: true,
  });

  @override
  Element createElement() {
    return defaultTargetPlatform == TargetPlatform.android
        ? new CircularProgressIndicator(
            value: value,
            key: key,
            backgroundColor: backgroundColor,
            strokeWidth: strokeWidth,
            valueColor: valueColor,
          ).createElement()
        : new CupertinoActivityIndicator(
            key: key,
            animating: animating,
          ).createElement();
  }
}
