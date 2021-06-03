import 'dart:html';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter_slot/components/reel_component.dart';
import 'package:flutter_slot/game.dart';

class SlotComponent extends PositionComponent with HasGameRef<MyGame> {
  final List<ReelComponent> reels;

  SlotComponent(this.reels);

  // state
  bool inBet = false;

  void roll() {
    final canPlay = gameRef.playSlot();
    if (!canPlay) {
      return;
    }
    if (inBet) return;

    reels.forEach((reel) {
      reel.roll();
    });
    inBet = true;
  }

  void stop(int index) {
    reels[index].stopCurrent();
  }

  bool matchAll<T>(T a, T b, T c) => a == b && b == c;

  @override
  void render(Canvas canvas) {
    reels.forEach((reel) {
      reel.render(canvas);
    });

    super.render(canvas);
  }

  @override
  void update(double dt) {
    reels.asMap().forEach((x, reel) {
      final leftCenterPos = (gameRef.canvasSize.x / 2) -
          (reels.length - 1) * .5 * gameRef.symbolSize;
      final padding = (x - 1) * gameRef.symbolSize;

      reel.position = Vector2(leftCenterPos + padding, 15);
    });

    if (inBet) {
      if (reels.every((reel) => !reel.isRoll)) {
        final table = reels.map((reel) => reel.visibleSymbols()).toList();

        if (table.every((symbols) => symbols.isNotEmpty)) {
          final q = [
            [Point(0, 0), Point(1, 1), Point(2, 2)],
            [Point(0, 2), Point(1, 1), Point(2, 0)],
            [Point(0, 0), Point(1, 0), Point(2, 0)],
            [Point(0, 1), Point(1, 1), Point(2, 1)],
            [Point(0, 2), Point(1, 2), Point(2, 2)],
          ];
          q.forEach((p) {
            if (matchAll(
              table[p[0].x][p[0].y],
              table[p[1].x][p[1].y],
              table[p[2].x][p[2].y],
            )) {
              final symbol = table[p[0].x][p[0].y];

              gameRef.addPoint(symbol);
            }
          });

          inBet = false;
        }
      }
    }

    super.update(dt);
  }
}
