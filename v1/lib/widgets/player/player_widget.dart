import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/player_helper.dart';
import '../../providers/player_provider.dart';
import 'player_detalhe.dart';
import 'player_muralha_score.dart';
import 'player_score.dart';
import 'player_tile_score.dart';

class PlayerWidget extends StatelessWidget {
  final int round;
  final PlayerProvider player;

  // Construtor
  PlayerWidget(this.round, this.player);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: player,
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            width: 4.0,
            color: PlayerHelper.getPlayerColorDarker(player.color),
          ),
        ),
        elevation: 5,
        child: Consumer<PlayerProvider>(
          builder: (ctx, player, _) => Container(
            height: player.mostrarDetalhes ? 120 : 80,
            color: PlayerHelper.getPlayerColor(player.color).withOpacity(0.85),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          PlayerMuralhaScore(round),
                          PlayerScore(round),
                          PlayerTileScore(round),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: IconButton(
                          icon:
                              player.mostrarDetalhes ? Icon(Icons.keyboard_arrow_down) : Icon(Icons.keyboard_arrow_up),
                          onPressed: () {
                            player.toggleDetalhes();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: player.mostrarDetalhes,
                  child: PlayerDetalhe(round),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
