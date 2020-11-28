import 'package:alhambra_calculator/helpers/tile_helper.dart';
import 'package:alhambra_calculator/models/player_model.dart';

import '../helpers/player_helper.dart';
import 'package:flutter/foundation.dart';
import 'player_provider.dart';

class GameProvider with ChangeNotifier {
  Map<TileColor, int> _tilesLeft = {};

  // Lista de todos os jogadores,
  List<PlayerModel> _playerList = [
    PlayerModel.ativo(PlayerColor.BLUE),
    PlayerModel.ativo(PlayerColor.RED),
    PlayerModel(PlayerColor.ORANGE),
    PlayerModel(PlayerColor.WHITE),
    PlayerModel(PlayerColor.GREEN),
    PlayerModel(PlayerColor.YELLOW),
  ];

  List<PlayerModel> _playerListAtivo = [
    PlayerModel(PlayerColor.BLUE),
    PlayerModel(PlayerColor.RED),
  ];

  // Cor atual
  TileColor _colorSelected = TileColor.BLUE;

  // Métodos

  // Player List
  List<PlayerModel> get playerList {
    return [..._playerList];
  }

  // Players Ativos
  List<PlayerModel> get playerListAtivos {
    return [..._playerListAtivo];
  }

  PlayerModel playerByColor(PlayerColor corJogador) {
    return _playerList.where((player) => player.color == corJogador).first;
  }

  void addPlayer(PlayerModel playerModel) {
    _playerListAtivo.add(playerModel);
    notifyListeners();
  }

  void removePlayer(PlayerModel playerModel) {
    _playerListAtivo.removeWhere((player) => player.color == playerModel.color);
    notifyListeners();
  }

  // Selected color
  TileColor get colorSelected {
    return _colorSelected;
  }

  void changeSelectedColor(TileColor tileColor) {
    _colorSelected = tileColor;
    notifyListeners();
  }

  // Tiles
  void tilesLeftByColorCalculation(TileColor color) {
    if (!_tilesLeft.containsKey(color)) {
      _tilesLeft.putIfAbsent(color, () => TileHelper.getTileMaxPiece(color));
    }
    int left = TileHelper.getTileMaxPiece(color);

    for (PlayerModel player in playerList) {
      int count1 = player.countTile(0, color);
      int count2 = player.countTile(1, color);

      if (count1 < count2) {
        count1 = count2;
      }

      count2 = player.countTile(2, color);
      if (count1 < count2) {
        count1 = count2;
      }

      left = left - count1;
    }

    _tilesLeft.update(color, (value) => left);
    notifyListeners();
  }

  int tilesLeftByColor(TileColor tileColor) {
    if (_tilesLeft.containsKey(tileColor)) {
      return _tilesLeft[tileColor];
    }
    return TileHelper.getTileMaxPiece(tileColor);
  }

