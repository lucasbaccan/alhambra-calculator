import 'package:flutter/material.dart';

enum PlayerColor {
  BLUE,
  RED,
  ORANGE,
  WHITE,
  GREEN,
  YELLOW,
}

class PlayerHelper {
  static String getPlayerText(PlayerColor playerColor) {
    switch (playerColor) {
      case PlayerColor.BLUE:
        return "Azul";
      case PlayerColor.WHITE:
        return "Branco";
      case PlayerColor.RED:
        return "Vermelho";
      case PlayerColor.GREEN:
        return "Verde";
      case PlayerColor.ORANGE:
        return "Laranja";
      case PlayerColor.YELLOW:
        return "Amarelo";
      default:
        return "Preto";
    }
  }

  static Color getPlayerColor(PlayerColor playerColor) {
    switch (playerColor) {
      case PlayerColor.BLUE:
        return Colors.blue[700];
      case PlayerColor.WHITE:
        return Colors.white;
      case PlayerColor.RED:
        return Colors.red[600];
      case PlayerColor.GREEN:
        return Colors.green[700];
      case PlayerColor.ORANGE:
        return Colors.orange[600];
      case PlayerColor.YELLOW:
        return Colors.yellow;
      default:
        return Colors.black;
    }
  }

  static Color getPlayerColorDarker(PlayerColor playerColor) {
    switch (playerColor) {
      case PlayerColor.BLUE:
        return Colors.blue[900];
      case PlayerColor.WHITE:
        return Colors.grey[300];
      case PlayerColor.RED:
        return Colors.red[800];
      case PlayerColor.GREEN:
        return Colors.green[900];
      case PlayerColor.ORANGE:
        return Colors.orange[700];
      case PlayerColor.YELLOW:
        return Colors.yellow[700];
      default:
        return Colors.black;
    }
  }
}
