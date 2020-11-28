import 'package:alhambra_calculator/helpers/player_helper.dart';
import 'package:alhambra_calculator/helpers/tile_helper.dart';

class ScoreExplainModel {
  final PlayerColor playerColor;
  final TileColor tileColor;
  final String score;

  ScoreExplainModel(
    this.playerColor,
    this.tileColor,
    this.score,
  );
}
