import 'package:alhambra_calculator/providers/game.dart';
import 'package:alhambra_calculator/widgets/color_bar_widget.dart';
import 'package:alhambra_calculator/widgets/player/player_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoundScreen extends StatelessWidget {
  final int rodada;

  const RoundScreen(this.rodada);

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<Game>(context);

    return Column(
      children: <Widget>[
        ColorBar(),
        Divider(thickness: 2),
        Text(
          "Quantidade de peças na rodada ${rodada}",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView.builder(
              itemCount: game.playerCount,
              itemBuilder: (ctx, index) {
                return PlayerWidget(rodada - 1, game.playerList[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
