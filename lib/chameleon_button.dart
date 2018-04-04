import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ChameleonButton extends Widget {
  final VoidCallback onPressed;
  final ValueChanged<bool> onHighlightChanged;
  final ButtonTextTheme textTheme;
  final Color textColor;
  final Color disabledTextColor;
  final Color color;
  final Color disabledColor;
  final Color splashColor;
  final Color highlightColor;
  final Brightness colorBrightness;
  final Widget child;
  final double height;
  final double highlightElevation;
  final double minWidth;

  bool get enabled => onPressed != null;
  final EdgeInsetsGeometry padding;
  final ShapeBorder shape;
  final BorderRadius borderRadius;
  final double minSize;
  final double pressedOpacity;
  final double elevation;

  const ChameleonButton({
    Key key,
    @required this.onPressed,
    this.onHighlightChanged,
    this.textTheme,
    this.textColor,
    this.height,
    this.disabledTextColor,
    this.color,
    this.disabledColor,
    this.highlightColor,
    this.splashColor,
    this.colorBrightness,
    this.padding,
    this.shape,
    this.minWidth,
    this.highlightElevation,
    @required this.child,
    this.borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
    this.minSize,
    this.elevation,
    this.pressedOpacity: 0.1,
  });

  @override
  Element createElement() {
    return defaultTargetPlatform == TargetPlatform.android
        ? new MaterialButton(
            onPressed: onPressed,
            child: child,
            color: color,
            colorBrightness: colorBrightness,
            elevation: elevation,
            height: height,
            highlightElevation: highlightElevation,
            minWidth: minWidth,
            highlightColor: highlightColor,
            key: key,
            padding: padding,
            splashColor: splashColor,
            textColor: textColor,
            textTheme: textTheme,
          ).createElement()
        : new CupertinoButton(
            child: child,
            padding: padding,
            color: color,
            onPressed: onPressed,
            borderRadius: borderRadius,
            minSize: minSize,
            pressedOpacity: pressedOpacity,
          ).createElement();
  }
}
