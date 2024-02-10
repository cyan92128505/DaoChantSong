import 'package:flutter/material.dart';
import 'package:go_router_plus/go_router_plus.dart';

/// The `title` argument is used to title of alert dialog.
/// The `content` argument is used to content of alert dialog.
/// The `textOK` argument is used to text for 'OK' Button of alert dialog.
/// The `textCancel` argument is used to text for 'Cancel' Button of alert
/// dialog.
///
/// Returns a [Future<bool>].
Future<bool> confirm(
  BuildContext context, {
  Widget? title,
  Widget? content,
  Widget? actionOK,
  Widget? actionCancel,
}) async {
  final isConfirm = await showDialog<bool>(
    context: context,
    builder: (_) => PopScope(
      child: AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        titlePadding: const EdgeInsets.all(24).copyWith(bottom: 0),
        contentPadding: const EdgeInsets.all(24).copyWith(top: 8),
        actionsPadding: const EdgeInsets.only(right: 24, bottom: 24),
        title: title,
        content: SingleChildScrollView(
          child: content ?? const Text('Are you sure continue?'),
        ),
        actions: <Widget>[
          actionCancel ??
              TextButton(
                style: TextButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  MaterialLocalizations.of(context).cancelButtonLabel,
                ),
                onPressed: () {
                  if (context.canPop()) {
                    context.pop(false);
                  }
                },
              ),
          const SizedBox(
            width: 8,
          ),
          actionOK ??
              TextButton(
                style: TextButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  MaterialLocalizations.of(context).okButtonLabel,
                ),
                onPressed: () {
                  if (context.canPop()) {
                    context.pop(true);
                  }
                },
              ),
        ],
      ),
    ),
  );

  return isConfirm ?? false;
}