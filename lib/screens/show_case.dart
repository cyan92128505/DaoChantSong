import 'package:dao/comonents/show_case_page.dart';
import 'package:dao/models/route_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router_plus/go_router_plus.dart';

class ShowCaseScreen extends Screen {
  static const RouteConfig route = RouteConfig('show_case', '/show_case');

  @override
  String get routeName => route.name;

  @override
  String get routePath => route.path;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ShowCasePage();
  }
}
