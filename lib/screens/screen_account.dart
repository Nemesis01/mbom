import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbom/custom/custom_icon_card.dart';
import 'package:mbom/models/user.dart';

//TODO: Implement show/hide and animate appBar onScroll
class AccountScreen extends StatelessWidget {
  //region Member(s)
  final User user;
  final String title;
  //endregion

  //region Constructor(s)
  AccountScreen({
    Key key,
    this.title,
    this.user,
  })  : assert(user != null),
        super(key: key);
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
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          leading: IconButton(
            icon: Icon(LineIcons.arrow_left),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(title),
          backgroundColor: theme.primaryColor,
          floating: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Stack(
                fit: StackFit.loose,
                children: [
                  _header(context),
                  _avatar(context),
                  _overview(context),
                ],
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(_generateOptionsList(context)),
        )
      ],
    );
  }

  Widget _header(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      height: 150.0,
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.only(bottom: 40.0),
        padding: EdgeInsets.only(
          left: 48.0,
          right: 66.0,
        ),
        height: 200.0,
        color: theme.primaryColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              '${user.name}',
              style: theme.textTheme.display1.copyWith(color: Colors.white),
            ),
            Text(
              '${user.email}',
              style: theme.textTheme.subhead.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _avatar(BuildContext context) {
    return Positioned(
      //TODO: replace hardcoded value
      //top: 10.0,
      right: 16.0,
      height: 100.0,
      child: GestureDetector(
        child: CircleAvatar(
          radius: 40.0,
          backgroundColor: Colors.white,
          child: Text('${user.initials}', style: TextStyle(fontSize: 24.0)),
        ),
        onTap: () {
          print('circle avatar tap');
        },
      ),
    );
  }

  Widget _overview(BuildContext context) {
    return Positioned(
      left: 32.0,
      top: 85.0,
      height: 50.0,
      child: Material(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        child: Container(
          height: 60.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            //BorderRadius.circular(30.0),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  LineIcons.heart_o,
                  size: 28.0,
                  color: Colors.deepPurple,
                ),
                label: Text(
                  '14',
                  style: TextStyle(fontSize: 22.0),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  LineIcons.shopping_cart,
                  size: 32.0,
                  color: Colors.deepPurple,
                ),
                label: Text(
                  '0',
                  style: TextStyle(fontSize: 22.0),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  LineIcons.bookmark_o,
                  size: 28.0,
                  color: Colors.deepPurple,
                ),
                label: Text(
                  '3',
                  style: TextStyle(fontSize: 22.0),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ordersSection(BuildContext context) {
    return Column(
      children: <Widget>[
        //TODO: Replace hardcoded string value
        Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(
                  LineIcons.calendar_minus_o,
                  color: Colors.black,
                  size: 28.0,
                ),
                title: Text(
                  'Commandes',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
                ),
              ),
              _listTile('Historique', onTap: () {}),
              _listTile('En attente de paiement', onTap: () {}),
              _listTile('En cours de livraison', onTap: () {}),
              _listTile('Retours', onTap: () {}),
            ],
          ),
        ),
      ],
    );
  }

  Widget _listTile(
    String title, {
    Widget leading,
    Widget trailing,
    @required VoidCallback onTap,
  }) {
    return ListTile(
      leading: leading == null
          ? SizedBox(
              width: 24.0,
            )
          : leading,
      title: Text(title, style: TextStyle(fontSize: 16.0)),
      trailing: trailing ?? Icon(LineIcons.angle_right, size: 14.0),
      onTap: onTap,
      dense: true,
    );
  }

  Widget _sectionHeader(
    String title, {
    IconData icon,
    Widget trailing,
    @required VoidCallback onTap,
  }) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.black,
          size: 28.0,
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
        ),
        onTap: onTap,
      ),
    );
  }

  List<Widget> _generateOptionsList(BuildContext context) {
    final List<String> options = [
      'Mes commandes',
      'Mes adresses',
      'Mes listes de souhait',
      'Mes favoris',
      'Mon profil',
      'Portefeuille',
      'Préférences',
      'Partager',
      'Laisser un avis',
      'Suggestions',
      'Centre d\'aide',
      'Foire aux questions',
    ];

    final List<IconData> icons = [
      LineIcons.calendar_minus_o,
      LineIcons.map_marker,
      LineIcons.bookmark_o,
      LineIcons.heart_o,
      LineIcons.user,
      LineIcons.credit_card,
      LineIcons.cog,
      LineIcons.share_alt_square,
      LineIcons.exclamation,
      LineIcons.pencil,
      LineIcons.life_bouy,
      LineIcons.question,
    ];

    var list = List.generate(
      options.length,
      (index) => Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        color: Colors.white,
        child: ListTile(
          leading: Icon(
            icons[index],
            size: 28.0,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            options[index],
            style: Theme.of(context).textTheme.body2.copyWith(fontSize: 18.0),
          ),
          trailing: Icon(LineIcons.angle_right, size: 16.0),
          enabled: true,
          //TODO: move to bloc declaration
          onTap: () {
            print('ListTile tapped');
          },
        ),
      ),
    );

    list.insert(4, Container(height: 20.0));
    list.insert(10, Container(height: 20.0));
    list.insert(14, Container(height: 20.0));

    return list;
  }
}
