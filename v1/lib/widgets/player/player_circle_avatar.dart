import 'package:alhambra_calculator/helpers/player_helper.dart';
import 'package:flutter/material.dart';

class PlayerCircleAvatar extends StatelessWidget {
  const PlayerCircleAvatar(this.color);

  final PlayerColor color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: CircleAvatar(
        backgroundColor: PlayerHelper.getPlayerColor(color),
        radius: 15,
      ),
      backgroundColor: PlayerHelper.getPlayerColorDarker(color),
      radius: 20,
    );
  }
}
