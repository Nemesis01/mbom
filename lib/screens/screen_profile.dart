import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  //region Member(s)
  final String title;
  //endregion

  //region Constructor(s)
  ProfileScreen({Key key, this.title}) : super(key: key);
  //endregion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    //TODO: Add replace Username by User's name property
    return Stack(
      //fit: StackFit.loose,
      children: <Widget>[
        Positioned(
          top: 24.0,
          child: Container(
            height: 150.0,
            width: double.maxFinite,
            color: theme.primaryColor,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 32.0, left: 32.0),
                  child: Text(
                    'John Doe',
                    style:
                        theme.textTheme.display1.copyWith(color: Colors.white),
                  ),
                ),
                //TODO: Add strings file entry for hardcoded value
                Text('My Profile'),
              ],
            ),
          ),
        ),
        Positioned(
          top: 184.0, //134.0
          left: 16.0,
          right: 16.0,
          child: Material(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text('Hello'),
            ),
          ),
        ),
      ],
    );
  }
}
