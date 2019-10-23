import 'package:flutter/material.dart';

class FilterSideSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple.withOpacity(0.12),
      child: Column(
        children: <Widget>[
          Container(
            height: 34.0,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(''),
                ),
                CloseButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
