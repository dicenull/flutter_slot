// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'suberi_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SuberiStateTearOff {
  const _$SuberiStateTearOff();

  _SuberiState call(SlotSymbol symbol, int height) {
    return _SuberiState(
      symbol,
      height,
    );
  }
}

/// @nodoc
const $SuberiState = _$SuberiStateTearOff();

/// @nodoc
mixin _$SuberiState {
  SlotSymbol get symbol => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SuberiStateCopyWith<SuberiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuberiStateCopyWith<$Res> {
  factory $SuberiStateCopyWith(
          SuberiState value, $Res Function(SuberiState) then) =
      _$SuberiStateCopyWithImpl<$Res>;
  $Res call({SlotSymbol symbol, int height});

  $SlotSymbolCopyWith<$Res> get symbol;
}

/// @nodoc
class _$SuberiStateCopyWithImpl<$Res> implements $SuberiStateCopyWith<$Res> {
  _$SuberiStateCopyWithImpl(this._value, this._then);

  final SuberiState _value;
  // ignore: unused_field
  final $Res Function(SuberiState) _then;

  @override
  $Res call({
    Object? symbol = freezed,
    Object? height = freezed,
  }) {
    return _then(_value.copyWith(
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as SlotSymbol,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$SuberiStateCopyWith<$Res>
    implements $SuberiStateCopyWith<$Res> {
  factory _$SuberiStateCopyWith(
          _SuberiState value, $Res Function(_SuberiState) then) =
      __$SuberiStateCopyWithImpl<$Res>;
  @override
  $Res call({SlotSymbol symbol, int height});

  @override
  $SlotSymbolCopyWith<$Res> get symbol;
}

/// @nodoc
class __$SuberiStateCopyWithImpl<$Res> extends _$SuberiStateCopyWithImpl<$Res>
    implements _$SuberiStateCopyWith<$Res> {
  __$SuberiStateCopyWithImpl(
      _SuberiState _value, $Res Function(_SuberiState) _then)
      : super(_value, (v) => _then(v as _SuberiState));

  @override
  _SuberiState get _value => super._value as _SuberiState;

  @override
  $Res call({
    Object? symbol = freezed,
    Object? height = freezed,
  }) {
    return _then(_SuberiState(
      symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as SlotSymbol,
      height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SuberiState implements _SuberiState {
  _$_SuberiState(this.symbol, this.height);

  @override
  final SlotSymbol symbol;
  @override
  final int height;

  @override
  String toString() {
    return 'SuberiState(symbol: $symbol, height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SuberiState &&
            (identical(other.symbol, symbol) ||
                const DeepCollectionEquality().equals(other.symbol, symbol)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(symbol) ^
      const DeepCollectionEquality().hash(height);

  @JsonKey(ignore: true)
  @override
  _$SuberiStateCopyWith<_SuberiState> get copyWith =>
      __$SuberiStateCopyWithImpl<_SuberiState>(this, _$identity);
}

abstract class _SuberiState implements SuberiState {
  factory _SuberiState(SlotSymbol symbol, int height) = _$_SuberiState;

  @override
  SlotSymbol get symbol => throw _privateConstructorUsedError;
  @override
  int get height => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SuberiStateCopyWith<_SuberiState> get copyWith =>
      throw _privateConstructorUsedError;
}
