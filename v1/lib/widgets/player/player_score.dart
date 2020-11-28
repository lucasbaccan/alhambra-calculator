import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/player_provider.dart';

class PlayerScore extends StatelessWidget {
  final int rodada;

  // Construtor
  PlayerScore(this.rodada);
  @override
  Widget build(BuildContext context) {
    final PlayerProvider player = Provider.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Pontos"),
        Text("${player.getPontosRodada(rodada).toString()}"),
      ],
    );
  }
}
