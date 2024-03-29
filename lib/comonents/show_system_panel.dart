import 'package:dao/comonents/remove_all_song_tile.dart';
import 'package:dao/models/remote_song.dart';
import 'package:dao/providers/youtube_download.dart';
import 'package:dao/screens/splash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router_plus/go_router_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShowSystemPanel extends HookConsumerWidget {
  const ShowSystemPanel({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = useState(0);
    final list = ref.watch(downloadListProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: const Text('版本：1.0.0'),
          onTap: () {
            count.value = count.value + 1;
          },
        ),
        Visibility(
          visible: kDebugMode,
          child: ListTile(
            title: const Text('GoTo Splash'),
            onTap: () {
              context.go(SplashScreen.route.path);
            },
          ),
        ),
        Visibility(
          visible: count.value > 7,
          child: Column(
            children: [
              ListTile(
                onTap: () async {
                  if (count.value > 7) {
                    await ref.read(downloadListProvider.notifier).setup();
                    await ref.read(downloadListProvider.notifier).downloadAll();
                  }
                },
                title: const Text('開發者測試-取得音樂集'),
              ),
              ...list
                  .map(
                    (e) => ListTile(
                      onTap: () {
                        ref.read(downloadListProvider.notifier).download(e.id);
                      },
                      title: Text(e.title),
                      subtitle: LinearProgressIndicator(
                        value: e.process / RemoteSong.maxProcess,
                      ),
                    ),
                  )
                  .toList(),
              const RemoveAllSongTile(),
            ],
          ),
        ),
      ],
    );
  }
}
