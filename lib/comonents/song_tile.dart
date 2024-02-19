import 'package:dao/comonents/confirm_dialog.dart';
import 'package:dao/configs/theme.dart';
import 'package:dao/hooks/use_screen_size.dart';
import 'package:dao/models/song.dart';
import 'package:dao/providers/player_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
    final ratio = useScreenSize().width / 4 / useScreenSize().width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: ratio,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) async {
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
              backgroundColor: AppColor.newYorkPink.value,
              foregroundColor: Colors.white,
              icon: Icons.delete,
            ),
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: AppColor.riptide.value,
              foregroundColor: Colors.white,
              icon: Icons.edit,
            ),
          ],
        ),

        // The child of the Slidable is what the user sees when the
        // component is not dragged.
        child: GestureDetector(
          child: Container(
            color: AppColor.pure.value,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        songItem.title,
                        style: const TextStyle(fontSize: 24),
                      ),
                      Text('播放次數：${songItem.count}'),
                    ],
                  ),
                ),
                Icon(
                  isPlay ? Icons.pause : Icons.play_arrow,
                )
              ],
            ),
          ),
          onTap: () {
            ref.read(playerScreenProvider().notifier).play(
                  songItem,
                );
          },
        ),
      ),
    );
  }
}
