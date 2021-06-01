import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/palette.dart';
import 'package:flutter_slot/data/symbol.dart';
import 'package:flutter_slot/data/symbol_state.dart';
import 'package:flutter_slot/game.dart';

class ReelComponent extends PositionComponent with HasGameRef<MyGame> {
  final List<Symbol> symbols;
  final double symbolSize;
  late final List<SymbolState> reel;

  ReelComponent(this.symbols, this.symbolSize) {
    reel = <SymbolState>[];
    symbols.asMap().forEach((y, symbol) {
      final image = symbol.when(
        bell: () => Flame.images.fromCache('bell.png'),
        bar: () => Flame.images.fromCache('bar.png'),
        cherry: () => Flame.images.fromCache('cherry.png'),
        plum: () => Flame.images.fromCache('plum.png'),
        replay: () => Flame.images.fromCache('replay.png'),
        seven: () => Flame.images.fromCache('seven.png'),
        watermelon: () => Flame.images.fromCache('watermelon.png'),
      );

      reel.add(SymbolState(
        Sprite(image),
        Vector2(0, y * symbolSize),
      ));
    });
  }

  @override
  void render(Canvas canvas) {
    final center = Offset(gameRef.canvasSize.x / 2, gameRef.canvasSize.y / 2);

    canvas.clipRect(
      Rect.fromCenter(
        center: Offset(this.position.x + symbolSize, gameRef.canvasSize.y / 2),
        width: symbolSize,
        height: symbolSize * 3.5,
      ),
    );

    // background
    canvas.drawRect(
      Rect.fromCenter(
          center: center,
          width: gameRef.canvasSize.x,
          height: gameRef.canvasSize.y),
      BasicPalette.white.paint(),
    );

    reel.asMap().forEach((y, state) {
      state.sprite.render(
        canvas,
        size: Vector2(symbolSize, symbolSize),
        position: state.pos + this.position,
        anchor: Anchor.center,
      );
    });

    super.render(canvas);
  }

  @override
  void update(double dt) {
    reel.forEach((state) {
      state.pos.y += 100 * dt;

      if (state.pos.y > gameRef.canvasSize.y) {
        state.pos.y -= reel.length * symbolSize;
      }
    });

    super.update(dt);
  }
}
