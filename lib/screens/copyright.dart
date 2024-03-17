import 'package:dao/comonents/copyright_page.dart';
import 'package:dao/models/route_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router_plus/go_router_plus.dart';

class CopyrightScreen extends Screen implements ErrorScreen {
  static const RouteConfig route = RouteConfig('copyright', '/copyright');

  @override
  String get routeName => route.name;

  @override
  String get routePath => route.path;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CopyrightPage();
  }
}
