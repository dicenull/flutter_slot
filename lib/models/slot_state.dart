import 'package:freezed_annotation/freezed_annotation.dart';

part 'slot_state.freezed.dart';

@freezed
class SlotState with _$SlotState {
  factory SlotState({
    @Default(0) int money,
  }) = _SlotState;
}
