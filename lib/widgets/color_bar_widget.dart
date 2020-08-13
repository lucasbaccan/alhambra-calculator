import 'package:alhambra_calculator/helpers/tile_helper.dart';
import 'package:alhambra_calculator/providers/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final game = Provider.of<Game>(context);

    _createTilesColors() {
      List<Widget> widgets = [];

      for (TileColor color in TileColor.values) {
        Widget widget = SizedBox(
          height: 50,
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
                : TileHelper.getTileColorDark(color).withOpacity(0.65),
            child: Text(game.tilesLeftByColor(color).toString()),
          ),
        );

        widgets.add(widget);
      }

      return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: widgets);
    }

    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Text(
          "Selecione uma cor de construção",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        _createTilesColors(),
        SizedBox(height: 10),
      ],
    );
  }
}
