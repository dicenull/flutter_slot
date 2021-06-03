import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter_slot/components/reel_component.dart';
import 'package:flutter_slot/game.dart';

class SlotComponent extends PositionComponent with HasGameRef<MyGame> {
  final List<ReelComponent> reels;

  SlotComponent(this.reels);

  void roll() {
    reels.forEach((reel) {
      reel.roll();
    });
  }

  void stop(int index) {
    reels[index].stopCurrent();
  }

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

    super.update(dt);
  }
}
