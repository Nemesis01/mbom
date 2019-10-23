/*
 * Copyright (c) 2019. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SmartphonesPage extends StatelessWidget {
  //region UI
  @override
  Widget build(BuildContext context) {
    return portrait(context);
  }

  Widget portrait(BuildContext context) {
    return CupertinoScrollbar(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Tiles(context),
              heading(context),
              heading_2(context),
              heading_2(context),
              heading_2(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget landscape(BuildContext context, Size screenSize) {}

  Widget Tiles(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisSpacing: 4.0,
      childAspectRatio: 1.5,
      crossAxisCount: 2,
      children: <Widget>[
        Tile(
          label: 'neufs',
          child: Image.asset(
            'assets/pictures/smartphone.png',
            //width: MediaQuery.of(context).size.width * 0.35,
            //height: MediaQuery.of(context).size.width * 0.35,
            scale: 0.5,
          ),
        ),
        Tile(
          label: 'reconditionnés',
          child: Image.asset('assets/pictures/smartphone_off.png'),
        ),
      ],
    );
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Tile(
            label: 'neufs dévérouillés',
            child: Image.asset('assets/pictures/smartphone.png'),
          ),
          Tile(
            label: 'reconditionnés certifiés',
            child: Image.asset('assets/pictures/smartphone_off.png'),
          ),
        ],
      ),
    );
  }

  Widget headings(BuildContext context) {
    return Column();
  }

  Widget heading(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ListTile(
              title: Text(
            'Eléments associés',
            style: Theme.of(context).textTheme.title,
          )),
          GridView.count(
            crossAxisSpacing: 2.0,
            shrinkWrap: true,
            //scrollDirection: Axis.horizontal,
            crossAxisCount: 3,
            children: <Widget>[
              Tile(
                compact: true,
                label: 'etuis et \nProtections\n',
                child: Image.asset('assets/pictures/smartphone_off.png'),
              ),
              Tile(
                compact: true,
                label: 'Chargeurs et Battéries',
                child: Image.asset(
                  'assets/pictures/smartphone.png',
                ),
              ),
              Tile(
                compact: true,
                label: 'casques et écouteurs',
                child: Image.asset('assets/pictures/smartphone_off.png'),
              ),
              /*Tile(
                compact: true,
                label: 'Accesoires\n',
                child: Image.asset('assets/pictures/smartphone_off.png'),
              ),*/
            ],
          ),
        ],
      ),
    );
  }

  Widget heading_2(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ListTile(
            title: Text(
              'Meilleures ventes',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: List.generate(
              3,
              (index) => ListTile(
                leading: Icon(LineIcons.trophy, size: 50.0),
                title: Text('product'),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget Tile({String label, Widget child, bool compact = false}) {
    return Material(
      child: InkWell(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: child,
                flex: 1,
              ),
              SizedBox(height: 4.0),
              Text(
                label.toUpperCase(),
                style: TextStyle(
                  fontSize: compact ? 14.0 : 17.0,
                  color: Colors.black54,
                  letterSpacing: compact ? .0 : 1.5,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //endregion

}
