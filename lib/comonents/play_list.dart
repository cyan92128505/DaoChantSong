import 'package:dao/comonents/data_source_wrap.dart';
import 'package:dao/providers/player.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Playlist extends HookConsumerWidget {
  const Playlist({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DataSourceWrap(ref.watch(playerProvider()), (viewModel) {
      return Expanded(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: viewModel.playlist?.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${viewModel.playlist?[index]}'),
            );
          },
        ),
      ));
    });
  }
}
