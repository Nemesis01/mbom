import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 16.0),
            height: 34.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              //border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    LineIcons.search,
                    size: 22.0,
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(hintText: 'Find'),
                  ),
                ),
                IconButton(
                  icon: Icon(LineIcons.microphone, size: 22.0),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        IconButton(
          icon: Icon(LineIcons.close),
          onPressed: () {},
        ),
      ],
    );
  }
}
