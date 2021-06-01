import 'package:flame/components.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'symbol_state.freezed.dart';

@freezed
class SymbolState with _$SymbolState {
  factory SymbolState(Sprite sprite, Vector2 pos) = _SymbolState;
}
