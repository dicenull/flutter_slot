import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter_slot/components/reel_conponent.dart';
import 'package:flutter_slot/data/symbol.dart';

class MyGame extends BaseGame with DoubleTapDetector, TapDetector {
  static const List<Symbol> leftReel = [
    Symbol.replay(),
    Symbol.bell(),
    Symbol.watermelon(),
    Symbol.plum(),
    Symbol.seven(),
    Symbol.replay(),
    Symbol.bell(),
    Symbol.watermelon(),
    Symbol.seven(),
    Symbol.cherry(),
    Symbol.replay(),
    Symbol.bell(),
    Symbol.watermelon(),
    Symbol.bar(),
    Symbol.bar(),
    Symbol.replay(),
    Symbol.bell(),
    Symbol.watermelon(),
    Symbol.cherry(),
    Symbol.plum(),
  ];

  static const List<Symbol> centerReel = [
    Symbol.bell(),
    Symbol.watermelon(),
    Symbol.bar(),
    Symbol.seven(),
    Symbol.replay(),
    Symbol.bell(),
    Symbol.watermelon(),
    Symbol.cherry(),
    Symbol.seven(),
    Symbol.replay(),
    Symbol.bell(),
    Symbol.watermelon(),
    Symbol.cherry(),
    Symbol.plum(),
    Symbol.replay(),
    Symbol.bell(),
    Symbol.watermelon(),
    Symbol.bar(),
    Symbol.plum(),
    Symbol.replay(),
  ];

  static const List<Symbol> rightReel = [
    Symbol.bar(),
    Symbol.bar(),
    Symbol.replay(),
    Symbol.bell(),
    Symbol.watermelon(),
    Symbol.seven(),
    Symbol.seven(),
    Symbol.replay(),
    Symbol.bell(),
    Symbol.watermelon(),
    Symbol.plum(),
    Symbol.plum(),
    Symbol.replay(),
    Symbol.bell(),
    Symbol.watermelon(),
    Symbol.cherry(),
    Symbol.cherry(),
    Symbol.replay(),
    Symbol.bell(),
    Symbol.watermelon(),
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

      reel.position = Vector2(leftCenterPos + padding, 0);
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
}
