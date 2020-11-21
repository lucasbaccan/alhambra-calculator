import 'package:alhambra_calculator/helpers/tile_helper.dart';
import 'package:flutter/material.dart';

class TileColorScoreAvatar extends StatelessWidget {
  const TileColorScoreAvatar(this.color);

  final TileColor color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.black45,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(1.0),
      child: CircleAvatar(
        backgroundColor: TileHelper.getTileColorDarker(color),
        radius: 2,
      ),
    );
  }
}
