import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mbom/models/user.dart';
import 'package:mbom/screens/screen_home.dart';
import 'package:mbom/screens/screen_account.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Setting status bar color
    /* SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.deepPurple,
        statusBarIconBrightness: Brightness.dark,
      ),
    );*/

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        fontFamily: 'Dosis',
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.deepPurple,
        accentColor: Colors.white,
        textTheme: TextTheme(
          display4: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 96.0,
            letterSpacing: -1.5,
          ),
          display3: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 60.0,
            letterSpacing: -0.5,
          ),
          display2: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 48.0,
            letterSpacing: 0.0,
          ),
          display1: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 34.0,
            letterSpacing: 0.25,
          ),
          headline: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 24.0,
            letterSpacing: 0.0,
          ),
          title: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
            letterSpacing: 0.15,
          ),
          subhead: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
            letterSpacing: 0.15,
          ),
          subtitle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
            letterSpacing: 0.10,
          ),
          body2: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
            letterSpacing: 0.50,
          ),
          body1: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            letterSpacing: 0.25,
          ),
          button: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
            letterSpacing: 1.25,
          ),
          caption: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12.0,
            letterSpacing: 0.40,
          ),
          overline: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 10.0,
            letterSpacing: 1.50,
          ),
        ),
      ),
      home: HomeScreen(),
      onGenerateRoute: _getRoute,
    );
  }

  //region Navigation Methods
  Route _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _buildRoute(settings, new HomeScreen());
      case '/profile':
        return _buildRoute(
          settings,
          //TODO: replace String hardcoded value
          new AccountScreen(
            title: 'Mon Mbom',
            user: settings.arguments as User,
          ),
        );
      default:
        return _buildRoute(settings, new HomeScreen());
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return new MaterialPageRoute(
      builder: (BuildContext context) => builder,
      settings: settings,
    );
  }
  //endregion

}
