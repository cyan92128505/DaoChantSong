import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router_plus/go_router_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
  String? actionOKText,
  Widget? actionCancel,
  String? actionCancelText,
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
              ConfrimButton(
                result: false,
                child: Text(
                  actionCancelText ??
                      MaterialLocalizations.of(context).cancelButtonLabel,
                ),
              ),
          const SizedBox(
            width: 8,
          ),
          actionOK ??
              ConfrimButton(
                result: true,
                child: Text(
                  actionOKText ??
                      MaterialLocalizations.of(context).okButtonLabel,
                ),
              ),
        ],
      ),
    ),
  );

  return isConfirm ?? false;
}

class ConfrimButton extends HookConsumerWidget {
  const ConfrimButton({
    super.key,
    required this.child,
    required this.result,
  });

  final Widget child;
  final bool result;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widgetContext = useContext();
    return TextButton(
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: child,
      onPressed: () {
        if (widgetContext.canPop()) {
          widgetContext.pop(result);
        }
      },
    );
  }
}
