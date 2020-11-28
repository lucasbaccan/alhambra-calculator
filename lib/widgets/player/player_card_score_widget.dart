import 'package:alhambra_calculator/helpers/color_helper.dart';
import 'package:alhambra_calculator/helpers/player_helper.dart';
import 'package:alhambra_calculator/models/player_model.dart';
import 'package:alhambra_calculator/providers/app_provider.dart';
import 'package:alhambra_calculator/providers/game_provider.dart';
import 'package:alhambra_calculator/providers/player_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerCardScoreWidget extends StatelessWidget {
  final PlayerModel player;

  const PlayerCardScoreWidget(this.player);

  @override
  Widget build(BuildContext context) {
    final PlayerProvider playerProvider = Provider.of(context);
    final AppProvider appProvider = Provider.of(context);
    final GameProvider gameProvider = Provider.of(context);

    final int rodada = appProvider.getCurrentIndex;

    return Column(
      children: [
        SizedBox(height: 5),
        Text("Pontos"),
        Container(
          height: 30,
          width: 60,
          child: RaisedButton(
            color: ColorHelper.lighten(PlayerHelper.getPlayerColor(player.color), 0.15),
            shape: CircleBorder(
              side: BorderSide(
                width: 2,
                color: Colors.black38,
              ),
            ),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: FittedBox(
                child: Text("${player.getPontosRodada(rodada)}"),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
