import 'package:freezed_annotation/freezed_annotation.dart';
part 'symbol.freezed.dart';

@freezed
class SlotSymbol with _$SlotSymbol {
  const factory SlotSymbol.bell() = Bell;
  const factory SlotSymbol.bar() = Bar;
  const factory SlotSymbol.cherry() = Cherry;
  const factory SlotSymbol.plum() = Plum;
  const factory SlotSymbol.replay() = Replay;
  const factory SlotSymbol.seven() = Seven;
  const factory SlotSymbol.watermelon() = Watermelon;
}
