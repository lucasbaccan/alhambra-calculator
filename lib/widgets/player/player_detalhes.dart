import 'package:alhambra_calculator/helpers/player_helper.dart';
import 'package:alhambra_calculator/providers/player.dart';
import 'package:alhambra_calculator/widgets/color_bar_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerDetalhes extends StatelessWidget {
  final int rodada;

  // Construtor
  PlayerDetalhes(this.rodada);

  @override
  Widget build(BuildContext context) {
    final Player player = Provider.of(context);

    return Expanded(
      child: Container(
        color: PlayerHelper.getPlayerColorDark(player.color),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 5),
            child: ColorBarPlayer(rodada),
          ),
        ),
      ),
    );
  }
}
