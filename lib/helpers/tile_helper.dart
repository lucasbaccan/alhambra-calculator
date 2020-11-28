import 'package:flutter/material.dart';

enum TileColor {
  BLUE,
  RED,
  BROWN,
  WHITE,
  GREEN,
  PURPLE,
}

class TileHelper {
  static Color getTileColor(TileColor tileColor) {
    switch (tileColor) {
      case TileColor.BLUE:
        return Colors.blue[400];
      case TileColor.RED:
        return Colors.red[400];
      case TileColor.BROWN:
        return Colors.brown[700];
      case TileColor.WHITE:
        return Colors.white;
      case TileColor.GREEN:
        return Colors.green[700];
      case TileColor.PURPLE:
        return Colors.purple[400];
      default:
        return Colors.black;
    }
  }

  static Color getTileColorDarker(TileColor tileColor) {
    switch (tileColor) {
      case TileColor.BLUE:
        return Colors.blue[600];
      case TileColor.RED:
        return Colors.red[600];
      case TileColor.BROWN:
        return Colors.brown[800];
      case TileColor.WHITE:
        return Colors.grey[300];
      case TileColor.GREEN:
        return Colors.green[900];
      case TileColor.PURPLE:
        return Colors.purple[600];
      default:
        return Colors.black;
    }
  }

  static int getTileMaxPiece(TileColor tileColor) {
    switch (tileColor) {
      case TileColor.BLUE:
        return 7;
      case TileColor.RED:
        return 7;
      case TileColor.BROWN:
        return 9;
      case TileColor.WHITE:
        return 9;
      case TileColor.GREEN:
        return 11;
      case TileColor.PURPLE:
        return 11;
      default:
        return 0;
    }
  }

  static int getTileScore(int rodada, TileColor tileColor) {
    if (rodada < 1 || rodada > 3) return 0;

    int score = 0;
    // Se for segunda rodada, soma 7 pontos + valor da cor
    if (rodada == 2) score = 7;
    // Se for segunda rodada, soma 15 pontos + valor da cor
    if (rodada == 3) score = 15;

    switch (tileColor) {
      case TileColor.BLUE:
        return score + 1;
      case TileColor.RED:
        return score + 2;
      case TileColor.BROWN:
        return score + 3;
      case TileColor.WHITE:
        return score + 4;
      case TileColor.GREEN:
        return score + 5;
      case TileColor.PURPLE:
        return score + 6;
      default:
        return 0;
    }
  }
}
