import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  //region Field(s)
  final IconData icon;
  final Color backgroundColor;
  final Widget child;
  final VoidCallback onTap;
  //endregion

  //region Constructor(s)
  CustomListTile({
    this.icon,
    this.child,
    this.backgroundColor = Colors.white,
    this.onTap,
  });
  //endregion

  //region UI
  @override
  Widget build(BuildContext context) {
    return Material(
      //elevation: 2.0,
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: 80.0,
          margin: EdgeInsets.symmetric(vertical: 2.0),
          padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
          color: backgroundColor,
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Positioned(
                top: 0.0,
                right: -20.0,
                child: Icon(icon, size: 80.0, color: Colors.deepPurple.shade50),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
  //endregion
}
