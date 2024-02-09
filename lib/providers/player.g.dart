// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playerHash() => r'c81c32201eba28f8869de6d5151421f2a539e0e0';

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

  FutureOr<PlayerViewModel> build({
    SongHiveRepository? repository,
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
  }) {
    return PlayerProvider(
      repository: repository,
    );
  }

  @override
  PlayerProvider getProviderOverride(
    covariant PlayerProvider provider,
  ) {
    return call(
      repository: provider.repository,
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
  }) : this._internal(
          () => Player()..repository = repository,
          from: playerProvider,
          name: r'playerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playerHash,
          dependencies: PlayerFamily._dependencies,
          allTransitiveDependencies: PlayerFamily._allTransitiveDependencies,
          repository: repository,
        );

  PlayerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.repository,
  }) : super.internal();

  final SongHiveRepository? repository;

  @override
  FutureOr<PlayerViewModel> runNotifierBuild(
    covariant Player notifier,
  ) {
    return notifier.build(
      repository: repository,
    );
  }

  @override
  Override overrideWith(Player Function() create) {
    return ProviderOverride(
      origin: this,
      override: PlayerProvider._internal(
        () => create()..repository = repository,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        repository: repository,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<Player, PlayerViewModel> createElement() {
    return _PlayerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerProvider && other.repository == repository;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, repository.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PlayerRef on AsyncNotifierProviderRef<PlayerViewModel> {
  /// The parameter `repository` of this provider.
  SongHiveRepository? get repository;
}

class _PlayerProviderElement
    extends AsyncNotifierProviderElement<Player, PlayerViewModel>
    with PlayerRef {
  _PlayerProviderElement(super.provider);

  @override
  SongHiveRepository? get repository => (origin as PlayerProvider).repository;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
