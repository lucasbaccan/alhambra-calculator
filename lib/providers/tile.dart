import 'package:alhambra_calculator/helpers/tile_helper.dart';
import 'package:flutter/material.dart';

class Tile with ChangeNotifier {
  final TileColor color;
  int _count = 0;

  // Construtor
  Tile(this.color);

  // Métodos
  int get count => _count;

  void addTile() {
    _count++;
    notifyListeners();
  }

  void removeTile() {
    _count--;
    notifyListeners();
  }
}
