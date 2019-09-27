import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ThumbnailCard extends StatelessWidget {
  //region Field(s)
  final VoidCallback onTap;
  //endregion

  //region Constructor(s)
  ThumbnailCard({this.onTap});
  //endregion

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 100.0,
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text('tile'),
                Text('description'),
              ],
            ),
            Icon(LineIcons.home)
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
