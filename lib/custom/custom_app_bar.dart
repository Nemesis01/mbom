import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final double height;
  final Widget leading;
  final Widget title;
  final List<Widget> actions;
  final Color backgroundColor;

  //region Constructors
  CustomAppBar({
    this.height = 54.0,
    this.leading,
    this.title,
    this.actions,
    this.backgroundColor = Colors.deepPurple,
  });
  //endregion

  //region Methods
  @override
  Widget build(BuildContext context) {
    return Material(
      //elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Container(
          color: backgroundColor,
          child: Row(
            children: <Widget>[
              leading,
              SizedBox(width: 12.0),
              title,
              Expanded(
                child: Container(
                  height: height,
                ),
              ),
              Row(
                children: actions,
              ),
            ],
          ),
        ),
      ),
    );
  }
  //endregion
}
