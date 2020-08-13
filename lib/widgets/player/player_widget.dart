import 'package:alhambra_calculator/helpers/player_helper.dart';
import 'package:alhambra_calculator/providers/player.dart';
import 'package:alhambra_calculator/widgets/player/player_score.dart';
import 'package:alhambra_calculator/widgets/player/player_tile_score.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'player_muralha_score.dart';

class PlayerWidget extends StatelessWidget {
  final int rodada;
  final Player player;

  // Construtor
  PlayerWidget(this.rodada, this.player);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          width: 4.0,
          color: PlayerHelper.getPlayerColorDark(player.color),
        ),
      ),
      child: Container(
        height: 80,
        color: PlayerHelper.getPlayerColor(player.color).withOpacity(0.85),
        child: ChangeNotifierProvider.value(
          value: player,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              PlayerMuralhaScore(rodada),
              PlayerScore(rodada),
              PlayerTileScore(rodada),
            ],
          ),
        ),
      ),
    );
  }
}
