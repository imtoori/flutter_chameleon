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

  bool get enabled => onPressed != null;
  final EdgeInsetsGeometry padding;
  final ShapeBorder shape;
  final BorderRadius borderRadius;
  final double minSize;
  final double pressedOpacity;

  const ChameleonButton({
    Key key,
    @required this.onPressed,
    this.onHighlightChanged,
    this.textTheme,
    this.textColor,
    this.disabledTextColor,
    this.color,
    this.disabledColor,
    this.highlightColor,
    this.splashColor,
    this.colorBrightness,
    this.padding,
    this.shape,
    @required this.child,
    this.borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
    this.minSize,
    this.pressedOpacity: 0.1,
  });

  @override
  Element createElement() {
    return defaultTargetPlatform == TargetPlatform.android
        ? new FlatButton(
            onPressed: onPressed,
            child: child,
            color: color,
            colorBrightness: colorBrightness,
            disabledColor: disabledColor,
            disabledTextColor: disabledTextColor,
            highlightColor: highlightColor,
            key: key,
            onHighlightChanged: onHighlightChanged,
            padding: padding,
            shape: shape,
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
