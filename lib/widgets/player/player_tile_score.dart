import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/game_provider.dart';
import '../../providers/player_provider.dart';

class PlayerTileScore extends StatelessWidget {
  final int round;

  // Construtor
  PlayerTileScore(this.round);

  @override
  Widget build(BuildContext context) {
    final GameProvider game = Provider.of(context);
    final PlayerProvider player = Provider.of(context);

    void removerTile() {
      player.removeTile(round, game.colorSelected);
      game.tilesLeftByColorCalculation(game.colorSelected);
      game.calcularPontosRodada(round);
    }

    void adicionarTile() {
      player.addTile(round, game.colorSelected);
      game.tilesLeftByColorCalculation(game.colorSelected);
      game.calcularPontosRodada(round);
    }

    bool disableRemoveButton() {
      // Verifica se o jogador tem peças ou não para poder remover.
      return player.countTile(round, game.colorSelected) <= 0;
    }

    bool disableAddButton() {
      // Verifica se tem peças sobrando
      bool acabouPecas = game.tilesLeftByColor(game.colorSelected) <= 0;

      // Esta na primeira rodada e não tem mais peças sobrando
      if (round == 0 && acabouPecas) {
        return true;
      }
      // Se o jogador estiver em outra rodada e não tiver mais peças
      // ele pode adicionar até a quantidade de peças que ele tinha na rodada anterior.
      if (acabouPecas) {
        List<int> valores = [];
        if (round == 1) {
          valores.add(player.countTile(round - 1, game.colorSelected));
        } else {
          valores.add(player.countTile(round - 1, game.colorSelected));
          valores.add(player.countTile(round - 2, game.colorSelected));
        }

        if (player.countTile(round, game.colorSelected) >= valores.reduce(max)) {
          return true;
        }
      }
      return false;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Construções"),
        Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.remove), onPressed: disableRemoveButton() ? null : removerTile),
            Text("${player.countTile(round, game.colorSelected).toString()}"),
            IconButton(icon: Icon(Icons.add), onPressed: disableAddButton() ? null : adicionarTile),
          ],
        )
      ],
    );
  }
}
