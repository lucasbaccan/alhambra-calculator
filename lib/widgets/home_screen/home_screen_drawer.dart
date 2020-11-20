import 'package:alhambra_calculator/helpers/player_helper.dart';
import 'package:alhambra_calculator/providers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../player/player_circle_avatar.dart';
import '../../providers/app_provider.dart';

class HomeScreenDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppProvider appProvider = Provider.of(context);
    final GameProvider gameProvider = Provider.of(context);

    List<Widget> _createPlayerSwitch() {
      List<Widget> widgets = [];

      for (PlayerColor color in PlayerColor.values) {
        Widget player = SwitchListTile(
          value: gameProvider.playerInList(color),
          onChanged: (value) {
            value ? gameProvider.addPlayer(color) : gameProvider.removePlayer(color);
          },
          activeColor: PlayerHelper.getPlayerColor(color),
          activeTrackColor: PlayerHelper.getPlayerColorDarker(color),
          title: Container(
            child: Row(
              children: [
                PlayerCircleAvatar(color),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    // maxLength: 20,
                    initialValue:
                        gameProvider.getPlayerByColor(color) == null ? "" : gameProvider.getPlayerByColor(color).nome,
                    decoration: InputDecoration(
                      hintText: "Jogador ${PlayerHelper.getPlayerText(color)}",
                    ),
                    onChanged: (text) {
                      if (gameProvider.getPlayerByColor(color) != null) {
                        gameProvider.getPlayerByColor(color).nome = text;
                      }
                      gameProvider.updateNameList(color, text);
                    },
                  ),
                )
              ],
            ),
          ),
        );
        widgets.add(player);
        widgets.add(const Divider(thickness: 2));
      }
      return widgets;
    }

    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Jogadores'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: appProvider.toggleTheme,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ..._createPlayerSwitch(),
            ],
          ),
        ),
      ),
    );
  }
}
