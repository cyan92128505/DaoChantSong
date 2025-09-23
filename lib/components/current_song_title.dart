import 'package:dao/components/data_source_wrap.dart';
import 'package:dao/providers/player_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CurrentSongTitle extends HookConsumerWidget {
  const CurrentSongTitle({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DataSourceWrap(
      ref.watch(playerViewProvider()),
      (viewModel) {
        return SizedBox(
          height: 64,
          width: double.maxFinite,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  viewModel.currentSongItem?.title ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
              Visibility(
                visible: viewModel.currentSongItem != null,
                child: IconButton(
                  iconSize: 32,
                  onPressed: () {
                    viewModel.playerState == PlayerState.playing
                        ? ref.read(playerViewProvider().notifier).pause()
                        : ref.read(playerViewProvider().notifier).play();
                  },
                  icon: Icon(
                    viewModel.playerState == PlayerState.playing
                        ? Icons.pause
                        : Icons.play_arrow,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
