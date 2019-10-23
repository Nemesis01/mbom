/*
 * Copyright (c) 2019. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mbom/custom/image_tile.dart';
import 'package:mbom/custom/tile.dart';

class TabletsPage extends StatelessWidget {
  //region Field(s)
  final String title;
  //endregion

  //region Constructor(s)
  TabletsPage({this.title});
  //endregion

  //region UI
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
      shrinkWrap: true,
      children: <Widget>[
        Text(
          'Tablettes',
          style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 32.0, letterSpacing: -1.0,
            //fontFamily: 'Dosis'
          ),
        ),
        _header(context),
        _sections(context),
      ],
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 2.0,
        childAspectRatio: 0.95,
        children: <Widget>[
          ImageTile(
            label: 'best sellers',
            child: Image.asset(
              'assets/pictures/tablet_pixel_c_on.png',
            ),
          ),
          ImageTile(
            label: 'convertibles',
            child: Image.asset(
              'assets/pictures/tablet_10_port.png',
            ),
          ),
          ImageTile(
            label: 'pliables',
            child: Image.asset(
              'assets/pictures/tablet_10_port.png',
            ),
          ),
          ImageTile(
            label: 'nouveautés',
            child: Image.asset(
              'assets/pictures/tablet_10_port.png',
            ),
          ),
        ],
      ),
    );
    return Container(
      // color: Colors.grey,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ImageTile(
            label: 'Android',
            child: Image.asset(
              'assets/pictures/tablet_10_port.png',
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
          ImageTile(
            label: 'iPad',
            child: Image.asset(
              'assets/pictures/tablet_10_port.png',
              height: MediaQuery.of(context).size.width * 0.5,
              width: MediaQuery.of(context).size.width * 0.35,
              //scale: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sections(BuildContext context) {
    //TODO: Hardcoded String values
    final _sectionNames = [
      'En vedette',
      'Meilleures ventes',
      'Recommandés',
      'Les mieux notés',
      'Nouveautés',
    ];

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          _sectionNames.length,
          (index) => _section(context, _sectionNames[index]),
        ),
      ),
    );
  }

  //TODO: Implement Future to fetch products on network
  Widget _section(BuildContext context, String name) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              name,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Column(
            children: List.generate(
              3,
              (index) => _row(context),
            ),
          ),
        ],
      ),
    );
  }

  // TODO: create ProductRow Widget
  Widget _row(BuildContext context) {
    return Container(
      height: 150.0,
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 140.0,
            width: 140.0,
            child: Image.asset('assets/pictures/smartphone.png'),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Google Pixel C 10"',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
                ),
                Text('4/64 Android 9.0'),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '450.000 FCFA',
                        style:
                            TextStyle(fontSize: 24.0, color: Colors.deepPurple),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: Text(
                          '-15%',
                          style: TextStyle(color: Colors.red, fontSize: 15.0),
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  '382.500 FCFA',
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  //endregion

}
