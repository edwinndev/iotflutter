import 'package:flutter/material.dart';
import 'package:iot/pages/home.page.dart';

class Routes {
  static const String splash         = '';
  static const String home           = 'home';
  static const String devices        = 'devices';
  static const String topics         = 'topics';
  static const String subscriptions  = 'subscriptions';
  static const String users          = 'users';

  static  Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    splash : (context) => const HomePage(), 
    home   : (context) => const HomePage(),
  };
}