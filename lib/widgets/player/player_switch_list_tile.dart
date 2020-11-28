import 'package:alhambra_calculator/models/player_model.dart';
import 'package:alhambra_calculator/providers/game_provider.dart';
import 'package:alhambra_calculator/widgets/player/player_avatar_widget.dart';
import 'package:provider/provider.dart';

import '../../helpers/player_helper.dart';
import '../../providers/player_provider.dart';
import 'package:flutter/material.dart';

class PlayerSwitchListTile extends StatelessWidget {
  final PlayerModel player;
  const PlayerSwitchListTile(this.player);

  @override
  Widget build(BuildContext context) {
    final PlayerProvider playerProvider = Provider.of(context);
    final GameProvider gameProvider = Provider.of(context);

    return SwitchListTile(
      dense: true,
      value: player.ativo,
      onChanged: (_) {
        playerProvider.toggleAtivo(player);
        if (player.ativo) {
          gameProvider.addPlayer(player);
        } else {
          gameProvider.removePlayer(player);
        }
      },
      activeColor: PlayerHelper.getPlayerColor(player.color),
      activeTrackColor: PlayerHelper.getPlayerColorDarker(player.color),
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      title: SizedBox(
        height: 20,
        child: TextFormField(
          maxLines: 1,
          textCapitalization: TextCapitalization.words,
          initialValue: player.nome,
          decoration: InputDecoration(
            hintText: "Jogador ${PlayerHelper.getPlayerText(player.color)}",
            isDense: true,
            contentPadding: EdgeInsets.only(
              bottom: 5,
            ),
          ),
          onChanged: (nome) {
            playerProvider.updateNome(player, nome);
          },
        ),
      ),
      secondary: PlayerAvatarWidget(14, 5, player),
    );
  }
}
