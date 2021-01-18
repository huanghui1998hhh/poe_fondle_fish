import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poe_fondle_fish/tab/tab_navigator.dart';

class RouteName {
  static const String tab = '/';
}

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.tab:
        int index = settings.arguments;
        return CupertinoPageRoute(
          builder: (_) => MyTab(index: index == null ? 0 : index),
          settings: RouteSettings(name: RouteName.tab),
        );
      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
