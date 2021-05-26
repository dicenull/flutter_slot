import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slot/game.dart';

void main() async {
  final game = MyGame();

  runApp(GameWidget(game: game));
}
