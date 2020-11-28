import 'package:alhambra_calculator/helpers/player_helper.dart';
import 'package:alhambra_calculator/models/player_model.dart';
import 'package:alhambra_calculator/providers/app_provider.dart';
import 'package:alhambra_calculator/providers/game_provider.dart';
import 'package:alhambra_calculator/providers/player_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerMuralhaScoreWidget extends StatelessWidget {
  final PlayerModel player;
  final double tamanho;
  const PlayerMuralhaScoreWidget(this.player, this.tamanho);

  @override
  Widget build(BuildContext context) {
    final PlayerProvider playerProvider = Provider.of(context);
    final AppProvider appProvider = Provider.of(context);

    final int rodada = appProvider.getCurrentIndex;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 5),
        Text(
          "Muralha",
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: tamanho,
              width: tamanho,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.remove),
                onPressed:
                    playerProvider.countMuralha(rodada, player) == 0 ? null : () => playerProvider.removeMuralha(rodada, player),
                splashRadius: 15,
                splashColor: PlayerHelper.getPlayerColorDarker(player.color),
              ),
            ),
            SizedBox(width: 20, child: Center(child: Text("${playerProvider.countMuralha(rodada, player)}"))),
            SizedBox(
              height: tamanho,
              width: tamanho,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.add),
                onPressed: () => playerProvider.addMuralha(rodada, player),
                splashRadius: 15,
                splashColor: PlayerHelper.getPlayerColorDarker(player.color),
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
