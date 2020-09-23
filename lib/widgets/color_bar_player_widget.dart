import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/tile_helper.dart';
import '../providers/game_provider.dart';
import '../providers/player_provider.dart';

class ColorBarPlayer extends StatelessWidget {
  final int round;

  // Construtor
  ColorBarPlayer(this.round);

  @override
  Widget build(BuildContext context) {
    final PlayerProvider playerProvider = Provider.of(context);
    final GameProvider gameProvider = Provider.of(context);

    Widget _createTilesColors() {
      List<Widget> widgets = [];

      for (TileColor color in TileColor.values) {
        Widget widget = SizedBox(
          height: 25,
          width: 50,
          child: RaisedButton(
            elevation: 8,
            onPressed: () {
              gameProvider.changeSelectedColor(color);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                width: 4.0,
                color: TileHelper.getTileColorDarker(color),
              ),
            ),
            color: gameProvider.colorSelected == color
                ? TileHelper.getTileColor(color)
                : TileHelper.getTileColorDarker(color).withOpacity(0.80),
            child: Text(playerProvider.countTile(round, color).toString()),
          ),
        );

        widgets.add(widget);
      }

      return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: widgets);
    }

    return _createTilesColors();
  }
}
