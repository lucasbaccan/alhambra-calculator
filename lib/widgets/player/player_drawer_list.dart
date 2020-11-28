import 'package:alhambra_calculator/models/player_model.dart';
import 'package:alhambra_calculator/providers/game_provider.dart';
import 'package:alhambra_calculator/providers/player_provider.dart';
import 'package:provider/provider.dart';

import '../../helpers/player_helper.dart';
import 'package:flutter/material.dart';

import 'player_switch_list_tile.dart';

class PlayerDrawerListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider = Provider.of(context);

    List<Widget> _createPlayerSwitch() {
      List<Widget> widgets = [];

      for (PlayerModel player in gameProvider.playerList) {
        Widget playerWidget = PlayerSwitchListTile(player);

        widgets.add(playerWidget);
        widgets.add(const Divider(thickness: 2));
      }
      return widgets;
    }

    return Column(
      children: [
        SizedBox(height: 5),
        Center(
          child: Text(
            "Jogadores",
            textScaleFactor: 1.2,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        ..._createPlayerSwitch(),
      ],
    );
  }
}
