import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

enum TextFieldType {
  NAME,
  ADDRESS,
  E_MAIL,
  PHONE_NUMBER,
  PASSWORD,
}

class CustomTextField extends StatelessWidget {
  //region Field(s)
  final TextFieldType type;
  final TextEditingController controller;
  final String hintText;
  final String label;
  final String initialValue;
  final bool showCounter;
  //endregion

  //region Constructor(s)
  CustomTextField({
    @required this.label,
    this.type = TextFieldType.NAME,
    this.controller,
    this.hintText,
    this.initialValue,
    this.showCounter = false,
  }) : /*assert(hintText != null),*/
        assert(label != null);
  //endregion

  //region UI
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration.collapsed(
              hintText: hintText,
              hintStyle: style,
              enabled: true,
              hoverColor: Colors.deepPurple,
            ),
            style: style,
            textCapitalization: type == TextFieldType.NAME
                ? TextCapitalization.words
                : TextCapitalization.none,
            obscureText: type == TextFieldType.PASSWORD ? true : false,
            initialValue: initialValue,
            keyboardType: type == TextFieldType.PHONE_NUMBER
                ? TextInputType.phone
                : type == TextFieldType.E_MAIL
                    ? TextInputType.emailAddress
                    : TextInputType.text,
          ),
          SizedBox(height: 8.0),
          Row(
            children: <Widget>[
              Text(
                label.toUpperCase(),
                style:
                    Theme.of(context).textTheme.subtitle.copyWith(fontSize: 11),
              ),
              Expanded(
                child: Visibility(
                  visible: showCounter,
                  child: Text(
                    type == TextFieldType.NAME
                        ? 'controller.text.length / 32'
                        : '',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  //endregion
}
