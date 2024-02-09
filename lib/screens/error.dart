import 'package:flutter/material.dart';
import 'package:go_router_plus/go_router_plus.dart';

class AppErrorScreen extends Screen implements ErrorScreen {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Text(state.error as String);
  }

  @override
  String get routeName => 'error';

  @override
  String get routePath => '/error';
}
