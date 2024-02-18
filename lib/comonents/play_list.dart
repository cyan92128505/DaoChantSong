import 'package:dao/comonents/data_source_wrap.dart';
import 'package:dao/comonents/empty_item.dart';
import 'package:dao/comonents/song_tile.dart';
import 'package:dao/providers/player_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Playlist extends HookConsumerWidget {
  const Playlist({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DataSourceWrap(
      ref.watch(playerScreenProvider()),
      (viewModel) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: viewModel.songs.length > 0
                ? ListView.builder(
                    itemCount: viewModel.songs.length,
                    itemBuilder: (context, index) => SongTile(
                      isPlay: viewModel.currentSongItem?.id ==
                          viewModel.songs[index].id,
                      songItem: viewModel.songs[index],
                    ),
                  )
                : const EmptyItem(),
          ),
        );
      },
    );
  }
}
