// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_screen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProgressBarState {
  Duration get current => throw _privateConstructorUsedError;
  Duration get buffered => throw _privateConstructorUsedError;
  Duration get total => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProgressBarStateCopyWith<ProgressBarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressBarStateCopyWith<$Res> {
  factory $ProgressBarStateCopyWith(
          ProgressBarState value, $Res Function(ProgressBarState) then) =
      _$ProgressBarStateCopyWithImpl<$Res, ProgressBarState>;
  @useResult
  $Res call({Duration current, Duration buffered, Duration total});
}

/// @nodoc
class _$ProgressBarStateCopyWithImpl<$Res, $Val extends ProgressBarState>
    implements $ProgressBarStateCopyWith<$Res> {
  _$ProgressBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? buffered = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as Duration,
      buffered: null == buffered
          ? _value.buffered
          : buffered // ignore: cast_nullable_to_non_nullable
              as Duration,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgressBarStateImplCopyWith<$Res>
    implements $ProgressBarStateCopyWith<$Res> {
  factory _$$ProgressBarStateImplCopyWith(_$ProgressBarStateImpl value,
          $Res Function(_$ProgressBarStateImpl) then) =
      __$$ProgressBarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration current, Duration buffered, Duration total});
}

/// @nodoc
class __$$ProgressBarStateImplCopyWithImpl<$Res>
    extends _$ProgressBarStateCopyWithImpl<$Res, _$ProgressBarStateImpl>
    implements _$$ProgressBarStateImplCopyWith<$Res> {
  __$$ProgressBarStateImplCopyWithImpl(_$ProgressBarStateImpl _value,
      $Res Function(_$ProgressBarStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? buffered = null,
    Object? total = null,
  }) {
    return _then(_$ProgressBarStateImpl(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as Duration,
      buffered: null == buffered
          ? _value.buffered
          : buffered // ignore: cast_nullable_to_non_nullable
              as Duration,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$ProgressBarStateImpl extends _ProgressBarState {
  const _$ProgressBarStateImpl(
      {this.current = Duration.zero,
      this.buffered = Duration.zero,
      this.total = Duration.zero})
      : super._();

  @override
  @JsonKey()
  final Duration current;
  @override
  @JsonKey()
  final Duration buffered;
  @override
  @JsonKey()
  final Duration total;

  @override
  String toString() {
    return 'ProgressBarState(current: $current, buffered: $buffered, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressBarStateImpl &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.buffered, buffered) ||
                other.buffered == buffered) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(runtimeType, current, buffered, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressBarStateImplCopyWith<_$ProgressBarStateImpl> get copyWith =>
      __$$ProgressBarStateImplCopyWithImpl<_$ProgressBarStateImpl>(
          this, _$identity);
}

abstract class _ProgressBarState extends ProgressBarState {
  const factory _ProgressBarState(
      {final Duration current,
      final Duration buffered,
      final Duration total}) = _$ProgressBarStateImpl;
  const _ProgressBarState._() : super._();

  @override
  Duration get current;
  @override
  Duration get buffered;
  @override
  Duration get total;
  @override
  @JsonKey(ignore: true)
  _$$ProgressBarStateImplCopyWith<_$ProgressBarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PlayerViewModel {
  SongItem? get currentSongItem => throw _privateConstructorUsedError;
  List<SongItem> get songs => throw _privateConstructorUsedError;
  ProgressBarState get progressBarState => throw _privateConstructorUsedError;
  RepeatState get repeatState => throw _privateConstructorUsedError;
  PlayerState get playerState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerViewModelCopyWith<PlayerViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerViewModelCopyWith<$Res> {
  factory $PlayerViewModelCopyWith(
          PlayerViewModel value, $Res Function(PlayerViewModel) then) =
      _$PlayerViewModelCopyWithImpl<$Res, PlayerViewModel>;
  @useResult
  $Res call(
      {SongItem? currentSongItem,
      List<SongItem> songs,
      ProgressBarState progressBarState,
      RepeatState repeatState,
      PlayerState playerState});

  $SongItemCopyWith<$Res>? get currentSongItem;
  $ProgressBarStateCopyWith<$Res> get progressBarState;
}

/// @nodoc
class _$PlayerViewModelCopyWithImpl<$Res, $Val extends PlayerViewModel>
    implements $PlayerViewModelCopyWith<$Res> {
  _$PlayerViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentSongItem = freezed,
    Object? songs = null,
    Object? progressBarState = null,
    Object? repeatState = null,
    Object? playerState = null,
  }) {
    return _then(_value.copyWith(
      currentSongItem: freezed == currentSongItem
          ? _value.currentSongItem
          : currentSongItem // ignore: cast_nullable_to_non_nullable
              as SongItem?,
      songs: null == songs
          ? _value.songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<SongItem>,
      progressBarState: null == progressBarState
          ? _value.progressBarState
          : progressBarState // ignore: cast_nullable_to_non_nullable
              as ProgressBarState,
      repeatState: null == repeatState
          ? _value.repeatState
          : repeatState // ignore: cast_nullable_to_non_nullable
              as RepeatState,
      playerState: null == playerState
          ? _value.playerState
          : playerState // ignore: cast_nullable_to_non_nullable
              as PlayerState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SongItemCopyWith<$Res>? get currentSongItem {
    if (_value.currentSongItem == null) {
      return null;
    }

    return $SongItemCopyWith<$Res>(_value.currentSongItem!, (value) {
      return _then(_value.copyWith(currentSongItem: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProgressBarStateCopyWith<$Res> get progressBarState {
    return $ProgressBarStateCopyWith<$Res>(_value.progressBarState, (value) {
      return _then(_value.copyWith(progressBarState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlayerViewModelImplCopyWith<$Res>
    implements $PlayerViewModelCopyWith<$Res> {
  factory _$$PlayerViewModelImplCopyWith(_$PlayerViewModelImpl value,
          $Res Function(_$PlayerViewModelImpl) then) =
      __$$PlayerViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SongItem? currentSongItem,
      List<SongItem> songs,
      ProgressBarState progressBarState,
      RepeatState repeatState,
      PlayerState playerState});

  @override
  $SongItemCopyWith<$Res>? get currentSongItem;
  @override
  $ProgressBarStateCopyWith<$Res> get progressBarState;
}

/// @nodoc
class __$$PlayerViewModelImplCopyWithImpl<$Res>
    extends _$PlayerViewModelCopyWithImpl<$Res, _$PlayerViewModelImpl>
    implements _$$PlayerViewModelImplCopyWith<$Res> {
  __$$PlayerViewModelImplCopyWithImpl(
      _$PlayerViewModelImpl _value, $Res Function(_$PlayerViewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentSongItem = freezed,
    Object? songs = null,
    Object? progressBarState = null,
    Object? repeatState = null,
    Object? playerState = null,
  }) {
    return _then(_$PlayerViewModelImpl(
      currentSongItem: freezed == currentSongItem
          ? _value.currentSongItem
          : currentSongItem // ignore: cast_nullable_to_non_nullable
              as SongItem?,
      songs: null == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<SongItem>,
      progressBarState: null == progressBarState
          ? _value.progressBarState
          : progressBarState // ignore: cast_nullable_to_non_nullable
              as ProgressBarState,
      repeatState: null == repeatState
          ? _value.repeatState
          : repeatState // ignore: cast_nullable_to_non_nullable
              as RepeatState,
      playerState: null == playerState
          ? _value.playerState
          : playerState // ignore: cast_nullable_to_non_nullable
              as PlayerState,
    ));
  }
}

/// @nodoc

class _$PlayerViewModelImpl extends _PlayerViewModel {
  const _$PlayerViewModelImpl(
      {this.currentSongItem = null,
      final List<SongItem> songs = const <SongItem>[],
      this.progressBarState = const ProgressBarState(),
      this.repeatState = RepeatState.off,
      this.playerState = PlayerState.paused})
      : _songs = songs,
        super._();

  @override
  @JsonKey()
  final SongItem? currentSongItem;
  final List<SongItem> _songs;
  @override
  @JsonKey()
  List<SongItem> get songs {
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songs);
  }

  @override
  @JsonKey()
  final ProgressBarState progressBarState;
  @override
  @JsonKey()
  final RepeatState repeatState;
  @override
  @JsonKey()
  final PlayerState playerState;

  @override
  String toString() {
    return 'PlayerViewModel(currentSongItem: $currentSongItem, songs: $songs, progressBarState: $progressBarState, repeatState: $repeatState, playerState: $playerState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerViewModelImpl &&
            (identical(other.currentSongItem, currentSongItem) ||
                other.currentSongItem == currentSongItem) &&
            const DeepCollectionEquality().equals(other._songs, _songs) &&
            (identical(other.progressBarState, progressBarState) ||
                other.progressBarState == progressBarState) &&
            (identical(other.repeatState, repeatState) ||
                other.repeatState == repeatState) &&
            (identical(other.playerState, playerState) ||
                other.playerState == playerState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentSongItem,
      const DeepCollectionEquality().hash(_songs),
      progressBarState,
      repeatState,
      playerState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerViewModelImplCopyWith<_$PlayerViewModelImpl> get copyWith =>
      __$$PlayerViewModelImplCopyWithImpl<_$PlayerViewModelImpl>(
          this, _$identity);
}

abstract class _PlayerViewModel extends PlayerViewModel {
  const factory _PlayerViewModel(
      {final SongItem? currentSongItem,
      final List<SongItem> songs,
      final ProgressBarState progressBarState,
      final RepeatState repeatState,
      final PlayerState playerState}) = _$PlayerViewModelImpl;
  const _PlayerViewModel._() : super._();

  @override
  SongItem? get currentSongItem;
  @override
  List<SongItem> get songs;
  @override
  ProgressBarState get progressBarState;
  @override
  RepeatState get repeatState;
  @override
  PlayerState get playerState;
  @override
  @JsonKey(ignore: true)
  _$$PlayerViewModelImplCopyWith<_$PlayerViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
