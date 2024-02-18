import 'package:dao/comonents/confirm_dialog.dart';
import 'package:dao/models/song.dart';
import 'package:dao/providers/player_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SongTile extends HookConsumerWidget {
  const SongTile({
    super.key,
    required this.songItem,
    required this.isPlay,
  });

  final SongItem songItem;
  final bool isPlay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(songItem.title),
      trailing: Icon(
        isPlay ? Icons.pause : Icons.play_arrow,
      ),
      onLongPress: () async {
        final result = await confirm(
          context,
          title: Text('要刪除 ${songItem.title} ？'),
          content: Container(),
          actionOKText: '確定',
          actionCancelText: '取消',
        );
        if (result) {
          ref.read(playerScreenProvider().notifier).removeSong(
                songItem,
              );
        }
      },
      onTap: () {
        ref.read(playerScreenProvider().notifier).play(
              songItem,
            );
      },
    );
  }
}
