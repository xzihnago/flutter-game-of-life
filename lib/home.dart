import 'package:flutter/material.dart';
import 'game_of_life.dart';
import 'game_of_life_painter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final game = GameOfLife(32);
    game.randomize();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: StreamBuilder(
              stream: game.stream(const Duration(milliseconds: 100)),
              builder: (context, snapshot) => CustomPaint(
                size: const Size(400, 400),
                painter: GameOfLifePainter(
                  snapshot.data ?? [],
                  4,
                  Theme.of(context).textTheme.bodyMedium!.color!,
                ),
              ),
            ),
          ),
          const SizedBox(height: 64),
          ElevatedButton(
            onPressed: game.randomize,
            child: const Text('Randomize'),
          ),
        ],
      ),
    );
  }
}
