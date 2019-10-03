import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatelessWidget {
  //region UI
  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      child: SingleChildScrollView(
        child: Container(
            child: Text('screen Size: '
                '${MediaQuery.of(context).size.width}'
                'x'
                '${MediaQuery.of(context).size.height}')),
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
