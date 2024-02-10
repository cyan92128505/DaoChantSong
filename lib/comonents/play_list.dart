import 'package:dao/comonents/confirm_dialog.dart';
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
            itemCount: viewModel.songs.length,
            itemBuilder: (context, index) {
              final isPlay =
                  viewModel.currentSongItem?.id == viewModel.songs[index].id;
              return ListTile(
                title: Text(viewModel.songs[index].title),
                trailing: Icon(
                  isPlay ? Icons.pause : Icons.play_arrow,
                ),
                onLongPress: () async {
                  final result = await confirm(context);
                  if (result) {
                    ref.read(playerProvider().notifier).removeSong(
                          viewModel.songs[index],
                        );
                  }
                },
                onTap: () {
                  ref.read(playerProvider().notifier).play(
                        viewModel.songs[index],
                      );
                },
              );
            },
          ),
        ),
      );
    });
  }
}
