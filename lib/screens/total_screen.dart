import 'package:alhambra_calculator/providers/game.dart';
import 'package:alhambra_calculator/providers/player.dart';
import 'package:alhambra_calculator/widgets/player_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TotalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Game game = Provider.of(context);
    int pos = 1;

    Widget _firstCell(List<Player> playerList, Player player) {
      int posicaoJogador = playerList.indexOf(player);
      Player jogadorAnterior;
      if (posicaoJogador != 0) {
        jogadorAnterior = playerList[posicaoJogador - 1];
      }

      if (jogadorAnterior != null && jogadorAnterior.getTotalPontos() > player.getTotalPontos()) {
        pos++;
      }

      if (pos == 1) {
        return SizedBox(
          width: 30,
          child: Image.asset(
            'assets/medal1.png',
            fit: BoxFit.fitHeight,
          ),
        );
      } else if (pos == 2) {
        return SizedBox(
          width: 30,
          child: Image.asset(
            'assets/medal2.png',
            fit: BoxFit.fitHeight,
          ),
        );
      } else if (pos == 3) {
        return SizedBox(
          width: 30,
          child: Image.asset(
            'assets/medal3.png',
            fit: BoxFit.fitHeight,
          ),
        );
      }
      return Text(pos.toString());
    }

    List<DataRow> _dataRowsGenerator() {
      List<DataRow> linhasList = [];
      List<Player> playerList = game.playerList;

      playerList.sort((a, b) => a.getTotalPontos().compareTo(b.getTotalPontos()));
      playerList = playerList.reversed.toList();

      for (Player player in playerList) {
        linhasList.add(
          DataRow(
            cells: [
              DataCell(Center(child: _firstCell(playerList, player))),
              DataCell(Center(child: PlayerCircleAvatar(player.color))),
              DataCell(Center(child: Text('${player.getPontosRodada(0)}'))),
              DataCell(Center(child: Text('${player.getPontosRodada(1)}'))),
              DataCell(Center(child: Text('${player.getPontosRodada(2)}'))),
              DataCell(Center(child: Text('${player.getTotalPontos()}'))),
            ],
          ),
        );
      }

      return linhasList;
    }

    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Column(
        children: [
          DataTable(
            columnSpacing: 0,
            sortColumnIndex: 4,
            sortAscending: true,
            columns: [
              DataColumn(
                label: Center(
                  child: Text(
                    'Pos.',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
                  ),
                ),
                numeric: true,
              ),
              DataColumn(
                label: Expanded(
                  child: Center(
                    child: Text(
                      'Jogador',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: SizedBox(width: 40, child: Icon(Icons.looks_one)),
                numeric: true,
              ),
              DataColumn(
                label: SizedBox(width: 40, child: Icon(Icons.looks_two)),
                numeric: true,
              ),
              DataColumn(
                label: SizedBox(width: 40, child: Icon(Icons.looks_3)),
                numeric: true,
              ),
              DataColumn(
                label: SizedBox(
                  width: 50,
                  child: Center(
                    child: Text(
                      'Total',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
                    ),
                  ),
                ),
                numeric: true,
              ),
            ],
            rows: _dataRowsGenerator(),
          ),
        ],
      ),
    );
    // return Center(
    //   child: Image.network(
    //       'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSDm3LjgygKZyivLJK9yTcme5jtMkesCMYnpio2d6zDTh-kNpt1_bmhnpp1WB5K14K_mkmCVJ3lS-8mai4EZ5zGgQfneT7lweCHwA&usqp=CAU&ec=45690272'),
    // );
  }
}