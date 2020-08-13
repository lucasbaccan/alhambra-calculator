import 'package:alhambra_calculator/providers/game.dart';
import 'package:alhambra_calculator/providers/player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerMuralhaScore extends StatelessWidget {
  final int rodada;

  // Construtor
  PlayerMuralhaScore(this.rodada);

  @override
  Widget build(BuildContext context) {
    final Player player = Provider.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Muralha"),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.remove),
              onPressed:
                  player.countMuralha(rodada) <= 0 ? null : () => player.removeMuralha(rodada),
            ),
            Text("${player.countMuralha(rodada).toString()}"),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => player.addMuralha(rodada),
            ),
          ],
        )
      ],
    );
  }
}
