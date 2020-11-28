import 'package:flutter/foundation.dart';

import '../helpers/tile_helper.dart';

class TileProvider with ChangeNotifier {
  final TileColor color;
  int _count = 0;

  // Construtor
  TileProvider(this.color);

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
