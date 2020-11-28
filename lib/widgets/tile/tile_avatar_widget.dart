import 'package:alhambra_calculator/helpers/tile_helper.dart';
import 'package:alhambra_calculator/providers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TileAvatarWidget extends StatelessWidget {
  final double tamanho;
  final double borda;
  final TileColor tileColor;

  const TileAvatarWidget(this.tamanho, this.borda, this.tileColor);

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider = Provider.of(context);

    // Tamanho máximo de largura que pode ter os círculos antes de sair da tela
    double larguraMaxima = (MediaQuery.of(context).size.width / (TileColor.values.length)) - 5;

    return SizedBox(
      width: larguraMaxima,
      height: tamanho != null && larguraMaxima > tamanho ? tamanho : larguraMaxima * 0.7,
      child: RaisedButton(
        elevation: 5,
        color: gameProvider.colorSelected == tileColor
            ? TileHelper.getTileColorDarker(tileColor)
            : TileHelper.getTileColor(tileColor),
        shape: CircleBorder(
          side: BorderSide(
            width: borda != null ? borda : 5,
            color: TileHelper.getTileColorDarker(tileColor),
          ),
        ),
        onPressed: () => gameProvider.changeSelectedColor(tileColor),
        child: FittedBox(child: Text("${TileHelper.getTileMaxPiece(tileColor)}")),
      ),
    );
  }
}
