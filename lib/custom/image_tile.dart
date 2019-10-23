/*
 * Copyright (c) 2019. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

import 'package:flutter/material.dart';

class ImageTile extends StatelessWidget {
  final String label;
  final Widget child;
  final Color color;
  final bool compact;

  ImageTile({
    this.label,
    this.child,
    this.color = Colors.transparent,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        child: Container(
          //width: 170.0,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          color: color,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: child,
                flex: 1,
              ),
              //SizedBox(height: 4.0),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  label.toUpperCase(),
                  style: TextStyle(
                    fontSize: compact ? 12.0 : 15.0,
                    color: Colors.black54,
                    letterSpacing: compact ? .0 : 1.5,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
