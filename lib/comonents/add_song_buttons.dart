import 'package:dao/providers/player_screen.dart';
import 'package:file_picker_pro/file_data.dart';
import 'package:file_picker_pro/files.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddSongButton extends HookConsumerWidget {
  const AddSongButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFileData = useState<FileData>(FileData());

    return IconButton(
      iconSize: 64,
      icon: const Icon(
        Icons.add,
      ),
      onPressed: () async {
        await Files.filePickerOptions(
          context: context,
          fileData: currentFileData.value,
          fileMode: FileMode.file,
          allowedExtensions: const [
            Files.mp4,
            Files.mp3,
          ],
          onSelected: (fileData) {
            currentFileData.value = fileData;
            ref.read(playerScreenProvider().notifier).addSong(fileData);
          },
          onCancel: (message, messageCode) {},
        );
      },
    );
  }
}
