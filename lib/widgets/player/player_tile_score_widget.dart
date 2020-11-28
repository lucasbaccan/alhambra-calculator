import 'package:alhambra_calculator/helpers/player_helper.dart';
import 'package:alhambra_calculator/helpers/tile_helper.dart';
import 'package:alhambra_calculator/models/player_model.dart';
import 'package:alhambra_calculator/providers/app_provider.dart';
import 'package:alhambra_calculator/providers/game_provider.dart';
import 'package:alhambra_calculator/providers/player_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerTileScoreWidget extends StatelessWidget {
  final PlayerModel player;
  final double tamanho;
  const PlayerTileScoreWidget(this.player, this.tamanho);

  @override
  Widget build(BuildContext context) {
    final PlayerProvider playerProvider = Provider.of(context);
    final AppProvider appProvider = Provider.of(context);
    final GameProvider gameProvider = Provider.of(context);

    final int rodada = appProvider.getCurrentIndex;

    void removerTile() {
      playerProvider.removeTile(rodada, player, gameProvider.colorSelected);
      gameProvider.tilesLeftByColorCalculation(gameProvider.colorSelected);
      gameProvider.calcularPontosRodada(rodada);
    }

    void adicionarTile() {
      playerProvider.addTile(rodada, player, gameProvider.colorSelected);
      gameProvider.tilesLeftByColorCalculation(gameProvider.colorSelected);
      gameProvider.calcularPontosRodada(rodada);
    }

    return FittedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 5),
          Text(
            "Peças",
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: tamanho,
                width: tamanho,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.remove),
                  onPressed: removerTile,
                  splashRadius: 15,
                  splashColor: PlayerHelper.getPlayerColorDarker(player.color),
                ),
              ),
              SizedBox(
                width: 20,
                child: Center(
                  child: Text("${playerProvider.countTile(rodada, player, gameProvider.colorSelected)}"),
                ),
              ),
              SizedBox(
                height: tamanho,
                width: tamanho,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.add),
                  onPressed: adicionarTile,
                  splashRadius: 15,
                  splashColor: PlayerHelper.getPlayerColorDarker(player.color),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
