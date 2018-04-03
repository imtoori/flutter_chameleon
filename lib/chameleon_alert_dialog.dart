import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChameleonAlertDialog extends Widget {
  final Widget title;
  final EdgeInsetsGeometry titlePadding;
  final Widget content;
  final EdgeInsetsGeometry contentPadding;
  final List<Widget> actions;
  final ScrollController scrollController;

  const ChameleonAlertDialog({
    Key key,
    this.title,
    this.titlePadding,
    this.content,
    this.contentPadding,
    this.actions,
    this.scrollController,
  });

  @override
  Element createElement() {
    return defaultTargetPlatform == TargetPlatform.android
        ? new AlertDialog(
            key: key,
            actions: actions,
            content: content,
            contentPadding: contentPadding,
            title: title,
            titlePadding: titlePadding,
          ).createElement()
        : new CupertinoAlertDialog(
            key: key,
            content: content,
            title: title,
            actions: actions,
            scrollController: scrollController,
          ).createElement();
  }
}
