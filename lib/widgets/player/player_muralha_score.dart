import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/player_provider.dart';

class PlayerMuralhaScore extends StatelessWidget {
  final int round;

  // Construtor
  PlayerMuralhaScore(this.round);

  @override
  Widget build(BuildContext context) {
    final PlayerProvider player = Provider.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Muralha"),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: player.countMuralha(round) <= 0 ? null : () => player.removeMuralha(round),
            ),
            Text("${player.countMuralha(round).toString()}"),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => player.addMuralha(round),
            ),
          ],
        )
      ],
    );
  }
}
