import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

enum Menu {
  Home,
  Smartphones,
  Tablets,
  Accessories,
  Account,
  Cart,
  Favourites,
  Wish_lists,
  Settings,
  About,
  Exit
}

class MenuPage extends StatelessWidget {
  //region members
  //final User user;
  final Menu currentMenu;
  final ValueChanged<Menu> onMenuSelected;
  final VoidCallback onLinkClicked;
  final List<IconData> icons = [
    LineIcons.home,
    LineIcons.mobile,
    LineIcons.tablet,
    LineIcons.headphones,
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
    return Column(
      children: <Widget>[
        InkWell(
          onTap: onLinkClicked,
          child: Container(
            height: 100.0,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(left: 48.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'John Doe',
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(color: Colors.white),
                ),

                //TODO: Create String entry for below hardcoded string value
                Row(
                  children: <Widget>[
                    Text(
                      'Mon profil',
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(color: Colors.white),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Icon(
                        LineIcons.angle_right,
                        color: Colors.white,
                        size: 16.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: CupertinoScrollbar(
            child: Padding(
              padding: const EdgeInsets.only(left: 0.0, top: 32.0, right: 48.0),
              child: ListView(children: _buildMenus(context)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuListItem(BuildContext context, Menu menu, IconData icon) {
    final String menuString = describeEnum(menu).contains('_')
        ? describeEnum(menu).replaceFirst('_', ' ')
        : describeEnum(menu);

    return menu == currentMenu
        ? Container(
            height: 48.0,
            padding: EdgeInsets.only(left: 32.0),
            decoration: BoxDecoration(
              color: Colors.deepPurple.withOpacity(0.12),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
            child: ListTile(
              leading: Icon(
                icon,
                size: 28.0,
                color: Colors.deepPurple,
              ),
              title: Text(
                menuString,
                style: Theme.of(context).textTheme.body2.copyWith(
                      fontSize: 18.0,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              isThreeLine: false,
              dense: true,
              contentPadding: EdgeInsets.only(left: 0.0),
              selected: true,
              enabled: true,
              onTap: () => onMenuSelected,
            ),
          )
        : Container(
            height: 48.0,
            padding: EdgeInsets.only(left: 32.0),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.0)),
            child: ListTile(
              leading: Icon(
                icon,
                size: 28.0,
                color: Colors.deepPurple,
              ),
              title: Text(
                menuString,
                style:
                    Theme.of(context).textTheme.body2.copyWith(fontSize: 18.0),
              ),
              isThreeLine: false,
              dense: true,
              contentPadding: EdgeInsets.only(left: 0.0),
              enabled: true,
              selected: false,
              onTap: () => onMenuSelected(menu),
            ),
          );
  }

  List<Widget> _buildMenus(BuildContext context) {
    List<Widget> menus = [];
    for (var menu in Menu.values)
      menus.add(_buildMenuListItem(context, menu, icons[menu.index]));

    // Adding Separators (spaces) between groups
    menus.insert(
      4,
      SizedBox(
        height: 40.0,
        child: Padding(padding: EdgeInsets.only(left: 32.0), child: Divider()),
      ),
    );
    menus.insert(
      9,
      SizedBox(
        height: 40.0,
        child: Padding(padding: EdgeInsets.only(left: 32.0), child: Divider()),
      ),
    );
    menus.insert(
      12,
      SizedBox(
        height: 40.0,
        child: Padding(padding: EdgeInsets.only(left: 32.0), child: Divider()),
      ),
    );

    return menus;
  }
  //endregion
}
