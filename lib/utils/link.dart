import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void linkOnTapHandler(String? href) async {
  try {
    final Uri url = Uri.parse(href ?? '');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}
