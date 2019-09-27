import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  //region Field(s)
  final List<CustomBottomNavigationBarItem> items;
  final VoidCallback onTap;
  final int currentIndex;
  final double elevation;
  final Color color;
  final Color backgroundColor;
  final Color selectedItemColor;
  //endregion

  //region Constructor(s)
  CustomBottomNavigationBar(
      {@required this.items,
      @required this.onTap,
      this.currentIndex = 0,
      this.elevation = 4.0,
      this.color,
      this.backgroundColor,
      this.selectedItemColor})
      : assert(items != null),
        assert(onTap != null),
        assert(items.length % 2 == 0);
  //endregion

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: Row(children: []),
    );
  }

  List<Widget> buildItems(BuildContext context) {
    switch (items.length) {
      case 4:
        return null;
    }
  }
}

class CustomBottomNavigationBarItem extends StatelessWidget {
  //region Field(s)
  final IconData icon;
  final Color color;
  final bool selected;
  //endregion

  //region Constructor(s)
  CustomBottomNavigationBarItem({
    this.icon,
    this.color,
    this.selected = false,
  });
  //endregion

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Icon(icon),
          indicator(context),
        ],
      ),
    );
  }

  Widget indicator(BuildContext context) {
    return Container(
      height: 2.0,
      width: 4.0,
      color: color,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0)),
    );
  }
}
