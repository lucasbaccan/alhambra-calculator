import 'package:alhambra_calculator/helpers/player_helper.dart';
import 'package:alhambra_calculator/models/player_model.dart';
import 'package:flutter/material.dart';

class PlayerAvatarWidget extends StatelessWidget {
  final double tamanho;
  final double borda;
  final PlayerModel player;

  const PlayerAvatarWidget(this.tamanho, this.borda, this.player);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: tamanho == null
          ? CircleAvatar(backgroundColor: PlayerHelper.getPlayerColor(player.color))
          : CircleAvatar(radius: tamanho, backgroundColor: PlayerHelper.getPlayerColor(player.color)),
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        border: new Border.all(
          color: PlayerHelper.getPlayerColorDarker(player.color),
          width: borda ?? 6,
        ),
      ),
    );
  }
}
