import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/services/raw_keyboard.dart';
import 'package:flutter_slot/components/reel_component.dart';
import 'package:flutter_slot/components/slot_component.dart';
import 'package:flutter_slot/data/symbol.dart';

class MyGame extends BaseGame
    with VerticalDragDetector, TapDetector, KeyboardEvents {
  TextPaint textPaint = TextPaint(
    config: TextPaintConfig(
      fontSize: 100.0,
      color: Colors.white,
    ),
  );

  static const List<SlotSymbol> leftReel = [
    SlotSymbol.replay(),
    SlotSymbol.bell(),
    SlotSymbol.watermelon(),
    SlotSymbol.plum(),
    SlotSymbol.seven(),
    SlotSymbol.replay(),
    SlotSymbol.bell(),
    SlotSymbol.watermelon(),
    SlotSymbol.seven(),
    SlotSymbol.cherry(),
    SlotSymbol.replay(),
    SlotSymbol.bell(),
    SlotSymbol.watermelon(),
    SlotSymbol.bar(),
    SlotSymbol.bar(),
    SlotSymbol.replay(),
    SlotSymbol.bell(),
    SlotSymbol.watermelon(),
    SlotSymbol.cherry(),
    SlotSymbol.plum(),
  ];

  static const List<SlotSymbol> centerReel = [
    SlotSymbol.bell(),
    SlotSymbol.watermelon(),
    SlotSymbol.bar(),
    SlotSymbol.seven(),
    SlotSymbol.replay(),
    SlotSymbol.bell(),
    SlotSymbol.watermelon(),
    SlotSymbol.cherry(),
    SlotSymbol.seven(),
    SlotSymbol.replay(),
    SlotSymbol.bell(),
    SlotSymbol.watermelon(),
    SlotSymbol.cherry(),
    SlotSymbol.plum(),
    SlotSymbol.replay(),
    SlotSymbol.bell(),
    SlotSymbol.watermelon(),
    SlotSymbol.bar(),
    SlotSymbol.plum(),
    SlotSymbol.replay(),
  ];

  static const List<SlotSymbol> rightReel = [
    SlotSymbol.bar(),
    SlotSymbol.bar(),
    SlotSymbol.replay(),
    SlotSymbol.bell(),
    SlotSymbol.watermelon(),
    SlotSymbol.seven(),
    SlotSymbol.seven(),
    SlotSymbol.replay(),
    SlotSymbol.bell(),
    SlotSymbol.watermelon(),
    SlotSymbol.plum(),
    SlotSymbol.plum(),
    SlotSymbol.replay(),
    SlotSymbol.bell(),
    SlotSymbol.watermelon(),
    SlotSymbol.cherry(),
    SlotSymbol.cherry(),
    SlotSymbol.replay(),
    SlotSymbol.bell(),
    SlotSymbol.watermelon(),
  ];

  late final SlotComponent slot;
  final symbolSize = 64.0;
  int _point = 100;

  void addPoint(SlotSymbol symbol) {
    final winPoint = symbol.when(
      bell: () => 30,
      bar: () => 50,
      cherry: () => 3,
      plum: () => 0,
      replay: () => 3,
      seven: () => 100,
      watermelon: () => 15,
    );

    _point += winPoint;
  }

  bool playSlot() {
    _point -= 3;
    if (_point < 0) {
      _point = 0;
      return false;
    }

    return true;
  }

  @override
  Future<void> onLoad() async {
    await Flame.images.loadAll([
      'bell.png',
      'bar.png',
      'cherry.png',
      'plum.png',
      'replay.png',
      'seven.png',
      'watermelon.png',
    ]);

    slot = SlotComponent([
      ReelComponent(leftReel, symbolSize),
      ReelComponent(centerReel, symbolSize),
      ReelComponent(rightReel, symbolSize),
    ]);

    addAll(slot.reels);
    await add(slot);
  }

  @override
  void render(Canvas canvas) {
    textPaint.render(canvas, _point.toString(), Vector2(0, 0));

    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  int _index = 0;
  @override
  void onTapDown(TapDownInfo info) {
    slot.stop(_index);
    _index = (_index + 1) % slot.reels.length;
  }

  @override
  void onVerticalDragEnd(DragEndInfo info) {
    slot.roll();
    _index = 0;
  }

  @override
  void onKeyEvent(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.space) {
        slot.roll();
      }

      final stopKeys = [
        LogicalKeyboardKey.keyA,
        LogicalKeyboardKey.keyS,
        LogicalKeyboardKey.keyD
      ];
      for (var i = 0; i < slot.reels.length; i++) {
        if (event.logicalKey == stopKeys[i]) {
          slot.stop(i);
        }
      }
    }
  }
}
