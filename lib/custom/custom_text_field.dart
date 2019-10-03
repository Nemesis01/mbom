import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CustomTextField extends StatelessWidget {
  //region Field(s)
  final String hintText;
  final String label;
  final bool showCounter;
  //endregion

  //region Constructor(s)
  CustomTextField({
    @required this.hintText,
    @required this.label,
    this.showCounter = false,
  })  : assert(hintText != null),
        assert(label != null);
  //endregion

  //region UI
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontSize: 24.0);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration.collapsed(
              hintText: hintText,
              hintStyle: style.copyWith(fontWeight: FontWeight.w400),
              enabled: true,
              hoverColor: Colors.deepPurple,
            ),
            style: style.copyWith(fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 8.0),
          Text(label.toUpperCase()),
        ],
      ),
    );
  }
  //endregion
}
