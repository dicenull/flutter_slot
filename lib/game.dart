import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter_slot/square.dart';

class MyGame extends BaseGame with DoubleTapDetector, TapDetector {
  bool running = true;

  @override
  Future<void> onLoad() async {
    add(
      Square()
        ..x = 100
        ..y = 100,
    );

    // final sp = await loadSpriteAnimation();

    final sprite = await Sprite.load('hogehoge');
    final player = SpriteComponent(size: Vector2(2, 2), sprite: sprite);
    player.renderFlipX = true;
    add(player);
  }

  @override
  void onTapUp(TapUpInfo event) {
    final touchArea = RectExtension.fromVector2Center(
      center: event.eventPosition.game,
      width: 20,
      height: 20,
    );

    final handled = components.any((c) {
      if (c is PositionComponent && c.toRect().overlaps(touchArea)) {
        remove(c);
        return true;
      }
      return false;
    });

    if (!handled) {
      add(Square()
        ..x = touchArea.left
        ..y = touchArea.top);
    }
  }

  @override
  void onDoubleTap() {
    if (running) {
      pauseEngine();
    } else {
      resumeEngine();
    }

    running = !running;
  }
}
