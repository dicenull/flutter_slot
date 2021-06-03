import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/keyboard.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/services/raw_keyboard.dart';
import 'package:flutter_slot/components/reel_component.dart';
import 'package:flutter_slot/data/symbol.dart';

class MyGame extends BaseGame
    with VerticalDragDetector, TapDetector, KeyboardEvents {
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

  late final List<ReelComponent> reels;
  final symbolSize = 64.0;

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

    reels = [
      ReelComponent(leftReel, symbolSize),
      ReelComponent(centerReel, symbolSize),
      ReelComponent(rightReel, symbolSize),
    ];

    reels.asMap().forEach((x, reel) {
      final leftCenterPos = (size.x / 2) - (reels.length - 1) * .5 * symbolSize;
      final padding = (x - 1) * symbolSize;

      reel.position = Vector2(leftCenterPos + padding, 15);
    });

    addAll(reels);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  int _index = 0;
  @override
  void onTapDown(TapDownInfo info) {
    reels[_index].stopCurrent();
    _index = (_index + 1) % reels.length;
  }

  @override
  void onVerticalDragEnd(DragEndInfo info) {
    reels.forEach((reel) {
      reel.roll();
    });
  }

  @override
  void onKeyEvent(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.space) {
        reels.forEach((reel) {
          reel.roll();
        });
      }

      final stopKeys = [
        LogicalKeyboardKey.keyA,
        LogicalKeyboardKey.keyS,
        LogicalKeyboardKey.keyD
      ];
      for (var i = 0; i < reels.length; i++) {
        if (event.logicalKey == stopKeys[i]) {
          reels[i].stopCurrent();
        }
      }
    }
  }
}
