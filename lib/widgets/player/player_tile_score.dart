import 'dart:math';

import 'package:alhambra_calculator/providers/game.dart';
import 'package:alhambra_calculator/providers/player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerTileScore extends StatelessWidget {
  final int rodada;

  // Construtor
  PlayerTileScore(this.rodada);

  @override
  Widget build(BuildContext context) {
    final Game game = Provider.of(context);
    final Player player = Provider.of(context);

    void removerTile() {
      player.removeTile(rodada, game.colorSelected);
      game.tilesLeftByColorCalculation(game.colorSelected);
      game.calcularPontosRodada(rodada);
    }

    void adicionarTile() {
      player.addTile(rodada, game.colorSelected);
      game.tilesLeftByColorCalculation(game.colorSelected);
      game.calcularPontosRodada(rodada);
    }

    bool disableRemoveButton() {
      // Verifica se o jogador tem peças ou não para poder remover.
      return player.countTile(rodada, game.colorSelected) <= 0;
    }

    bool disableAddButton() {
      // Verifica se tem peças sobrando
      bool acabouPecas = game.tilesLeftByColor(game.colorSelected) <= 0;

      // Esta na primeira rodada e não tem mais peças sobrando
      if (rodada == 0 && acabouPecas) {
        return true;
      }
      // Se o jogador estiver em outra rodada e não tiver mais peças
      // ele pode adicionar até a quantidade de peças que ele tinha na rodada anterior.
      if (acabouPecas) {
        List<int> valores = [];
        if (rodada == 1) {
          valores.add(player.countTile(rodada - 1, game.colorSelected));
        } else {
          valores.add(player.countTile(rodada - 1, game.colorSelected));
          valores.add(player.countTile(rodada - 2, game.colorSelected));
        }

        if (player.countTile(rodada, game.colorSelected) >= valores.reduce(max)) {
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
            IconButton(
                icon: Icon(Icons.remove), onPressed: disableRemoveButton() ? null : removerTile),
            Text("${player.countTile(rodada, game.colorSelected).toString()}"),
            IconButton(icon: Icon(Icons.add), onPressed: disableAddButton() ? null : adicionarTile),
          ],
        )
      ],
    );
  }
}
