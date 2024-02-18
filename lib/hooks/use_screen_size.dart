import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Size useScreenSize({
  List<Object?>? keys,
}) {
  return use(
    _ScreenSizeHook(
      keys: keys,
    ),
  );
}

class _ScreenSizeHook extends Hook<Size> {
  const _ScreenSizeHook({
    super.keys,
  });

  @override
  HookState<Size, Hook<Size>> createState() => _ScreenSizeHookState();
}

class _ScreenSizeHookState extends HookState<Size, _ScreenSizeHook> {
  @override
  Size build(BuildContext context) => MediaQuery.of(context).size;

  @override
  String get debugLabel => 'useScreenSize';
}
