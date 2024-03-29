import 'package:flutter/foundation.dart';

import './tile_provider.dart';
import '../helpers/player_helper.dart';
import '../helpers/tile_helper.dart';

class PlayerProvider with ChangeNotifier {
  final PlayerColor color;
  // Uma lista com 3 lista, 1 para cada rodada
  List<List<TileProvider>> _tilesList = [[], [], []];
  // Uma lista com 3 valores, 1 para cada rodada
  List<int> _muralhaList = [0, 0, 0];
  // Pontos do jogador, uma lista com 3 valores, 1 para cada rodada
  List<int> _tilesScoreList = [0, 0, 0];
  // Detalhes expandir
  bool mostrarDetalhes = false;
  // Jogador nome
  String nome = "";

  // Construtor
  // PlayerProvider(this.color);
  PlayerProvider(this.color);

  //Métodos

  // Tiles
  int countTile(int rodada, TileColor tileColor) {
    if (_tilesList[rodada].where((tile) => tile.color == tileColor).isNotEmpty) {
      return _tilesList[rodada].where((tile) => tile.color == tileColor).first.count;
    }
    return 0;
  }

  void addTile(int rodada, TileColor tileColor) {
    if (_tilesList[rodada].where((tile) => tile.color == tileColor).isEmpty) {
      TileProvider newTile = TileProvider(tileColor);
      newTile.addTile();
      _tilesList[rodada].add(newTile);
    } else {
      _tilesList[rodada].where((tile) => tile.color == tileColor).first.addTile();
    }
    notifyListeners();
  }

  void removeTile(int rodada, TileColor tileColor) {
    if (_tilesList[rodada].where((tile) => tile.color == tileColor).isNotEmpty) {
      TileProvider tile = _tilesList[rodada].where((tile) => tile.color == tileColor).first;
      tile.removeTile();
      if (tile.count == 0) {
        _tilesList[rodada].remove(tile);
      }
      notifyListeners();
    }
  }

  // Muralha
  int countMuralha(int rodada) {
    return _muralhaList[rodada];
  }

  void addMuralha(int rodada) {
    _muralhaList[rodada]++;
    notifyListeners();
  }

  void removeMuralha(int rodada) {
    if (_muralhaList[rodada] <= 0) return;
    _muralhaList[rodada]--;
    notifyListeners();
  }

  // TilesScore
  int getTilesScore(int rodada) {
    return _tilesScoreList[rodada];
  }

  void addTilesScore(int rodada, int pontos) {
    _tilesScoreList[rodada] += pontos;
    notifyListeners();
  }

  void zerarTileScore(int rodada, int pontos) {
    _tilesScoreList[rodada] = 0;
    notifyListeners();
  }

  int getPontosRodada(int rodada) => _tilesScoreList[rodada] + _muralhaList[rodada];

  int getTotalPontos() => getPontosRodada(0) + getPontosRodada(1) + getPontosRodada(2);

  void toggleDetalhes() {
    mostrarDetalhes = !mostrarDetalhes;
    notifyListeners();
  }

  // Nome
  void editNome(String value) {
    nome = value;
    notifyListeners();
  }
}
