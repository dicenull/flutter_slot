import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/palette.dart';
import 'package:flutter_slot/data/suberi_state.dart';
import 'package:flutter_slot/data/symbol.dart';
import 'package:flutter_slot/data/symbol_state.dart';
import 'package:flutter_slot/game.dart';

class ReelComponent extends PositionComponent with HasGameRef<MyGame> {
  final List<SlotSymbol> symbols;
  final double reelLength;
  final double symbolSize;
  final List<SymbolState> reel;

  Vector2 get slotCenter => Vector2(0, gameRef.canvasSize.y / 2 - symbolSize);

  // state
  bool isRoll = false;
  bool onCheckStopCurrent = false;
  SuberiState? suberiState;
  double reelPosition = 0;
  int stopIndex = -1;

  double calcHeight(int y) => (y * symbolSize + reelPosition) % reelLength;

  List<SlotSymbol> visibleSymbols() {
    if (stopIndex == -1) return [];

    final top = (reel.length + stopIndex - 1) % reel.length;
    final center = stopIndex;
    final bottom = (stopIndex + 1) % reel.length;

    return [
      reel[top].symbol,
      reel[center].symbol,
      reel[bottom].symbol,
    ];
  }

  void roll() {
    isRoll = true;
    print(calcHeight(0));
  }

  void stop(SuberiState state) {
    if (!isRoll) return;
    suberiState = state;
  }

  void stopCurrent() {
    onCheckStopCurrent = true;
  }

  void _stopCurrent() {
    if (!isRoll) return;

    final index = _calcCenterIndex();
    var symbol = reel[index].symbol;
    print('current: $symbol');
    suberiState = SuberiState(symbol, 1);
  }

  int _calcCenterIndex() {
    int index = 0;
    var minDiff = gameRef.canvasSize.y;

    reel.asMap().forEach((i, state) {
      final diff = slotCenter.y - calcHeight(i);
      if (diff > 0 && minDiff > diff) {
        minDiff = diff;
        index = i;
      }
    });

    return index;
  }

  ReelComponent(this.symbols, this.symbolSize)
      : reel = <SymbolState>[],
        reelLength = symbolSize * symbols.length {
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
        symbol: symbol,
      ));
    });
  }

  @override
  void render(Canvas canvas) {
    final center = Offset(gameRef.canvasSize.x / 2, gameRef.canvasSize.y / 2);

    canvas.clipRect(
      Rect.fromCenter(
        center:
            Offset(symbolSize, gameRef.canvasSize.y / 2) + position.toOffset(),
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
      final p = Vector2(0, calcHeight(y));

      state.sprite.render(
        canvas,
        size: Vector2(symbolSize, symbolSize),
        position: p + this.position,
        anchor: Anchor.center,
      );
    });

    super.render(canvas);
  }

  @override
  void update(double dt) {
    final amount = 1200 * dt;

    if (isRoll) {
      reelPosition += amount;
      reelPosition %= reelLength;

      if (onCheckStopCurrent) {
        _stopCurrent();
        onCheckStopCurrent = false;
      }

      final index = _calcCenterIndex();
      final diff = slotCenter.y - calcHeight(index);
      if (diff.abs() < amount) {
        if (suberiState?.symbol == reel[index].symbol) {
          isRoll = false;
          suberiState = null;
          stopIndex = index;
          print('stop: ${reel[index].symbol}');
        }
      }
    }

    super.update(dt);
  }
}
