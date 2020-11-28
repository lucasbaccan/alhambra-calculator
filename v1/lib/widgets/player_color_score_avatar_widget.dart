import 'package:alhambra_calculator/helpers/player_helper.dart';
import 'package:flutter/material.dart';

class PlayerColorScoreAvatar extends StatelessWidget {
  const PlayerColorScoreAvatar(this.color);

  final PlayerColor color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.black45,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(1.0),
      child: CircleAvatar(
        backgroundColor: PlayerHelper.getPlayerColor(color),
        radius: 2,
      ),
    );
  }
}
