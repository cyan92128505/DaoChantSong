// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playerScreenHash() => r'd62d5ee968c75100b65935b07b34ef105099703b';

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

abstract class _$PlayerScreen
    extends BuildlessAutoDisposeAsyncNotifier<PlayerViewModel> {
  late final SongHiveRepository? repository;
  late final AudioPlayer? audioPlayer;

  FutureOr<PlayerViewModel> build({
    SongHiveRepository? repository,
    AudioPlayer? audioPlayer,
  });
}

/// See also [PlayerScreen].
@ProviderFor(PlayerScreen)
const playerScreenProvider = PlayerScreenFamily();

/// See also [PlayerScreen].
class PlayerScreenFamily extends Family<AsyncValue<PlayerViewModel>> {
  /// See also [PlayerScreen].
  const PlayerScreenFamily();

  /// See also [PlayerScreen].
  PlayerScreenProvider call({
    SongHiveRepository? repository,
    AudioPlayer? audioPlayer,
  }) {
    return PlayerScreenProvider(
      repository: repository,
      audioPlayer: audioPlayer,
    );
  }

  @override
  PlayerScreenProvider getProviderOverride(
    covariant PlayerScreenProvider provider,
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
  String? get name => r'playerScreenProvider';
}

/// See also [PlayerScreen].
class PlayerScreenProvider extends AutoDisposeAsyncNotifierProviderImpl<
    PlayerScreen, PlayerViewModel> {
  /// See also [PlayerScreen].
  PlayerScreenProvider({
    SongHiveRepository? repository,
    AudioPlayer? audioPlayer,
  }) : this._internal(
          () => PlayerScreen()
            ..repository = repository
            ..audioPlayer = audioPlayer,
          from: playerScreenProvider,
          name: r'playerScreenProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playerScreenHash,
          dependencies: PlayerScreenFamily._dependencies,
          allTransitiveDependencies:
              PlayerScreenFamily._allTransitiveDependencies,
          repository: repository,
          audioPlayer: audioPlayer,
        );

  PlayerScreenProvider._internal(
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
    covariant PlayerScreen notifier,
  ) {
    return notifier.build(
      repository: repository,
      audioPlayer: audioPlayer,
    );
  }

  @override
  Override overrideWith(PlayerScreen Function() create) {
    return ProviderOverride(
      origin: this,
      override: PlayerScreenProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<PlayerScreen, PlayerViewModel>
      createElement() {
    return _PlayerScreenProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerScreenProvider &&
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

mixin PlayerScreenRef on AutoDisposeAsyncNotifierProviderRef<PlayerViewModel> {
  /// The parameter `repository` of this provider.
  SongHiveRepository? get repository;

  /// The parameter `audioPlayer` of this provider.
  AudioPlayer? get audioPlayer;
}

class _PlayerScreenProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PlayerScreen,
        PlayerViewModel> with PlayerScreenRef {
  _PlayerScreenProviderElement(super.provider);

  @override
  SongHiveRepository? get repository =>
      (origin as PlayerScreenProvider).repository;
  @override
  AudioPlayer? get audioPlayer => (origin as PlayerScreenProvider).audioPlayer;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
