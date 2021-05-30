import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter_slot/data/symbol.dart';

class MyGame extends BaseGame with DoubleTapDetector, TapDetector {
  static const List<Symbol> leftReel = [
    Symbol.plum(),
    Symbol.plum(),
    Symbol.seven(),
    Symbol.bar(),
    Symbol.bar(),
    Symbol.replay(),
    Symbol.replay(),
    Symbol.replay(),
    Symbol.replay(),
    Symbol.bell(),
    Symbol.bell(),
    Symbol.bell(),
    Symbol.bell(),
    Symbol.watermelon(),
    Symbol.watermelon(),
    Symbol.watermelon(),
    Symbol.watermelon(),
    Symbol.cherry(),
    Symbol.cherry(),
    Symbol.plum(),
    Symbol.plum(),
  ];

  static const List<Symbol> centerReel = [
    Symbol.plum(),
    Symbol.plum(),
    Symbol.seven(),
    Symbol.bar(),
    Symbol.bar(),
    Symbol.replay(),
    Symbol.replay(),
    Symbol.replay(),
    Symbol.replay(),
    Symbol.bell(),
    Symbol.bell(),
    Symbol.bell(),
    Symbol.bell(),
    Symbol.watermelon(),
    Symbol.watermelon(),
    Symbol.watermelon(),
    Symbol.watermelon(),
    Symbol.cherry(),
    Symbol.cherry(),
    Symbol.plum(),
    Symbol.plum(),
  ];

  static const List<Symbol> rightReel = [
    Symbol.plum(),
    Symbol.plum(),
    Symbol.seven(),
    Symbol.bar(),
    Symbol.bar(),
    Symbol.replay(),
    Symbol.replay(),
    Symbol.replay(),
    Symbol.replay(),
    Symbol.bell(),
    Symbol.bell(),
    Symbol.bell(),
    Symbol.bell(),
    Symbol.watermelon(),
    Symbol.watermelon(),
    Symbol.watermelon(),
    Symbol.watermelon(),
    Symbol.cherry(),
    Symbol.cherry(),
    Symbol.plum(),
    Symbol.plum(),
  ];

  static List<List<Symbol>> get reels => [leftReel, centerReel, rightReel];
  List<List<SpriteComponent>> reelSprites = <List<SpriteComponent>>[];

  @override
  Future<void> onLoad() async {
    await images.loadAll([
      'bell.png',
      'bar.png',
      'cherry.png',
      'plum.png',
      'replay.png',
      'seven.png',
      'watermelon.png',
    ]);

    final size = Vector2(64, 64);
    reels.asMap().forEach((x, reel) {
      final symbols = <SpriteComponent>[];
      reel.asMap().forEach((y, symbol) {
        final image = symbol.when(
          bell: () => images.fromCache('bell.png'),
          bar: () => images.fromCache('bar.png'),
          cherry: () => images.fromCache('cherry.png'),
          plum: () => images.fromCache('plum.png'),
          replay: () => images.fromCache('replay.png'),
          seven: () => images.fromCache('seven.png'),
          watermelon: () => images.fromCache('watermelon.png'),
        );

        final sprite = SpriteComponent(
          sprite: Sprite(image),
          size: size,
          position: Vector2(x * size.x, y * size.y),
        );
        sprite.anchor = Anchor.center;
        symbols.add(sprite);
        add(sprite);
      });

      reelSprites.add(symbols.toList());
    });
  }

  @override
  void update(double dt) {
    reelSprites.asMap().forEach((x, reel) {
      reel.forEach((symbol) {
        final leftCenterPos =
            (size.x / 2) - (reelSprites.length - 1) * .5 * symbol.size.x;
        symbol.x = leftCenterPos + x * symbol.size.x;
        symbol.y += 500 * dt;

        if (symbol.y > canvasSize.y) {
          symbol.y -= reel.length * symbol.size.y;
        }
      });
    });

    super.update(dt);
  }
}
