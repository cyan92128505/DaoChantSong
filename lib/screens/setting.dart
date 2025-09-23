import 'package:dao/components/show_system_panel.dart';
import 'package:dao/models/route_config.dart';
import 'package:dao/screens/copyright.dart';
import 'package:dao/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:go_router_plus/go_router_plus.dart';

class SettingScreen extends Screen {
  static const RouteConfig route = RouteConfig('setting', '/setting');

  @override
  String get routeName => route.name;

  @override
  String get routePath => route.path;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('設定'),
        leading: const BackButton(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Text('整合經典教學'),
                  onTap: () {
                    context.push(OnboardingScreen.route.path);
                  },
                ),
                ListTile(
                  title: const Text('版權聲明'),
                  onTap: () {
                    context.push(CopyrightScreen.route.path);
                  },
                ),
                const ShowSystemPanel(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
