import 'package:alhambra_calculator/helpers/player_helper.dart';
import 'package:alhambra_calculator/providers/game.dart';
import 'package:alhambra_calculator/widgets/player_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Game game = Provider.of<Game>(context);

    _createPlayerSwitch() {
      List<Widget> widgets = [];

      for (PlayerColor color in PlayerColor.values) {
        Widget jogador = SwitchListTile(
          value: game.playerInList(color),
          onChanged: (value) {
            value ? game.addPlayer(color) : game.removePlayer(color);
          },
          activeColor: PlayerHelper.getPlayerColor(color),
          activeTrackColor: PlayerHelper.getPlayerColorDark(color),
          title: Container(
            child: Row(
              children: [
                PlayerCircleAvatar(color),
                const SizedBox(width: 10),
                Text("Jogador ${color.toString().substring(color.toString().indexOf('.') + 1)}")
              ],
            ),
          ),
        );
        widgets.add(jogador);
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

