import 'package:dao/assets/svg.dart';
import 'package:dao/comonents/confirm_dialog.dart';
import 'package:dao/configs/theme.dart';
import 'package:dao/hooks/use_screen_size.dart';
import 'package:dao/models/song.dart';
import 'package:dao/providers/player_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

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
    final editMode = useState(false);
    final textEditingController =
        useTextEditingController(text: songItem.title);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: ratio,
          motion: const ScrollMotion(),
          children: editMode.value
              ? []
              : [
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
                        ref.read(playerViewProvider().notifier).removeSong(
                              songItem,
                            );
                      }
                    },
                    backgroundColor: AppColor.newYorkPink.value,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      editMode.value = true;
                    },
                    backgroundColor: AppColor.riptide.value,
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                  ),
                ],
        ),
        child: GestureDetector(
          onTap: () {
            if (editMode.value) {
              return;
            }
            ref.read(playerViewProvider().notifier).startPlay(
                  songItem,
                );
          },
          onDoubleTap: () async {
            if (editMode.value) {
              return;
            }

            await Share.shareXFiles(
              [
                XFile(songItem.filePath),
              ],
            );
          },
          child: Container(
            color: AppColor.pure.value,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      editMode.value
                          ? TextField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                contentPadding: EdgeInsets.zero,
                                isDense: true,
                              ),
                              controller: textEditingController,
                              textInputAction: TextInputAction.done,
                              autocorrect: false,
                              keyboardType: TextInputType.name,
                              minLines: 1,
                            )
                          : Text(
                              songItem.title,
                              style: const TextStyle(fontSize: 24),
                            ),
                      Visibility(
                        visible: editMode.value == false,
                        child: Text('播放次數：${songItem.count}'),
                      ),
                    ],
                  ),
                ),
                editMode.value
                    ? Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              ref
                                  .read(playerViewProvider().notifier)
                                  .updateSongItem(
                                    songItem.copyWith(
                                      title: textEditingController.text,
                                    ),
                                  );

                              editMode.value = false;
                            },
                            color: AppColor.riptide.value,
                            icon: const Icon(
                              Icons.check,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              editMode.value = false;
                            },
                            color: AppColor.newYorkPink.value,
                            icon: const Icon(
                              Icons.close,
                            ),
                          ),
                        ],
                      )
                    : Visibility(
                        visible: isPlay,
                        child: SvgPicture.string(
                          logoSvg(),
                          width: 32,
                          colorFilter: ColorFilter.mode(
                            AppColor.newYorkPink.value,
                            BlendMode.modulate,
                          ),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
