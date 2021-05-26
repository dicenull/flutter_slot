// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'slot_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SlotStateTearOff {
  const _$SlotStateTearOff();

  _SlotState call({int money = 0}) {
    return _SlotState(
      money: money,
    );
  }
}

/// @nodoc
const $SlotState = _$SlotStateTearOff();

/// @nodoc
mixin _$SlotState {
  int get money => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SlotStateCopyWith<SlotState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlotStateCopyWith<$Res> {
  factory $SlotStateCopyWith(SlotState value, $Res Function(SlotState) then) =
      _$SlotStateCopyWithImpl<$Res>;
  $Res call({int money});
}

/// @nodoc
class _$SlotStateCopyWithImpl<$Res> implements $SlotStateCopyWith<$Res> {
  _$SlotStateCopyWithImpl(this._value, this._then);

  final SlotState _value;
  // ignore: unused_field
  final $Res Function(SlotState) _then;

  @override
  $Res call({
    Object? money = freezed,
  }) {
    return _then(_value.copyWith(
      money: money == freezed
          ? _value.money
          : money // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$SlotStateCopyWith<$Res> implements $SlotStateCopyWith<$Res> {
  factory _$SlotStateCopyWith(
          _SlotState value, $Res Function(_SlotState) then) =
      __$SlotStateCopyWithImpl<$Res>;
  @override
  $Res call({int money});
}

/// @nodoc
class __$SlotStateCopyWithImpl<$Res> extends _$SlotStateCopyWithImpl<$Res>
    implements _$SlotStateCopyWith<$Res> {
  __$SlotStateCopyWithImpl(_SlotState _value, $Res Function(_SlotState) _then)
      : super(_value, (v) => _then(v as _SlotState));

  @override
  _SlotState get _value => super._value as _SlotState;

  @override
  $Res call({
    Object? money = freezed,
  }) {
    return _then(_SlotState(
      money: money == freezed
          ? _value.money
          : money // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SlotState implements _SlotState {
  _$_SlotState({this.money = 0});

  @JsonKey(defaultValue: 0)
  @override
  final int money;

  @override
  String toString() {
    return 'SlotState(money: $money)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SlotState &&
            (identical(other.money, money) ||
                const DeepCollectionEquality().equals(other.money, money)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(money);

  @JsonKey(ignore: true)
  @override
  _$SlotStateCopyWith<_SlotState> get copyWith =>
      __$SlotStateCopyWithImpl<_SlotState>(this, _$identity);
}

abstract class _SlotState implements SlotState {
  factory _SlotState({int money}) = _$_SlotState;

  @override
  int get money => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SlotStateCopyWith<_SlotState> get copyWith =>
      throw _privateConstructorUsedError;
}