  // Calcular pontos
  // Calcular pontos jogo
  void calcularPontosRodada(int rodada) {
    // Zera todos os pontos para poder calcular no metodo
    zerarPontuacaoJogadores(rodada);
    // scoreExplain[rodada].clear();

    // Passar por todas as cores
    for (TileColor tileColor in TileColor.values) {
      // if (tileColor != TileColor.RED) continue;

      // Para cada cor, pegar os jogadores com nais peças
      Map<int, List<PlayerModel>> groupPlayerTiles = {};

      for (PlayerModel player in playerList) {
        var countTilesPlayer = player.countTile(rodada, tileColor);
        if (groupPlayerTiles.containsKey(countTilesPlayer)) {
          groupPlayerTiles[countTilesPlayer].add(player);
        } else {
          groupPlayerTiles.putIfAbsent(countTilesPlayer, () {
            List<PlayerModel> jogadores = [];
            jogadores.add(player);
            return jogadores;
          });
        }
      }

      // Ordena por quantidade de peças em modo crescente( 0, 1 ,2, 3)
      List<int> keysOrdenados = groupPlayerTiles.keys.toList()..sort();

      // Se a lista não tiver player com tile, pula a cor
      if (keysOrdenados.last == 0) continue;

      // Quantidade de pontos que a peça consegue fazer na rodada;
      int totalPontos;
      int totalPontosDividir;
      int pontosPrimeiroLugar = TileHelper.getTileScore(rodada + 1, tileColor);
      int pontosSegundoLugar = TileHelper.getTileScore(rodada, tileColor);
      int pontosTerceiroLugar = TileHelper.getTileScore(rodada - 1, tileColor);
      // -------------------------------------------------------------
      int tamanhoLista = keysOrdenados.length;
      List<PlayerModel> primeiroLista = groupPlayerTiles[keysOrdenados[tamanhoLista - 1]];
      List<PlayerModel> segundoLista =
          tamanhoLista > 1 && keysOrdenados[tamanhoLista - 2] != 0 ? groupPlayerTiles[keysOrdenados[tamanhoLista - 2]] : [];
      List<PlayerModel> terceiroLista =
          tamanhoLista > 2 && keysOrdenados[tamanhoLista - 3] != 0 ? groupPlayerTiles[keysOrdenados[tamanhoLista - 3]] : [];
      // -------------------------------------------------------------
      // Primeiro lugar
      totalPontosDividir = pontosPrimeiroLugar;
      if (rodada >= 1 && primeiroLista.length >= 2) {
        // Rodada 2, só tem pontos de primeiro e segundo lugar.
        // Só divide pontos de segundo lugar, se o primeiro lugar empatou com pelo menos 2 pessoas.
        totalPontosDividir += pontosSegundoLugar;
        pontosSegundoLugar = 0;
      }
      if (rodada == 2 && primeiroLista.length >= 3) {
        // Rodada 3, soma os pontos se tiver tres pessoas ou mais
        totalPontosDividir += pontosTerceiroLugar;
        pontosTerceiroLugar = 0;
      }
      // Pega o total de pontos e divide entre as pessoas
      totalPontos = totalPontosDividir;
      totalPontosDividir = (totalPontosDividir / primeiroLista.length).floor();
      for (PlayerModel jogador in primeiroLista) {
        jogador.addTilesScore(rodada, totalPontosDividir);
        // scoreExplain[rodada].add(
        //     ScoreExplainModel(jogador.color, tileColor, "$totalPontosDividir ($totalPontos/${primeiroLista.length})"));
      }
      // -------------------------------------------------------------
      // Segundo Lugar
      if (segundoLista.length != 0) {
        totalPontosDividir = pontosSegundoLugar;
        if (rodada == 2 && (segundoLista.length >= 2 || (pontosSegundoLugar == 0 && pontosTerceiroLugar != 0))) {
          // Rodada 3, soma os pontos se tiver tres pessoas ou mais
          totalPontosDividir += pontosTerceiroLugar;
          pontosTerceiroLugar = 0;
        }
        // Pega o total de pontos e divide entre as pessoas
        totalPontos = totalPontosDividir;
        totalPontosDividir = (totalPontosDividir / segundoLista.length).floor();
        for (PlayerModel jogador in segundoLista) {
          jogador.addTilesScore(rodada, totalPontosDividir);
          // scoreExplain[rodada].add(
          //     ScoreExplainModel(jogador.color, tileColor, "$totalPontosDividir ($totalPontos/${segundoLista.length})"));
        }
      }
      // -------------------------------------------------------------
      // Terceiro Lugar
      if (terceiroLista.length != 0) {
        totalPontosDividir = pontosTerceiroLugar;
        totalPontos = totalPontosDividir;
        totalPontosDividir = (totalPontosDividir / terceiroLista.length).floor();
        for (PlayerModel jogador in terceiroLista) {
          jogador.addTilesScore(rodada, totalPontosDividir);
          // scoreExplain[rodada].add(ScoreExplainModel(
          //     jogador.color, tileColor, "$totalPontosDividir ($totalPontos/${terceiroLista.length})"));
        }
      }
    }
  }

  void zerarPontuacaoJogadores(int rodada) {
    for (PlayerModel player in playerList) {
      player.zerarTileScore(rodada, 0);
    }
  }

  // Reiniciar jogo
  void restartGame() {
    // scoreExplain = [[], [], []];

    for (TileColor tileColor in TileColor.values) {
      tilesLeftByColorCalculation(tileColor);
    }
    // Muda cor selecionada
    _colorSelected = TileColor.BLUE;
    // Adiciona dois jogadores para não vir em branco
    _playerList = [
      PlayerModel.ativo(PlayerColor.BLUE),
      PlayerModel.ativo(PlayerColor.RED),
      PlayerModel(PlayerColor.ORANGE),
      PlayerModel(PlayerColor.WHITE),
      PlayerModel(PlayerColor.GREEN),
      PlayerModel(PlayerColor.YELLOW),
    ];

    _playerListAtivo = [
      PlayerModel(PlayerColor.BLUE),
      PlayerModel(PlayerColor.RED),
    ];

    notifyListeners();
  }
}
