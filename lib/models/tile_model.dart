import '../helpers/tile_helper.dart';
import 'package:flutter/foundation.dart';

class TileModel with ChangeNotifier {
  final TileColor color;
  int _count = 0;

  // Construtor
  TileModel(this.color);

  // Métodos
  int get count => _count;

  void addTile() {
    _count++;
  }

  void removeTile() {
    _count--;
  }
}
