import 'package:cards_game/models/unit.dart';
import 'package:flutter/material.dart';

class Player {
  final int id;
  final Color color;
  final int quarterTurns;
  final List<Unit> units = [];
  int commandPoints;
  int health;
  bool turnPassed = false;
  Status status = Status.playing;

  static int INITIAL_CP = 10;
  static int INITIAL_HEALTH = 100;

  Player({
    @required this.id,
    @required this.color,
    @required this.commandPoints,
    @required this.health,
  }) : quarterTurns = 0; //(id == 1) ? 0 : 2;

  void addUnit(Unit unit) {
    units.add(unit);
    commandPoints -= unit.cost;
  }

  void removeUnit(Unit unit) {
    units.remove(unit);
    commandPoints += unit.cost;
  }

  void clearUnits() {
    final List<Unit> alive = units.where((u) => u.isAlive).toList();
    units.clear();
    units.addAll(alive);
  }
}

enum Status {
  playing,
  winner,
  loser,
}
