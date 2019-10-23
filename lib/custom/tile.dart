/*
 * Copyright (c) 2019. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  //region Field(s)
  final VoidCallback onTap;
  final IconData icon;
  final Color color;
  final String tooltip;
  //endregion

  //region Constructor(s)
  Tile({
    @required this.onTap,
    this.icon,
    this.color = Colors.white,
    this.tooltip,
  });
  //endregion

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(24.0),
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(24.0),
        onTap: onTap,
        child: IconButton(
          icon: Icon(
            icon,
            size: 32.0,
            //color: Colors.deepPurple,
            color: Theme.of(context).primaryColor,
          ),
          tooltip: tooltip,
          //padding: EdgeInsets.all(0.0),
          //onPressed: onTap,
        ),
      ),
    );
  }
}
