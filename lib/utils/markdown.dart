// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;

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
