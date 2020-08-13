import 'package:alhambra_calculator/helpers/player_helper.dart';
import 'package:alhambra_calculator/helpers/tile_helper.dart';
import 'package:alhambra_calculator/providers/player.dart';
import 'package:flutter/cupertino.dart';

class Game with ChangeNotifier {
  Map<TileColor, int> _tilesLeft = {};

  List<Player> _playerList = [
    Player(PlayerColor.BLUE),
    Player(PlayerColor.RED),
  ];

  TileColor _colorSelected = TileColor.BLUE;

  // Métodos
  List<Player> get playerList {
    return [..._playerList];
  }

  int get playerCount {
    return _playerList.length;
  }

  // Player
  bool playerInList(PlayerColor playerColor) {
    return _playerList.where((player) => player.color == playerColor).toList().isNotEmpty;
  }

  void addPlayer(PlayerColor playerColor) {
    _playerList.add(Player(playerColor));
    notifyListeners();
  }

  void removePlayer(PlayerColor playerColor) {
    _playerList.remove(_playerList.where((player) => player.color == playerColor).toList().first);
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

    for (Player player in _playerList) {
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

  // Reiniciar jogo
  void reiniciarJogo() {
    _playerList.clear();
    for (TileColor tileColor in TileColor.values) {
      tilesLeftByColorCalculation(tileColor);
    }
    // Muda cor selecionada
    _colorSelected = TileColor.BLUE;
    // Adiciona dois jogadores para não vir em branco
    _playerList.add(Player(PlayerColor.BLUE));
    _playerList.add(Player(PlayerColor.RED));

    notifyListeners();
  }

  // Calcular pontos jogo
  void calcularPontosRodada(int rodada) {
    // Zera todos os pontos para poder calcular no metodo
    zerarPontuacaoJogadores(rodada);

    // Passar por todas as cores
    for (TileColor tileColor in TileColor.values) {
      // if (tileColor != TileColor.RED) continue;

      // Para cada cor, pegar os jogadores com nais peças
      Map<int, List<Player>> groupPlayerTiles = {};

      for (Player player in _playerList) {
        var countTilesPlayer = player.countTile(rodada, tileColor);
        if (groupPlayerTiles.containsKey(countTilesPlayer)) {
          groupPlayerTiles[countTilesPlayer].add(player);
        } else {
          groupPlayerTiles.putIfAbsent(countTilesPlayer, () {
            List<Player> jogadores = [];
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
      int totalPontosDividir;
      int pontosPrimeiroLugar = TileHelper.getTileScore(rodada + 1, tileColor);
      int pontosSegundoLugar = TileHelper.getTileScore(rodada, tileColor);
      int pontosTerceiroLugar = TileHelper.getTileScore(rodada - 1, tileColor);
      // -------------------------------------------------------------
      int tamanhoLista = keysOrdenados.length;
      List<Player> primeiroLista = groupPlayerTiles[keysOrdenados[tamanhoLista - 1]];
      List<Player> segundoLista = tamanhoLista > 1 && keysOrdenados[tamanhoLista - 2] != 0
          ? groupPlayerTiles[keysOrdenados[tamanhoLista - 2]]
          : [];
      List<Player> terceiroLista = tamanhoLista > 2 && keysOrdenados[tamanhoLista - 3] != 0
          ? groupPlayerTiles[keysOrdenados[tamanhoLista - 3]]
          : [];
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
      totalPontosDividir = (totalPontosDividir / primeiroLista.length).floor();
      for (Player jogador in primeiroLista) {
        jogador.addTilesScore(rodada, totalPontosDividir);
      }
      // -------------------------------------------------------------
      // Segundo Lugar
      if (segundoLista.length != 0) {
        totalPontosDividir = pontosSegundoLugar;
        if (rodada == 2 && segundoLista.length >= 2) {
          // Rodada 3, soma os pontos se tiver tres pessoas ou mais
          totalPontosDividir += pontosTerceiroLugar;
          pontosTerceiroLugar = 0;
        }
        // Pega o total de pontos e divide entre as pessoas
        totalPontosDividir = (totalPontosDividir / segundoLista.length).floor();
        for (Player jogador in segundoLista) {
          jogador.addTilesScore(rodada, totalPontosDividir);
        }
      }
      // -------------------------------------------------------------
      // Terceiro Lugar
      if (terceiroLista.length != 0) {
        totalPontosDividir = pontosTerceiroLugar;
        totalPontosDividir = (totalPontosDividir / terceiroLista.length).floor();
        for (Player jogador in terceiroLista) {
          jogador.addTilesScore(rodada, totalPontosDividir);
        }
      }
    }
  }

  void zerarPontuacaoJogadores(int rodada) {
    for (Player player in _playerList) {
      player.zerarTileScore(rodada, 0);
    }
  }
}
