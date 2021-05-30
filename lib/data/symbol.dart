import 'package:freezed_annotation/freezed_annotation.dart';
part 'symbol.freezed.dart';

@freezed
class Symbol with _$Symbol {
  const factory Symbol.bell() = Bell;
  const factory Symbol.bar() = Bar;
  const factory Symbol.cherry() = Cherry;
  const factory Symbol.plum() = Plum;
  const factory Symbol.replay() = Replay;
  const factory Symbol.seven() = Seven;
  const factory Symbol.watermelon() = Watermelon;
}
