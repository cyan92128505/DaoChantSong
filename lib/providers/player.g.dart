// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playerHash() => r'083538b6b39ab21b5c06381c13dc8acebd15fd27';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$Player extends BuildlessAsyncNotifier<PlayerViewModel> {
  late final SongHiveRepository? repository;
  late final AudioPlayer? audioPlayer;

  FutureOr<PlayerViewModel> build({
    SongHiveRepository? repository,
    AudioPlayer? audioPlayer,
  });
}

/// See also [Player].
@ProviderFor(Player)
const playerProvider = PlayerFamily();

/// See also [Player].
class PlayerFamily extends Family<AsyncValue<PlayerViewModel>> {
  /// See also [Player].
  const PlayerFamily();

  /// See also [Player].
  PlayerProvider call({
    SongHiveRepository? repository,
    AudioPlayer? audioPlayer,
  }) {
    return PlayerProvider(
      repository: repository,
      audioPlayer: audioPlayer,
    );
  }

  @override
  PlayerProvider getProviderOverride(
    covariant PlayerProvider provider,
  ) {
    return call(
      repository: provider.repository,
      audioPlayer: provider.audioPlayer,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'playerProvider';
}

/// See also [Player].
class PlayerProvider
    extends AsyncNotifierProviderImpl<Player, PlayerViewModel> {
  /// See also [Player].
  PlayerProvider({
    SongHiveRepository? repository,
    AudioPlayer? audioPlayer,
  }) : this._internal(
          () => Player()
            ..repository = repository
            ..audioPlayer = audioPlayer,
          from: playerProvider,
          name: r'playerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playerHash,
          dependencies: PlayerFamily._dependencies,
          allTransitiveDependencies: PlayerFamily._allTransitiveDependencies,
          repository: repository,
          audioPlayer: audioPlayer,
        );

  PlayerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.repository,
    required this.audioPlayer,
  }) : super.internal();

  final SongHiveRepository? repository;
  final AudioPlayer? audioPlayer;

  @override
  FutureOr<PlayerViewModel> runNotifierBuild(
    covariant Player notifier,
  ) {
    return notifier.build(
      repository: repository,
      audioPlayer: audioPlayer,
    );
  }

  @override
  Override overrideWith(Player Function() create) {
    return ProviderOverride(
      origin: this,
      override: PlayerProvider._internal(
        () => create()
          ..repository = repository
          ..audioPlayer = audioPlayer,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        repository: repository,
        audioPlayer: audioPlayer,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<Player, PlayerViewModel> createElement() {
    return _PlayerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerProvider &&
        other.repository == repository &&
        other.audioPlayer == audioPlayer;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, repository.hashCode);
    hash = _SystemHash.combine(hash, audioPlayer.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PlayerRef on AsyncNotifierProviderRef<PlayerViewModel> {
  /// The parameter `repository` of this provider.
  SongHiveRepository? get repository;

  /// The parameter `audioPlayer` of this provider.
  AudioPlayer? get audioPlayer;
}

class _PlayerProviderElement
    extends AsyncNotifierProviderElement<Player, PlayerViewModel>
    with PlayerRef {
  _PlayerProviderElement(super.provider);

  @override
  SongHiveRepository? get repository => (origin as PlayerProvider).repository;
  @override
  AudioPlayer? get audioPlayer => (origin as PlayerProvider).audioPlayer;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
