import 'package:alhambra_calculator/helpers/tile_helper.dart';
import 'package:alhambra_calculator/models/player_model.dart';
import 'package:flutter/foundation.dart';

import './tile_provider.dart';
import '../helpers/player_helper.dart';

class PlayerProvider with ChangeNotifier {
  // // Uma lista com 3 lista, 1 para cada rodada, que salva as peças que o jogador tem
  // List<List<TileProvider>> _tilesList = [[], [], []];
  // // Uma lista com 3 valores, 1 para cada rodada, que salva quantas muralhas o jogador tem
  // List<int> _muralhaList = [0, 0, 0];
  // // Pontos do jogador, uma lista com 3 valores, 1 para cada rodada, salva os pontos calculados
  // List<int> _tilesScoreList = [0, 0, 0];
  // // Detalhes expandir
  // bool mostrarDetalhes = false;

  // Métodos

  // Ativo
  void toggleAtivo(PlayerModel player) {
    player.ativo = !player.ativo;
    notifyListeners();
  }

  // Nome
  void updateNome(PlayerModel player, String nome) {
    player.nome = nome;
    notifyListeners();
  }

  // // Tiles
  int countTile(int rodada, PlayerModel player, TileColor tileColor) {
    return player.countTile(rodada, tileColor);
  }

  void addTile(int rodada, PlayerModel player, TileColor tileColor) {
    player.addTile(rodada, tileColor);
    notifyListeners();
  }

  void removeTile(int rodada, PlayerModel player, TileColor tileColor) {
    player.removeTile(rodada, tileColor);
    notifyListeners();
  }

  // Muralha
  int countMuralha(int rodada, PlayerModel player) {
    return player.countMuralha(rodada);
  }

  void addMuralha(int rodada, PlayerModel player) {
    player.addMuralha(rodada);
    notifyListeners();
  }

  void removeMuralha(int rodada, PlayerModel player) {
    player.removeMuralha(rodada);
    notifyListeners();
  }

  // TilesScore
  void addTilesScore(int rodada, PlayerModel player, int pontos) {
    player.addTilesScore(rodada, pontos);
    notifyListeners();
  }

  void zerarTileScore(int rodada, PlayerModel player, int pontos) {
    player.zerarTileScore(rodada, pontos);
    notifyListeners();
  }

  // int getPontosRodada(int rodada) => _tilesScoreList[rodada] + _muralhaList[rodada];

  // int getTotalPontos() => getPontosRodada(0) + getPontosRodada(1) + getPontosRodada(2);

  // void toggleDetalhes() {
  //   mostrarDetalhes = !mostrarDetalhes;
  //   notifyListeners();
  // }

  // // Nome
  // void editNome(String value) {
  //   nome = value;
  //   notifyListeners();
  // }
}
