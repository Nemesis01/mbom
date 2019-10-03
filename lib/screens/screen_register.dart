import 'package:flutter/material.dart';
import 'package:mbom/custom/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
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
          : Stack(
              children: [
                Row(
                  children: <Widget>[
                    Flexible(child: _buildLogoAndAppName(context)),
                    Flexible(
                        //flex: 2,
                        child: Container(
                            height: double.infinity,
                            color: Colors.deepPurpleAccent,
                            child: _buildForm(context))),
                  ],
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
    double horizontalPadding = width * 0.12;

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      shrinkWrap: true,
      children: <Widget>[
        CustomTextField(hintText: 'Votre nom...', label: 'Nom complet'),
        CustomTextField(
            hintText: 'Entrer votre mot de passe ici', label: 'mot de passe'),
        RaisedButton(
          onPressed: () {},
          child: Text('Register'),
        ),
      ],
    );
  }
}
