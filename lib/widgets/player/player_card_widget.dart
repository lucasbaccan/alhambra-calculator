import 'package:alhambra_calculator/helpers/player_helper.dart';
import 'package:alhambra_calculator/models/player_model.dart';
import 'package:alhambra_calculator/providers/player_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'player_card_score_widget.dart';
import 'player_muralha_score_widget.dart';
import 'player_tile_score_widget.dart';

class PlayerCardWidget extends StatelessWidget {
  final PlayerModel player;

  const PlayerCardWidget(this.player);

  @override
  Widget build(BuildContext context) {
    final PlayerProvider playerProvider = Provider.of(context);

    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          width: 4.0,
          color: PlayerHelper.getPlayerColorDarker(player.color),
        ),
      ),
      color: PlayerHelper.getPlayerColor(player.color),
      child: Container(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 5),
              ChangeNotifierProvider<PlayerProvider>.value(
                value: playerProvider,
                child: player.nome.isEmpty ? Text("Jogador ${PlayerHelper.getPlayerText(player.color)}") : Text(player.nome),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PlayerCardScoreWidget(player),
                  PlayerMuralhaScoreWidget(player, 35),
                  PlayerTileScoreWidget(player, 35),
                  PlayerCardScoreWidget(player),
                ],
              )
            ],
          ),
        ),
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    //   child: Container(
    //     color: PlayerHelper.getPlayerColorDarker(player.color),
    //     height: 100,
    //   ),
    // );
  }
}
