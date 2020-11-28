import 'package:alhambra_calculator/helpers/tile_helper.dart';
import 'package:alhambra_calculator/providers/tile_provider.dart';

import '../helpers/player_helper.dart';

class PlayerModel {
  // Cor do jogador
  final PlayerColor color;
  // Jogador ativo ou não
  bool _ativo = false;
  // Jogador nome
  String _nome = "";
  // Uma lista com 3 lista, 1 para cada rodada, que salva as peças que o jogador tem
  List<List<TileProvider>> _tilesList = [[], [], []];
  // Uma lista com 3 valores, 1 para cada rodada, que salva quantas muralhas o jogador tem
  List<int> _muralhaList = [0, 0, 0];
  // Pontos do jogador, uma lista com 3 valores, 1 para cada rodada, salva os pontos calculados
  List<int> _tilesScoreList = [0, 0, 0];

  PlayerModel(this.color);
  PlayerModel.ativo(this.color) : _ativo = true;

  // Métodos

  // Ativo
  bool get ativo => _ativo;
  set ativo(bool ativo) => _ativo = ativo;

  // Nome
  String get nome => _nome;
  set nome(String nome) => _nome = nome;

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
  }

  void removeTile(int rodada, TileColor tileColor) {
    if (_tilesList[rodada].where((tile) => tile.color == tileColor).isNotEmpty) {
      TileProvider tile = _tilesList[rodada].where((tile) => tile.color == tileColor).first;
      tile.removeTile();
      if (tile.count == 0) {
        _tilesList[rodada].remove(tile);
      }
    }
  }

  // Muralha
  int countMuralha(int rodada) {
    return _muralhaList[rodada];
  }

  void addMuralha(int rodada) {
    _muralhaList[rodada]++;
  }

  void removeMuralha(int rodada) {
    if (_muralhaList[rodada] <= 0) return;
    _muralhaList[rodada]--;
  }

  // TilesScore
  int getTilesScore(int rodada) {
    return _tilesScoreList[rodada];
  }

  void addTilesScore(int rodada, int pontos) {
    _tilesScoreList[rodada] += pontos;
  }

  void zerarTileScore(int rodada, int pontos) {
    _tilesScoreList[rodada] = 0;
  }

  int getPontosRodada(int rodada) => _tilesScoreList[rodada] + _muralhaList[rodada];

  int getTotalPontos() => getPontosRodada(0) + getPontosRodada(1) + getPontosRodada(2);
}
