import 'package:alhambra_calculator/helpers/tile_helper.dart';
import 'package:alhambra_calculator/providers/game.dart';
import 'package:alhambra_calculator/providers/player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorBarPlayer extends StatelessWidget {
  final int rodada;

  // Construtor
  ColorBarPlayer(this.rodada);

  @override
  Widget build(BuildContext context) {
    Player player = Provider.of(context);
    Game game = Provider.of(context);
    _createTilesColors() {
      List<Widget> widgets = [];

      for (TileColor color in TileColor.values) {
        Widget widget = SizedBox(
          height: 25,
          width: 50,
          child: RaisedButton(
            elevation: 8,
            onPressed: () {
              game.changeSelectedColor(color);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(
                width: 4.0,
                color: TileHelper.getTileColorDark(color),
              ),
            ),
            color: game.colorSelected == color
                ? TileHelper.getTileColor(color)
                : TileHelper.getTileColorDark(color).withOpacity(0.80),
            child: Text(player.countTile(rodada, color).toString()),
          ),
        );

        widgets.add(widget);
      }

      return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: widgets);
    }

    return Column(
      children: <Widget>[
        _createTilesColors(),
      ],
    );
  }
}
