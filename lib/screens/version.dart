import 'package:dao/models/route_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router_plus/go_router_plus.dart';

class VersionScreen extends Screen {
  static const RouteConfig route = RouteConfig('version', '/version');

  @override
  String get routeName => route.name;

  @override
  String get routePath => route.path;

  @override
  build(BuildContext context, GoRouterState state) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Container(),
    );
  }
}
