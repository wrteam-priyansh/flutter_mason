import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static const String splash = "splash";
  static const String home = "/";
  static const String login = "login";
  static String currentRoute = splash;

  static Route<dynamic> onGenerateRouted(RouteSettings routeSettings) {
    currentRoute = routeSettings.name ?? "";

    switch (routeSettings.name) {
      case splash:
        {
          return CupertinoPageRoute(
              builder: (_) => SplashScreen()); //Splash screen
        }
      case login:
        {
          return LoginScreen.route(routeSettings); //Splash screen
        }

      case home:
        {
          return HomeScreen.route(routeSettings);
        }
      default:
        {
          return CupertinoPageRoute(builder: (context) => const Scaffold());
        }
    }
  }
}
