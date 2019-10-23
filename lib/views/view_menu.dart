import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

enum Menu {
  Home,
  Smartphones,
  Tablets,
  Accessories,
  All_Categories,
  My_mbom,
  Cart,
  Favourites,
  Wish_lists,
  Settings,
  About,
  Exit
}

enum MenuPageType { Extended, Modal }

class MenuPage extends StatelessWidget {
  //region members
  //final User user;
  final MenuPageType type;
  final Menu currentMenu;
  final ValueChanged<Menu> onMenuSelected;
  final VoidCallback onLinkClicked;
  final List<IconData> icons = [
    LineIcons.home,
    LineIcons.mobile,
    LineIcons.tablet,
    LineIcons.headphones,
    LineIcons.list_ul,
    LineIcons.user,
    LineIcons.shopping_cart,
    LineIcons.heart_o,
    LineIcons.bookmark_o,
    LineIcons.gear,
    LineIcons.exclamation,
    LineIcons.sign_out,
  ];
  //endregion

  //region Constructor(s)
  MenuPage({
    Key key,
    this.type = MenuPageType.Modal,
    @required this.currentMenu,
    @required this.onMenuSelected,
    @required this.onLinkClicked,
  })  : assert(currentMenu != null),
        assert(onMenuSelected != null),
        assert(onLinkClicked != null);
  //endregion

  //region UI Methods
  @override
  Widget build(BuildContext context) {
    final headerHeight = type == MenuPageType.Modal ? 100.0 : 120.0;
    final paddingLeft = type == MenuPageType.Modal ? 32.0 : 16.0;

    return Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor.withOpacity(0.12),
          /* gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple.withOpacity(0.12), Colors.white],
            tileMode: TileMode.clamp,
          ),*/
        ),

        //width: MediaQuery.of(context).size.width < 600 ? double.infinity : 240.0,
        child: Column(
          children: <Widget>[
            Material(
              child: InkWell(
                onTap: onLinkClicked,
                //TODO: create a Widget returning function called _header to handle that container
                child: Container(
                  //TODO: create an entry in dimens file for hardcoded double values
                  height: headerHeight,
                  width: double.infinity,
                  color: Colors.grey.shade50,
                  //color: Theme.of(context).accentColor.withOpacity(0.12),
                  padding: EdgeInsets.only(left: paddingLeft),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Calamity Jane',
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(color: Colors.deepPurple),
                      ),

                      //TODO: Create String entry for below hardcoded string value
                      Row(
                        children: <Widget>[
                          Text(
                            'Mon profil',
                            style:
                                Theme.of(context).textTheme.subhead.copyWith(),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Icon(
                              LineIcons.angle_right,
                              //color: Colors.white,
                              size: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //SizedBox(height: 32.0),
            Expanded(
              child: type == MenuPageType.Modal
                  ? CupertinoScrollbar(
                      child: Container(
                        //padding: EdgeInsets.only(top: 32.0),
                        color: Colors.white,
                        child: ListView(
                          children: _buildMenus(context),
                          padding: EdgeInsets.only(
                              top: 16.0, right: 32.0, bottom: 64.0),
                        ),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Column(
                        children: _buildMenus(context),
                      ),
                    ),
            ),
          ],
        ),
      ),
      Positioned(
        bottom: 0.0,
        left: 0.0,
        right: 0.0,
        child: Visibility(
          visible: type == MenuPageType.Extended ? true : false,
          child: Container(
            color: Colors.deepPurple,
            height: 52.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  padding: EdgeInsets.all(0.0),
                  icon: Icon(
                    LineIcons.envelope_o,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                  //TODO: Hardcoded String value
                  tooltip: 'Inbox',
                ),
                IconButton(
                  icon: Icon(LineIcons.cog),
                  onPressed: () {}, //TODO: Hardcoded String value
                  tooltip: 'Inbox',
                ),
                IconButton(
                  icon: Icon(LineIcons.sign_out),
                  onPressed: () {}, //TODO: Hardcoded String value
                  tooltip: 'Inbox',
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  Widget _buildMenuListItem(BuildContext context, Menu menu, IconData icon) {
    final iconSize = type == MenuPageType.Modal ? 28.0 : 22.0;
    final paddingLeft = type == MenuPageType.Modal ? 48.0 : 16.0;
    final height = type == MenuPageType.Modal ? 48.0 : 36.0;
    final fontSize = type == MenuPageType.Modal ? 18.0 : 16.0;
    final textStyle = Theme.of(context).textTheme.body2.copyWith(
          fontSize: fontSize,
          color: menu == currentMenu
              ? Theme.of(context).accentColor
              : Colors.black,
          //fontWeight: FontWeight.w500,
        );

    final String menuString = describeEnum(menu).contains('_')
        ? describeEnum(menu).replaceFirst('_', ' ')
        : describeEnum(menu);

    return Material(
      color: menu == currentMenu
          ? Theme.of(context).accentColor.withOpacity(0.24)
          : Colors.transparent,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(30.0),
        bottomRight: Radius.circular(30.0),
      ),
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(right: paddingLeft),
          height: height,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: paddingLeft + 8.0, right: 32.0),
                child: Icon(
                  icon,
                  //color: Theme.of(context).primaryColor,
                  size: iconSize,
                ),
              ),
              Text(menuString, style: textStyle),
            ],
          ),
        ),
        onTap: () => onMenuSelected(menu),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
        //hoverColor: Colors.deepPurple.shade50,
        onHover: (isHover) {},
      ),
    );
  }

  List<Widget> _buildMenus(BuildContext context) {
    final separatorHeight = type == MenuPageType.Modal ? 40.0 : 24.0;

    List<Widget> menus = [];
    for (var menu in Menu.values)
      menus.add(_buildMenuListItem(context, menu, icons[menu.index]));

    // Adding Separators (spaces) between groups
    menus.insert(
      5,
      SizedBox(
        //TODO: hardcoded double values
        height: separatorHeight,
        child: Padding(padding: EdgeInsets.only(left: 32.0), child: Divider()),
      ),
    );
    menus.insert(
      10,
      SizedBox(
        height: separatorHeight,
        child: Padding(padding: EdgeInsets.only(left: 32.0), child: Divider()),
      ),
    );
    menus.insert(
      13,
      SizedBox(
        height: separatorHeight,
        child: Padding(padding: EdgeInsets.only(left: 16.0), child: Divider()),
      ),
    );

    return menus;
  }
  //endregion

  String get menuString => describeEnum(currentMenu).contains('_')
      ? describeEnum(currentMenu).replaceFirst('_', ' ')
      : describeEnum(currentMenu);
}
