import 'package:dao/comonents/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef DataRender<T> = Widget Function(T data);

class DataSourceWrap<T> extends HookConsumerWidget {
  const DataSourceWrap(
    this.dataSouce,
    this.render, {
    super.key,
    this.placeholder,
  });

  final AsyncValue<T> dataSouce;
  final DataRender<T> render;
  final Widget? placeholder;

  @override
  Widget build(BuildContext context, ref) {
    return dataSouce.when(
      data: render,
      error: (error, s) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SelectableText("Error: $error"),
          ),
        );
      },
      loading: () {
        return placeholder ?? const AppProgressIndicator();
      },
    );
  }
}
