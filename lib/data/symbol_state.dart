import 'package:flame/components.dart';
import 'package:flutter_slot/data/symbol.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'symbol_state.freezed.dart';

@freezed
class SymbolState with _$SymbolState {
  factory SymbolState({
    required Sprite sprite,
    required SlotSymbol symbol,
  }) = _SymbolState;
}
