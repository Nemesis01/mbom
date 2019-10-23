import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbom/custom/custom_text_field.dart';
import 'package:mbom/custom/custom_tile.dart';

class ProfileScreen extends StatelessWidget {
  //region Fields
  final String title;
  //final User user;
  //endregion

  //region Constructor(s)
  ProfileScreen({
    Key key,
    this.title = 'Profile',
  }) : super(key: key);
  //endregion

  //region
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    //MediaQuery.of(context).devicePixelRatio

    //MediaQuery.of(context).

    return Scaffold(
      /*appBar: AppBar(
        elevation: 0.0,
      ),*/
      body: SafeArea(
        top: true,
        bottom: true,
        child: _buildBody(context, size),
      ),
    );
  }
  //endregion

  //region UI
  Widget _buildBody(BuildContext context, Size screenSize) {
    double width = screenSize.width;

    return Container(
      child:
          width < 600 ? _portrait(context, width) : _landscape(context, width),
    );
  }

  Widget _portrait(BuildContext context, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AppBar(
          leading: BackButton(),
          title: Text(this.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(LineIcons.edit),
              onPressed: () {},
            ),
          ],
          //centerTitle: true,
          elevation: 0.0,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          color: Colors.deepPurple.withOpacity(0.12),
          child: Row(
            children: <Widget>[
              Expanded(child: _userName(context)),
              _avatar(context, width),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: _buildContent(context),
        ),
        Padding(
          padding: EdgeInsets.zero,
        )
      ],
    );
  }

  Widget _landscape(BuildContext context, double width) {
    return Row(
      children: <Widget>[
        Flexible(
          child: SizedBox(
            width: 280.0,
            child: Container(
              color: Colors.deepPurple.withOpacity(0.12),
              child: Column(
                children: <Widget>[
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                  ),
                  _avatar(context, width),
                  _userName(context),
                ],
              ),
            ),
          ),
        ),
        Expanded(child: _buildContent(context)),
      ],
    );
  }

  Widget _avatar(BuildContext context, double width) {
    return CircleAvatar(
      radius: width < 600 ? 40.0 : 80.0,
      backgroundColor: Theme.of(context).primaryColor,
      child: Text(
        'CJ',
        style: TextStyle(
          fontSize: 25.0,
          letterSpacing: 2.0,
        ),
      ),
    );
  }

  Widget _userName(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        //TODO: alignment should depend on screen width in order to fit Responsive design goals
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Calamity Jane',
            style:
                Theme.of(context).textTheme.headline.copyWith(fontSize: 32.0),
          ),
          Text(
            'calamity.jane@western.us',
            style: Theme.of(context).textTheme.subhead,
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: <Widget>[
        MediaQuery.of(context).size.width > 600
            ? AppBar(
                elevation: 0.0,
                backgroundColor: Colors.white,
                leading: BackButton(),
                actions: <Widget>[
                  IconButton(icon: Icon(LineIcons.edit), onPressed: () {})
                ],
              )
            : SizedBox(height: 0.0),
        Text('Informations personnelles'),
        CustomListTile(
          icon: LineIcons.user,
          child: CustomTextField(
            label: 'Username',
            initialValue: 'Calamity Jane',
          ),
        ),
        CustomListTile(
          icon: LineIcons.envelope_o,
          child: CustomTextField(
            label: 'email',
            initialValue: 'calamity.jane@western.ussalabama',
          ),
        ),
        CustomListTile(
          icon: LineIcons.unlock_alt,
          child: CustomTextField(
            type: TextFieldType.PASSWORD,
            label: 'password',
            initialValue: 'Calamity Jane',
          ),
        ),
      ],
    );
  }

  Widget _buildCenterPanel(BuildContext context) {
    return Scrollbar(
      child: Column(
        children: <Widget>[
          Card(
            child: Stack(children: [
              Positioned(
                right: -24.0,
                top: 0.0,
                child: Icon(
                  CupertinoIcons.person,
                  size: 128.0,
                  color: Theme.of(context).iconTheme.color.withOpacity(0.12),
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  CustomTextField(label: 'nom', hintText: 'Calamity Jane'),
                  CustomTextField(
                      label: 'adresse électronique',
                      hintText: 'calamity.jane@western.us'),
                  CustomTextField(
                      label: 'mot de passe :', hintText: 'Calamity Jane'),
                ],
              ),
            ]),
          ),
          Card(
            child: Stack(children: [
              Positioned(
                right: -24.0,
                top: 0.0,
                child: Icon(
                  CupertinoIcons.person,
                  size: 128.0,
                  color: Theme.of(context).iconTheme.color.withOpacity(0.12),
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  CustomTextField(label: 'nom', hintText: 'Calamity Jane'),
                  CustomTextField(
                      label: 'adresse électronique',
                      hintText: 'calamity.jane@western.us'),
                  CustomTextField(
                      label: 'mot de passe :', hintText: 'Calamity Jane'),
                ],
              ),
            ]),
          ),
          Card(
            child: Stack(children: [
              Positioned(
                right: -24.0,
                top: 0.0,
                child: Icon(
                  CupertinoIcons.person,
                  size: 128.0,
                  color: Theme.of(context).iconTheme.color.withOpacity(0.12),
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  CustomTextField(label: 'nom', hintText: 'Calamity Jane'),
                  CustomTextField(
                      label: 'adresse électronique',
                      hintText: 'calamity.jane@western.us'),
                  CustomTextField(
                      label: 'mot de passe :', hintText: 'Calamity Jane'),
                ],
              ),
            ]),
          ),
          Card(
            child: Stack(children: [
              Positioned(
                right: -24.0,
                top: 0.0,
                child: Icon(
                  CupertinoIcons.person,
                  size: 128.0,
                  color: Theme.of(context).iconTheme.color.withOpacity(0.12),
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  CustomTextField(label: 'nom', hintText: 'Calamity Jane'),
                  CustomTextField(
                      label: 'adresse électronique',
                      hintText: 'calamity.jane@western.us'),
                  CustomTextField(
                      label: 'mot de passe :', hintText: 'Calamity Jane'),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }

  //endregion

}
