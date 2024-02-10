import 'package:just_audio/just_audio.dart';

class AudioPlayerService {
  final AudioPlayer player;
  AudioPlayerService({
    required this.player,
  });
}

final audioPlayerService = AudioPlayerService(player: AudioPlayer());
