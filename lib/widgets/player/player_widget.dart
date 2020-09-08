import 'package:alhambra_calculator/helpers/player_helper.dart';
import 'package:alhambra_calculator/providers/game.dart';
import 'package:alhambra_calculator/providers/player.dart';
import 'package:alhambra_calculator/widgets/player/player_detalhes.dart';
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
    Game game = Provider.of(context);
    return ChangeNotifierProvider.value(
      value: player,
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            width: 4.0,
            color: PlayerHelper.getPlayerColorDark(player.color),
          ),
        ),
        child: Consumer<Player>(
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
                          PlayerMuralhaScore(rodada),
                          PlayerScore(rodada),
                          PlayerTileScore(rodada),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: IconButton(
                          icon: player.mostrarDetalhes
                              ? Icon(Icons.keyboard_arrow_down)
                              : Icon(Icons.keyboard_arrow_up),
                          onPressed: () {
                            // game.closeAllDetalhe();
                            player.toggleDetalhes();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                if (player.mostrarDetalhes) PlayerDetalhes(rodada),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
