import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frezy_ui/constants.dart';

class BaseNavigationBar extends StatelessWidget {
  const BaseNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
    required this.items,
  });

  final int selectedIndex;
  final Function(int index) onSelect;
  final List<BottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (!isApplePlatform) {
      return BottomNavigationBar(
        items: items,
        currentIndex: selectedIndex,
        selectedItemColor: theme.primaryColor,
        unselectedItemColor: theme.hintColor,
        onTap: onSelect,
      );
    }
    return CupertinoTabBar(
      activeColor: theme.primaryColor,
      items: items,
      currentIndex: selectedIndex,
      backgroundColor: theme.cardColor,
      onTap: onSelect,
    );
  }
}
