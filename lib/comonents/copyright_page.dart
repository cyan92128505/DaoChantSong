// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class CopyrightPage extends HookConsumerWidget {
  const CopyrightPage({super.key});

  linkOnTapHandler(String? href) async {
    try {
      final Uri url = Uri.parse(href ?? '');
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        debugPrint('Could not launch $url');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('版權聲明'),
      ),
      body: Markdown(
        data: '''
所有道教音樂資料來自「[白雲深處人家](https://homeinmists.ilotus.org/%E7%B6%B2%E7%AB%99%E5%85%AC%E5%91%8A/%E9%81%93%E6%95%99%E9%9F%B3%E6%A8%82/)」網站，中華傳統道學文化數字圖書館，創建於 2005 年 8 月 15 日。這些資料僅供個人學習研究之用，並受到原著作權人的版權保護。本應用程式尊重並遵守相關的版權法律和規定，並尊重原始資料的版權所有者。

我們對於這些道教音樂資料的使用僅限於個人學習和研究之用。如果您有任何關於版權的問題或意見，請隨時與我們聯繫。

Copyright Statement:

All Taoist music data is sourced from the "Baiyun Shenchu Renjia" website, the Digital Library of Traditional Chinese Taoist Culture, created on August 15, 2005. These data are provided for personal study and research purposes only, and are subject to copyright protection by the original copyright owner. This application respects and complies with relevant copyright laws and regulations, and respects the copyright owner of the original data.

Our use of these Taoist music data is limited to personal study and research purposes only. If you have any questions or concerns regarding copyright, please feel free to contact us.
''',
        extensionSet: MarkdownExtensionSet.githubFlavored.value,
        onTapLink: (String text, String? href, String title) =>
            linkOnTapHandler(
          href,
        ),
      ),
    );
  }
}

enum MarkdownExtensionSet { none, commonMark, githubFlavored, githubWeb }

extension MarkdownExtensionSetExtension on MarkdownExtensionSet {
  String get displayTitle => () {
        switch (this) {
          case MarkdownExtensionSet.none:
            return 'None';
          case MarkdownExtensionSet.commonMark:
            return 'Common Mark';
          case MarkdownExtensionSet.githubFlavored:
            return 'GitHub Flavored';
          case MarkdownExtensionSet.githubWeb:
            return 'GitHub Web';
        }
      }();

  md.ExtensionSet get value => () {
        switch (this) {
          case MarkdownExtensionSet.none:
            return md.ExtensionSet.none;
          case MarkdownExtensionSet.commonMark:
            return md.ExtensionSet.commonMark;
          case MarkdownExtensionSet.githubFlavored:
            return md.ExtensionSet.gitHubFlavored;
          case MarkdownExtensionSet.githubWeb:
            return md.ExtensionSet.gitHubWeb;
        }
      }();
}

extension WrapAlignmentExtension on WrapAlignment {
  String get displayTitle => () {
        switch (this) {
          case WrapAlignment.center:
            return 'Center';
          case WrapAlignment.end:
            return 'End';
          case WrapAlignment.spaceAround:
            return 'Space Around';
          case WrapAlignment.spaceBetween:
            return 'Space Between';
          case WrapAlignment.spaceEvenly:
            return 'Space Evenly';
          case WrapAlignment.start:
            return 'Start';
        }
      }();
}
