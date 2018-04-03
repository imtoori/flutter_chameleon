import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ChameleonSlider extends Widget {
  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final int divisions;
  final String label;
  final Color activeColor;
  final Color inactiveColor;
  final Key key;

  const ChameleonSlider({
    this.key,
    @required this.value,
    @required this.onChanged,
    this.min: 0.0,
    this.max: 1.0,
    this.divisions,
    this.label,
    this.activeColor: CupertinoColors.activeBlue,
    this.inactiveColor,
  });

  @override
  Element createElement() {
    return defaultTargetPlatform == TargetPlatform.android
        ? new Slider(
            value: value,
            key: key,
            onChanged: onChanged,
            activeColor: activeColor,
            divisions: divisions,
            inactiveColor: inactiveColor,
            label: label,
            max: max,
            min: min,
          ).createElement()
        : new CupertinoSlider(
            min: min,
            max: max,
            divisions: divisions,
            activeColor: activeColor,
            onChanged: onChanged,
            key: key,
            value: value,
          ).createElement();
  }
}
