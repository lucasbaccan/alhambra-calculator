import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';
import '../widgets/color_bar_widget.dart';
import '../widgets/player/player_widget.dart';

class RoundScreen extends StatelessWidget {
  final int round;

  const RoundScreen(this.round);

  @override
  Widget build(BuildContext context) {
    final GameProvider game = Provider.of(context);

    return Column(
      children: <Widget>[
        ColorBar(),
        Divider(thickness: 2),
        Text(
          "Quantidade de peças na rodada $round",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView.builder(
              itemCount: game.playerCount,
              itemBuilder: (ctx, index) {
                return PlayerWidget(round - 1, game.playerList[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
