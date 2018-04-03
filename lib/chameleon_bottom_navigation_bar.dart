import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChameleonBottomNavigationBar extends Widget {
  final List<BottomNavigationBarItem> items;
  final ValueChanged<int> onTap;
  final int currentIndex;
  final BottomNavigationBarType type;
  final Color fixedColor;
  final double iconSize;
  final Color activeColor;
  final Color backgroundColor;
  final Color inactiveColor;

  const ChameleonBottomNavigationBar({
    Key key,
    @required this.items,
    this.onTap,
    this.currentIndex: 0,
    this.type,
    this.fixedColor,
    this.iconSize: 24.0,
    this.activeColor: CupertinoColors.activeBlue,
    this.backgroundColor: const Color(0xCCF8F8F8),
    this.inactiveColor: CupertinoColors.inactiveGray,
  });

  @override
  Element createElement() {
    return defaultTargetPlatform == TargetPlatform.android
        ? new BottomNavigationBar(
            key: key,
            items: items,
            currentIndex: currentIndex,
            fixedColor: fixedColor,
            iconSize: iconSize,
            onTap: onTap,
            type: type,
          ).createElement()
        : new CupertinoTabBar(
            key: key,
            items: items,
            iconSize: iconSize,
            activeColor: activeColor,
            backgroundColor: backgroundColor,
            onTap: onTap,
            currentIndex: currentIndex,
            inactiveColor: inactiveColor,
          ).createElement();
  }
}
