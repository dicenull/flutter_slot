import 'package:flutter_slot/data/symbol.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'suberi_state.freezed.dart';

@freezed
class SuberiState with _$SuberiState {
  factory SuberiState(SlotSymbol symbol, int height) = _SuberiState;
}
