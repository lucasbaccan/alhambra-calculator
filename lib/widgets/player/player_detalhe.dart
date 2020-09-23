import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../color_bar_player_widget.dart';
import '../../helpers/player_helper.dart';
import '../../providers/player_provider.dart';

class PlayerDetalhe extends StatelessWidget {
  final int round;

  // Construtor
  PlayerDetalhe(this.round);

  @override
  Widget build(BuildContext context) {
    final PlayerProvider player = Provider.of(context);

    return Expanded(
      child: Container(
        color: PlayerHelper.getPlayerColorDarker(player.color),
        child: Center(
          child: ColorBarPlayer(round),
        ),
      ),
    );
  }
}
