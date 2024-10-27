import 'package:flutter/material.dart';
import './game_of_life.dart';
import './game_of_life_painter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(child: stream()),
      );

  StreamBuilder<List<List<bool>>> stream() => StreamBuilder(
        stream: GameOfLife(32).stream(const Duration(milliseconds: 100)),
        builder: (context, snapshot) => CustomPaint(
          size: const Size(400, 400),
          painter: GameOfLifePainter(
            snapshot.data ?? [],
            4,
            Theme.of(context).textTheme.bodyMedium!.color!,
          ),
        ),
      );
}
