import 'dart:math';

class GameOfLife {
  final int size;
  final List<List<bool>> grid = [];

  GameOfLife(this.size) {
    set(List.generate(
      size,
      (_) => List.generate(size, (_) => Random().nextBool()),
    ));
  }

  Stream<List<List<bool>>> stream(Duration duration) async* {
    while (true) {
      await Future.delayed(duration);
      update();

      yield grid;
    }
  }

  void set(List<List<bool>> next) => grid
    ..clear()
    ..addAll(next);

  void update() {
    final List<List<bool>> next = [];

    for (var y = 0; y < size; y++) {
      next.add([]);

      for (var x = 0; x < size; x++) {
        final alive = grid[y][x];
        final neighbors = checkNeighbors(y, x);

        if (alive && (neighbors == 2 || neighbors == 3)) {
          next[y].add(true);
        } else if (!alive && neighbors == 3) {
          next[y].add(true);
        } else {
          next[y].add(false);
        }
      }
    }

    set(next);
  }

  int checkNeighbors(int i, int j) {
    var count = 0;

    for (final offset in [
      [-1, -1],
      [0, -1],
      [1, -1],
      [1, 0],
      [1, 1],
      [0, 1],
      [-1, 1],
      [-1, 0],
    ]) {
      final x = i + offset[0];
      final y = j + offset[1];

      if (isInBound(x) && isInBound(y) && grid[x][y]) {
        count++;
      }
    }

    return count;
  }

  bool isInBound(int value) => value >= 0 && value < size;
}