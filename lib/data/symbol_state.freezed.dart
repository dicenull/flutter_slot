// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'symbol_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SymbolStateTearOff {
  const _$SymbolStateTearOff();

  _SymbolState call(
      {required Sprite sprite,
      required Vector2 pos,
      required SlotSymbol symbol}) {
    return _SymbolState(
      sprite: sprite,
      pos: pos,
      symbol: symbol,
    );
  }
}

/// @nodoc
const $SymbolState = _$SymbolStateTearOff();

/// @nodoc
mixin _$SymbolState {
  Sprite get sprite => throw _privateConstructorUsedError;
  Vector2 get pos => throw _privateConstructorUsedError;
  SlotSymbol get symbol => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SymbolStateCopyWith<SymbolState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SymbolStateCopyWith<$Res> {
  factory $SymbolStateCopyWith(
          SymbolState value, $Res Function(SymbolState) then) =
      _$SymbolStateCopyWithImpl<$Res>;
  $Res call({Sprite sprite, Vector2 pos, SlotSymbol symbol});

  $SlotSymbolCopyWith<$Res> get symbol;
}

/// @nodoc
class _$SymbolStateCopyWithImpl<$Res> implements $SymbolStateCopyWith<$Res> {
  _$SymbolStateCopyWithImpl(this._value, this._then);

  final SymbolState _value;
  // ignore: unused_field
  final $Res Function(SymbolState) _then;

  @override
  $Res call({
    Object? sprite = freezed,
    Object? pos = freezed,
    Object? symbol = freezed,
  }) {
    return _then(_value.copyWith(
      sprite: sprite == freezed
          ? _value.sprite
          : sprite // ignore: cast_nullable_to_non_nullable
              as Sprite,
      pos: pos == freezed
          ? _value.pos
          : pos // ignore: cast_nullable_to_non_nullable
              as Vector2,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as SlotSymbol,
    ));
  }

  @override
  $SlotSymbolCopyWith<$Res> get symbol {
    return $SlotSymbolCopyWith<$Res>(_value.symbol, (value) {
      return _then(_value.copyWith(symbol: value));
    });
  }
}

/// @nodoc
abstract class _$SymbolStateCopyWith<$Res>
    implements $SymbolStateCopyWith<$Res> {
  factory _$SymbolStateCopyWith(
          _SymbolState value, $Res Function(_SymbolState) then) =
      __$SymbolStateCopyWithImpl<$Res>;
  @override
  $Res call({Sprite sprite, Vector2 pos, SlotSymbol symbol});

  @override
  $SlotSymbolCopyWith<$Res> get symbol;
}

/// @nodoc
class __$SymbolStateCopyWithImpl<$Res> extends _$SymbolStateCopyWithImpl<$Res>
    implements _$SymbolStateCopyWith<$Res> {
  __$SymbolStateCopyWithImpl(
      _SymbolState _value, $Res Function(_SymbolState) _then)
      : super(_value, (v) => _then(v as _SymbolState));

  @override
  _SymbolState get _value => super._value as _SymbolState;

  @override
  $Res call({
    Object? sprite = freezed,
    Object? pos = freezed,
    Object? symbol = freezed,
  }) {
    return _then(_SymbolState(
      sprite: sprite == freezed
          ? _value.sprite
          : sprite // ignore: cast_nullable_to_non_nullable
              as Sprite,
      pos: pos == freezed
          ? _value.pos
          : pos // ignore: cast_nullable_to_non_nullable
              as Vector2,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as SlotSymbol,
    ));
  }
}

/// @nodoc

class _$_SymbolState implements _SymbolState {
  _$_SymbolState(
      {required this.sprite, required this.pos, required this.symbol});

  @override
  final Sprite sprite;
  @override
  final Vector2 pos;
  @override
  final SlotSymbol symbol;

  @override
  String toString() {
    return 'SymbolState(sprite: $sprite, pos: $pos, symbol: $symbol)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SymbolState &&
            (identical(other.sprite, sprite) ||
                const DeepCollectionEquality().equals(other.sprite, sprite)) &&
            (identical(other.pos, pos) ||
                const DeepCollectionEquality().equals(other.pos, pos)) &&
            (identical(other.symbol, symbol) ||
                const DeepCollectionEquality().equals(other.symbol, symbol)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(sprite) ^
      const DeepCollectionEquality().hash(pos) ^
      const DeepCollectionEquality().hash(symbol);

  @JsonKey(ignore: true)
  @override
  _$SymbolStateCopyWith<_SymbolState> get copyWith =>
      __$SymbolStateCopyWithImpl<_SymbolState>(this, _$identity);
}

abstract class _SymbolState implements SymbolState {
  factory _SymbolState(
      {required Sprite sprite,
      required Vector2 pos,
      required SlotSymbol symbol}) = _$_SymbolState;

  @override
  Sprite get sprite => throw _privateConstructorUsedError;
  @override
  Vector2 get pos => throw _privateConstructorUsedError;
  @override
  SlotSymbol get symbol => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SymbolStateCopyWith<_SymbolState> get copyWith =>
      throw _privateConstructorUsedError;
}
