import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChameleonSwitch extends Widget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color activeTrackColor;
  final Color inactiveThumbColor;
  final Color inactiveTrackColor;
  final ImageProvider activeThumbImage;
  final ImageProvider inactiveThumbImage;
  final BuildContext context;

  const ChameleonSwitch({
    @required this.context,
    Key key,
    @required this.value,
    @required this.onChanged,
    this.activeColor: CupertinoColors.activeGreen,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.inactiveThumbImage,
  });

  @override
  Element createElement() {
    return defaultTargetPlatform == TargetPlatform.android
        ? new Switch(
            key: key,
            onChanged: onChanged,
            value: value,
            activeColor: activeColor == CupertinoColors.activeGreen
                ? Theme.of(context).primaryColor
                : activeColor,
            activeThumbImage: activeThumbImage,
            activeTrackColor: activeTrackColor,
            inactiveThumbColor: inactiveThumbColor,
            inactiveThumbImage: inactiveThumbImage,
            inactiveTrackColor: inactiveTrackColor,
          ).createElement()
        : new CupertinoSwitch(
            activeColor: activeColor,
            onChanged: onChanged,
            value: value,
            key: key,
          ).createElement();
  }
}
