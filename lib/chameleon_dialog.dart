import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChameleonDialog extends Widget {
  final Widget child;

  const ChameleonDialog({
    Key key,
    this.child,
  });

  @override
  Element createElement() {
    return defaultTargetPlatform == TargetPlatform.android
        ? new Dialog(
            key: key,
            child: child,
          ).createElement()
        : new CupertinoDialog(
            key: key,
            child: child,
          ).createElement();
  }
}
