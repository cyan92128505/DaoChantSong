import 'package:dao/providers/player_screen.dart';
import 'package:file_picker_pro/file_data.dart';
import 'package:file_picker_pro/file_picker.dart';
import 'package:file_picker_pro/files.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddSongPanel extends HookConsumerWidget {
  const AddSongPanel({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFileData = useState<FileData>(FileData());

    return FilePicker(
      context: context,
      height: 100,
      fileData: currentFileData.value,
      crop: true,
      maxFileSizeInMb: 100,
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
  }
}
