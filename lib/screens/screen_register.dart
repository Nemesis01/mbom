import 'package:flutter/material.dart';
import 'package:mbom/custom/custom_text_field.dart';
import 'package:mbom/models/user.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        body: SafeArea(
          top: true,
          bottom: true,
          child: _buildBody(context),
        ),
      ),
    );
  }

  //region UI
  Widget _buildBody(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);

    double width = media.size.width;
    double horizontalPadding = width * 0.12;

    return Container(
      //color: Theme.of(context).primaryColor,
      child: width < 600
          ? Stack(
              children: [
                ListView(
                  children: <Widget>[
                    SizedBox(height: 120.0),
                    _buildLogoAndAppName(context),
                    _buildForm(context),
                  ],
                ),
              ],
            )
          : Row(
              children: <Widget>[
                Flexible(flex: 2, child: _buildLogoAndAppName(context)),
                Flexible(
                  child: SizedBox(
                    height: 400.0,
                    width: 1.0,
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    //width: 400,
                    child: _buildForm(context),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildLogoAndAppName(BuildContext context) {
    return Container(
      width: 320.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Image.asset(
              'assets/images/mbom_light.png',
              //fit: BoxFit.fill,
              width: 120.0,
              height: 120.0,
            ),
          ),
          // FlutterLogo(size: 90.0),
          Text(
            'mbom\'',
            style: Theme.of(context).textTheme.display2.copyWith(
                  color: Color.fromARGB(255, 125, 42, 130),
                  fontFamily: 'EncodeSans',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -2.0,
                ),
          ),
          Text(
            'À chacun son mbom',
            style: Theme.of(context).textTheme.subhead,
          ),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);

    double width = media.size.width;
    double horizontalPadding = width * 0.1;

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      shrinkWrap: true,
      children: <Widget>[
        CustomTextField(
            controller: nameController,
            hintText: 'Entrer votre nom ici',
            label: 'Nom complet'),
        CustomTextField(
          hintText: 'Entrer votre adresse électronique',
          label: 'Adresse électronique',
        ),
        CustomTextField(
          type: TextFieldType.PASSWORD,
          hintText: 'Entrer votre mot de passe ici',
          label: 'mot de passe',
        ),
        CustomTextField(
          type: TextFieldType.PASSWORD,
          hintText: 'Confirmer votre mot de passe',
          label: 'confirmation',
        ),
        RaisedButton(
          onPressed: () => _register(context),
          child: Text('Register'),
        ),
      ],
    );
  }
  //endregion

  void _register(BuildContext context) {
    print('registering......');
    Navigator.of(context).pushNamed(
      '/profile',
      arguments: User(name: 'Calamity Jane', email: 'sahlbr@habsj.cn'),
    );
  }
}
