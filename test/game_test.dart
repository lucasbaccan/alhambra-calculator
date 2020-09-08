import 'dart:math';

import 'package:alhambra_calculator/helpers/player_helper.dart';
import 'package:alhambra_calculator/helpers/tile_helper.dart';
import 'package:alhambra_calculator/providers/game.dart';
import 'package:alhambra_calculator/providers/player.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Iniciar Jogo', () {
    final Game game = Game();
    test('Verificando jogadores iniciais', () {
      // Tem que ter os jogadores AZUL e VERMELHO de inicio
      expect(game.playerCount, 2);
    });
    test('Jogador AZUL na lista', () {
      expect(game.playerInList(PlayerColor.BLUE), isTrue);
    });
    test('Jogador VERMELHO na lista', () {
      expect(game.playerInList(PlayerColor.RED), isTrue);
    });
  });

  group('Cor Azul', () {
    int rodada;
    final TileColor tileColor = TileColor.BLUE;
    Game game = Game();

    group('Rodada 1', () {
      game.reiniciarJogo();
      rodada = 0;
      Player player1 = game.playerList[0];
      Player player2 = game.playerList[1];

      test('01 - Player1 - Adicionar tile - 1', () {
        player1.addTile(rodada, tileColor);
        expect(player1.countTile(rodada, tileColor), 1);
      });

      test('02 - Player1 - Quantos tiles sobrando tem - 1', () {
        // verificar quantos tiles sobraram
        expect(game.tilesLeftByColor(tileColor),
            TileHelper.getTileMaxPiece(tileColor) - player1.countTile(rodada, tileColor));
        // Mesa validação com valores fixos
        expect(game.tilesLeftByColor(tileColor), 6);
      });

      test('03 - Player1 - Adicionar tile - 2', () {
        // Adiciona mais um tile
        player1.addTile(rodada, tileColor);
        expect(player1.countTile(rodada, tileColor), 2);
      });

      test('04 - Player1 - Quantos tiles sobrando tem - 2', () {
        // verificar quantos tiles sobraram
        expect(game.tilesLeftByColor(tileColor),
            TileHelper.getTileMaxPiece(tileColor) - player1.countTile(rodada, tileColor));
        // Mesa validação com valores fixos
        expect(game.tilesLeftByColor(tileColor), 5);
      });

      test('05 - Player1 - Quantos pontos ele tem', () {
        game.calcularPontosRodada(rodada);
        expect(player1.getPontosRodada(rodada), 1);
        // expect(player.getPontosRodada(rodada), 1);
      });

      test('06 - Player2 - Adicionar tile - 1', () {
        player2.addTile(rodada, tileColor);
        expect(player2.countTile(rodada, tileColor), 1);
      });

      test('07 - Player2 - Quantos tiles sobrando tem - 1', () {
        // verificar quantos tiles sobraram
        expect(
            game.tilesLeftByColor(tileColor),
            TileHelper.getTileMaxPiece(tileColor) -
                player1.countTile(rodada, tileColor) -
                player2.countTile(rodada, tileColor));
        // Mesa validação com valores fixos
        expect(game.tilesLeftByColor(tileColor), 4);
      });

      test('08 - Player2 - Adicionar tile - 2', () {
        // Adiciona mais um tile
        player2.addTile(rodada, tileColor);
        expect(player2.countTile(rodada, tileColor), 2);
      });

      test('09 - Player2 - Quantos tiles sobrando tem - 2', () {
        // verificar quantos tiles sobraram
        expect(
            game.tilesLeftByColor(tileColor),
            TileHelper.getTileMaxPiece(tileColor) -
                player1.countTile(rodada, tileColor) -
                player2.countTile(rodada, tileColor));
        // Mesa validação com valores fixos
        expect(game.tilesLeftByColor(tileColor), 3);
      });

      test('10 - Player2 - Quantos pontos ele tem', () {
        game.calcularPontosRodada(rodada);
        // Ele tem zero, pois empatou, e 1 dividido por 2 vira zero.
        expect(player2.getPontosRodada(rodada), 0);
      });

      // test('', () {});
    });
    group('Rodada 2', () {
     game.reiniciarJogo();
      rodada = 1;
      Player player1 = game.playerList[0];
      Player player2 = game.playerList[1];

      test('01 - Player1 - Adicionar tile - 1', () {
        player1.addTile(rodada, tileColor);
        expect(player1.countTile(rodada, tileColor), 1);
      });

      test('02 - Player1 - Quantos tiles sobrando tem - 1', () {
        // verificar quantos tiles sobraram
        expect(game.tilesLeftByColor(tileColor),
            TileHelper.getTileMaxPiece(tileColor) - player1.countTile(rodada, tileColor));
        // Mesa validação com valores fixos
        expect(game.tilesLeftByColor(tileColor), 6);
      });

      test('03 - Player1 - Adicionar tile - 2', () {
        // Adiciona mais um tile
        player1.addTile(rodada, tileColor);
        expect(player1.countTile(rodada, tileColor), 2);
      });

      test('04 - Player1 - Quantos tiles sobrando tem - 2', () {
        // verificar quantos tiles sobraram
        expect(game.tilesLeftByColor(tileColor),
            TileHelper.getTileMaxPiece(tileColor) - player1.countTile(rodada, tileColor));
        // Mesa validação com valores fixos
        expect(game.tilesLeftByColor(tileColor), 5);
      });

      test('05 - Player1 - Quantos pontos ele tem', () {
        game.calcularPontosRodada(rodada);
        expect(player1.getPontosRodada(rodada), 8);
      });

      test('06 - Player2 - Adicionar tile - 1', () {
        player2.addTile(rodada, tileColor);
        expect(player2.countTile(rodada, tileColor), 1);
      });

      test('07 - Player2 - Quantos tiles sobrando tem - 1', () {
        // verificar quantos tiles sobraram
        expect(
            game.tilesLeftByColor(tileColor),
            TileHelper.getTileMaxPiece(tileColor) -
                player1.countTile(rodada, tileColor) -
                player2.countTile(rodada, tileColor));
        // Mesa validação com valores fixos
        expect(game.tilesLeftByColor(tileColor), 4);
      });

      test('08 - Player2 - Adicionar tile - 2', () {
        // Adiciona mais um tile
        player2.addTile(rodada, tileColor);
        expect(player2.countTile(rodada, tileColor), 2);
      });

      test('09 - Player2 - Quantos tiles sobrando tem - 2', () {
        // verificar quantos tiles sobraram
        expect(
            game.tilesLeftByColor(tileColor),
            TileHelper.getTileMaxPiece(tileColor) -
                player1.countTile(rodada, tileColor) -
                player2.countTile(rodada, tileColor));
        // Mesa validação com valores fixos
        expect(game.tilesLeftByColor(tileColor), 3);
      });

      test('10 - Player2 - Quantos pontos ele tem', () {
        game.calcularPontosRodada(rodada);
        // Ele tem zero, pois empatou, e 9 dividido por 2 vira 4.
        expect(player2.getPontosRodada(rodada), 4);
      });
    });
    group('Rodada 3', () {
      test('', () {
        expect(1, 1);
      });
    });
  });

  group('Cor Vermelho', () {
    test('', () {});
  });

  group('Cor Marrom', () {
    test('', () {});
  });

  group('Cor Branco', () {
    test('', () {});
  });

  group('Cor Verde', () {
    test('', () {});
  });
  group('Cor Lilas', () {
    test('', () {});
  });

  group('Reiniciar partida', () {
    test('', () {});
  });
}
