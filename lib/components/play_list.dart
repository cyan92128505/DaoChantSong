import 'package:dao/components/data_source_wrap.dart';
import 'package:dao/components/empty_item.dart';
import 'package:dao/components/song_tile.dart';
import 'package:dao/providers/player_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Playlist extends HookConsumerWidget {
  const Playlist({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DataSourceWrap(
      ref.watch(playerViewProvider()),
      (viewModel) {
        return Expanded(
          child: viewModel.songs.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: ReorderableListView.builder(
                    itemCount: viewModel.songs.length,
                    itemBuilder: (context, index) => SongTile(
                      key: Key(viewModel.songs[index].id),
                      isPlay: viewModel.currentSongItem?.id ==
                          viewModel.songs[index].id,
                      songItem: viewModel.songs[index],
                    ),
                    footer: const SizedBox(
                      height: 128,
                      width: double.maxFinite,
                    ),
                    onReorder:
                        ref.read(playerViewProvider().notifier).onReorder,
                  ),
                )
              : const EmptyItem(),
        );
      },
    );
  }
}
