import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slot/game.dart';

void main() async {
  final game = MyGame();

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dice Slot'),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Text('roll: [Space] stop: [A, S, D]'),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64),
                  child: GameWidget(game: game),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
