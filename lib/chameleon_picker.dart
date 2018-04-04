import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Future<T> showChameleonModalBottomSheet<T>(
  BuildContext context, {
  Key key,
  AnimationController animationController,
  @required VoidCallback onClosing,
  double diameterRatio: 1.1,
  Color backgroundColor: const Color(0xFFD2D4DB),
  ValueChanged<int> onSelectedItemChanged,
  double itemExtent,
  List<ChameleonBottomSheetItem<T>> children,
  FixedExtentScrollController scrollController,
}) {
  return showModalBottomSheet(
    builder: (BuildContext c) => new ChameleonPicker(
          context,
          children: children,
          diameterRatio: diameterRatio,
          backgroundColor: backgroundColor,
          onSelectedItemChanged: onSelectedItemChanged,
          itemExtent: itemExtent,
          scrollController: scrollController,
          animationController: animationController,
          onClosing: onClosing,
          key: key,
        ),
    context: context,
  );
}

class ChameleonPicker extends Widget {
  final AnimationController animationController;
  final VoidCallback onClosing;
  final double diameterRatio;
  final Color backgroundColor;
  final FixedExtentScrollController scrollController;
  final double itemExtent;
  final List<ChameleonBottomSheetItem> children;
  final ValueChanged<int> onSelectedItemChanged;
  final BuildContext buildContext;

  const ChameleonPicker(
    this.buildContext, {
    Key key,
    this.animationController,
    @required this.onClosing,
    this.diameterRatio: 1.1,
    this.backgroundColor: const Color(0xFFD2D4DB),
    this.onSelectedItemChanged,
    @required this.itemExtent,
    this.children,
    this.scrollController,
  });

  @override
  Element createElement() {
    return defaultTargetPlatform == TargetPlatform.android
        ? new BottomSheet(
            key: key,
            builder: (context) {
              return new Column(
                  children: children
                      ?.map((c) => new SimpleDialogOption(
                            child: c.widget,
                            onPressed: () {
                              Navigator.pop(context, c.value);
                            },
                          ))
                      ?.toList());
            },
            onClosing: onClosing,
            animationController: animationController,
          ).createElement()
        : new CupertinoPicker(
            key: key,
            scrollController: scrollController,
            children: children
                ?.map((c) => new GestureDetector(
                      child: c.widget,
                      onTap: () {
                        Navigator.pop(buildContext, c.value);
                      },
                    ))
                ?.toList(),
            itemExtent: itemExtent,
            onSelectedItemChanged: onSelectedItemChanged,
            backgroundColor: backgroundColor,
            diameterRatio: diameterRatio,
          ).createElement();
  }
}

class ChameleonBottomSheetItem<T> {
  Widget widget;
  T value;

  ChameleonBottomSheetItem({@required this.widget, @required this.value});
}
