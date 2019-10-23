/*
 * Copyright (c) 2019. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

import 'package:flutter/material.dart';

class HomeScreenPageModel extends StatelessWidget {
  //region Field(s)
  final String pageTitle;
  //endregion

  //region Constructor(s)
  HomeScreenPageModel({this.pageTitle});
  //endregion

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(),
    );
  }

  Widget _section(BuildContext context) {}
}
