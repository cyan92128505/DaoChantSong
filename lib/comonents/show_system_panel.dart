import 'package:dao/providers/youtube_download.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
          visible: count.value > 7,
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  if (count.value > 7) {
                    ref.read(downloadListProvider.notifier).setup();
                  }
                },
                title: const Text('開發者測試-取得音樂集'),
              ),
              ...list
                  .map(
                    (e) => ListTile(
                      onTap: () {
                        ref.read(downloadListProvider.notifier).download(e);
                      },
                      title: Text(e),
                    ),
                  )
                  .toList()
            ],
          ),
        ),
      ],
    );
  }
}
