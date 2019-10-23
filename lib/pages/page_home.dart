import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbom/custom/tile.dart';
import 'package:mbom/models/product.dart';
import 'package:mbom/views/card_product.dart';

class HomePage extends StatelessWidget {
  Product product = Product(
      name: 'Google Pixel 4',
      price: 850000.0,
      pictures: ['assets/pictures/emulator_screenshot.png']);

  //region UI
  @override
  Widget build(BuildContext context) {
    final double paddingTop = 16.0;
    final double horizontalPadding = 8.0;

    return CupertinoScrollbar(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: paddingTop,
            left: horizontalPadding,
            right: horizontalPadding,
          ),
          decoration: BoxDecoration(
            //color: Colors.deepPurple.shade50.withOpacity(0.24),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              // topRight: Radius.circular(24.0),
            ),
          ),
          child: Column(
            //shrinkWrap: true,
            //mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Accueil'.toUpperCase(),
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.25,
                ),
                textAlign: TextAlign.start,
              ),
              banner(context),
              categories(),
              sections(),
              /*Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: sections(),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  //TODO: replace by a carousel view
  Widget banner(BuildContext context) {
    return Material(
      elevation: 4.0,
      //color: Colors.deepPurple,
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        height: 120.0,

        /*child: Text(
            'Ceci est une bannière',
            style: Theme.of(context).textTheme.display1,
          )*/
        /*decoration: BoxDecoration(
          color: Colors.deepPurple.shade50,
          borderRadius: BorderRadius.circular(16.0),
        ),*/
      ),
    );
  }

  Widget categories() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Tile(
            onTap: () {},
            icon: LineIcons.mobile_phone,
            tooltip: 'Smartphones',
          ),
          Tile(
            onTap: () {},
            icon: LineIcons.tablet,
            tooltip: 'Tablets',
          ),
          Tile(
            onTap: () {},
            icon: LineIcons.headphones,
            tooltip: 'Accessories',
          ),
          Tile(
            onTap: () {},
            icon: LineIcons.laptop,
            tooltip: 'Laptop',
          ),
          Tile(
            onTap: () {},
            icon: LineIcons.desktop,
            tooltip: 'Desktop',
          ),
          Tile(
            onTap: () {},
            icon: LineIcons.list_ul,
            tooltip: 'Toutes les catégories',
          ),
        ],
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        OutlineButton(
          onPressed: () {},
          child: Text('Smartphones'),
        ),
        OutlineButton(
          onPressed: () {},
          child: Text('Tablettes'),
        ),
        OutlineButton(
          onPressed: () {},
          child: Text('PC'),
        ),
      ],
    );
  }

  Widget sections() {
    var sectionNames = Features.values;
    return Column(
      children: List.generate(
        sectionNames.length,
        (index) => Card(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  /*leading: Icon(
                    LineIcons.flag_o,
                    color: Colors.deepPurple,
                  ),*/
                  title: Text(describeEnum(sectionNames[index])),
                ),
                Flexible(
                  child: Container(
                    height: 200.0,
                    child: ProductCard(product: product),
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text('Voir tout'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriesList(BuildContext context) {
    //TODO: Change to Map<Category, dynamic>
    final Map<IconData, String> categories = {
      LineIcons.mobile_phone: 'Téléphones',
      LineIcons.tablet: 'Tablettes',
      LineIcons.laptop: 'Ordinateurs',
      LineIcons.list_ul: 'Toutes',
    };

    final List<IconData> _icons = [
      LineIcons.mobile_phone,
      LineIcons.tablet,
      LineIcons.laptop,
      LineIcons.list_ul,
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        _icons.length,
        (int index) => Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    _icons[index],
                    size: 36.0,
                  ),
                  onPressed: () {}),
              Text(categories.values.elementAt(index)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    IconData icon,
    String title,
    Widget child,
  }) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              icon,
              color: Colors.deepPurple,
            ),
            title: Text(
              title,
              style: TextStyle(fontSize: 22.0),
            ),
            enabled: true,
          ),
          child,
        ],
      ),
    );
  }

  //endregion
}
