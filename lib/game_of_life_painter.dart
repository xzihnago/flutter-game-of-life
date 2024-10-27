import 'package:flutter/material.dart';

class GameOfLifePainter extends CustomPainter {
  final List<List<bool>> grid;
  final double radius;
  final Color color;

  GameOfLifePainter(this.grid, this.radius, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    for (var y = 0; y < grid.length; y++) {
      final row = grid[y];

      for (var x = 0; x < row.length; x++) {
        if (row[x]) {
          canvas.drawRRect(
            RRect.fromRectAndRadius(
              Rect.fromLTWH(
                x * size.width / row.length,
                y * size.height / grid.length,
                size.width / row.length,
                size.height / grid.length,
              ),
              Radius.circular(radius),
            ),
            Paint()..color = color,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
