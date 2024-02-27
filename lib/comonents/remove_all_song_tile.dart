import 'package:dao/providers/player_screen.dart';
import 'package:dao/providers/youtube_download.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RemoveAllSongTile extends HookConsumerWidget {
  const RemoveAllSongTile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final touched = useState(false);
    return ListTile(
      title: const Text('刪除所有測試音樂'),
      onTap: () async {
        if (touched.value) {
          return;
        }
        touched.value = true;
        await ref.read(playerScreenProvider().notifier).removeAllSong();
        ref.read(downloadListProvider.notifier).setup();
        touched.value = false;
      },
    );
  }
}
