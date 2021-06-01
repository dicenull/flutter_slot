import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/palette.dart';
import 'package:flutter_slot/data/suberi_state.dart';
import 'package:flutter_slot/data/symbol.dart';
import 'package:flutter_slot/data/symbol_state.dart';
import 'package:flutter_slot/game.dart';

// TODO: 回すたびに絵柄がずれていくので修正する

class ReelComponent extends PositionComponent with HasGameRef<MyGame> {
  final List<SlotSymbol> symbols;
  final double symbolSize;
  final List<SymbolState> reel;

  Vector2 get slotCenter => gameRef.canvasSize / 2 - Vector2(0, 2 * symbolSize);

  // state
  bool isRoll = false;
  SuberiState? suberiState;

  void roll() {
    isRoll = true;
  }

  void stop(SuberiState state) {
    if (!isRoll) return;
    suberiState = state;
  }

  void stopCurrent() {
    if (!isRoll) return;

    final index = _nearestIndex(slotCenter.y);
    var symbol = reel[index].symbol;
    print('current: $symbol');
    suberiState = SuberiState(symbol, 1);
  }

  int _nearestIndex(double targetHeight) {
    int index = 0;
    var minDiff = gameRef.canvasSize.y;

    reel.asMap().forEach((i, state) {
      final diff = targetHeight - state.pos.y;
      if (diff > 0 && minDiff > diff) {
        minDiff = diff;
        index = i;
      }
    });

    return index;
  }

  void _align() {
    final nearestIndex = _nearestIndex(0);

    for (var i = 0; i < reel.length; i++) {
      final index = (nearestIndex + i) % reel.length;

      reel[index].copyWith(pos: Vector2(0, index * symbolSize));
    }
  }

  void _checkSuberiStop(SymbolState symbolState) {
    if (!isRoll) {
      return;
    }

    final state = suberiState;
    if (state == null) {
      return;
    }

    final pos = slotCenter.y - (height - 1) * symbolSize;
    if (state.symbol == symbolState.symbol) {
      final diff = pos - symbolState.pos.y;
      if (diff > 0 && diff < 10) {
        print('stop: ${state.symbol} $diff');
        isRoll = false;
        suberiState = null;
        _align();
      }
    }
  }

  ReelComponent(this.symbols, this.symbolSize) : reel = <SymbolState>[] {
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
        sprite: Sprite(image),
        pos: Vector2(0, y * symbolSize),
        symbol: symbol,
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
      _checkSuberiStop(state);

      if (isRoll) {
        state.pos.y += 800 * dt;

        final diff = state.pos.y - gameRef.canvasSize.y;
        if (diff > 0) {
          state.pos.y -= reel.length * symbolSize;
        }
      }
    });

    super.update(dt);
  }
}
