import 'package:dao/comonents/show_system_panel.dart';
import 'package:flutter/material.dart';
import 'package:go_router_plus/go_router_plus.dart';

class Setting extends Screen {
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
              children: const [
                ShowSystemPanel(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  String get routeName => 'setting';

  @override
  String get routePath => '/setting';
}
