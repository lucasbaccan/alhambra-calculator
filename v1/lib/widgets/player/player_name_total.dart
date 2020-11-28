import 'package:alhambra_calculator/helpers/player_helper.dart';
import 'package:alhambra_calculator/providers/player_provider.dart';
import 'package:alhambra_calculator/widgets/player/player_circle_avatar.dart';
import 'package:flutter/material.dart';

class PlayerNameTotal extends StatelessWidget {
  const PlayerNameTotal(this.player);

  final PlayerProvider player;

  @override
  Widget build(BuildContext context) {
    Widget _campoSemNome() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(child: PlayerCircleAvatar(player.color)),
          SizedBox(width: 8),
          Flexible(
            child: Text(
              "Jogador ${PlayerHelper.getPlayerText(player.color)}",
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    }

    Widget _campoComNome() {
      return Row(
        children: [
          PlayerCircleAvatar(player.color),
          SizedBox(width: 8),
          Flexible(
            child: Text(
              player.nome,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    }

    return player.nome.isEmpty ? _campoSemNome() : _campoComNome();
  }
}
