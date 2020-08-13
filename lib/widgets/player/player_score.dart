import 'package:alhambra_calculator/providers/game.dart';
import 'package:alhambra_calculator/providers/player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerScore extends StatelessWidget {
  final int rodada;

  // Construtor
  PlayerScore(this.rodada);
  @override
  Widget build(BuildContext context) {
    final Player player = Provider.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Pontos"),
        Text("${player.getPontosRodada(rodada).toString()}"),
      ],
    );
  }
}
