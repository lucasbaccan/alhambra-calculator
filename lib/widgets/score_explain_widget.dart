import 'package:alhambra_calculator/model/score_explain_model.dart';
import 'package:alhambra_calculator/providers/game_provider.dart';
import 'package:alhambra_calculator/widgets/tile_color_score_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'player_color_score_avatar_widget.dart';

class ScoreExplain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameProvider game = Provider.of(context);

    List<DataRow> _dataRowsGenerator(int rodada) {
      List<DataRow> rowsList = [];

      double widthLeft = MediaQuery.of(context).size.width;

      for (ScoreExplainModel score in game.scoreExplain[rodada]) {
        rowsList.add(
          DataRow(
            cells: [
              DataCell(SizedBox(
                width: widthLeft / 4,
                height: 20,
                child: PlayerColorScoreAvatar(score.playerColor),
              )),
              DataCell(Center(
                child: SizedBox(
                  width: widthLeft / 4,
                  height: 20,
                  child: TileColorScoreAvatar(score.tileColor),
                ),
              )),
              DataCell(SizedBox(
                width: widthLeft / 4,
                height: 20,
                child: Center(child: Text(score.score)),
              )),
            ],
          ),
        );
      }
      return rowsList;
    }

    Widget listaPontosRodara(int rodada) {
      return ConstrainedBox(
        constraints: BoxConstraints(minWidth: double.infinity),
        child: DataTable(
          columnSpacing: 1,
          sortColumnIndex: 0,
          sortAscending: true,
          horizontalMargin: 0,
          dataRowHeight: 25,
          headingRowHeight: 30,
          columns: [
            DataColumn(
              label: Expanded(
                child: Center(
                  child: Text(
                    'Jogador',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            ),
            DataColumn(
              label: Center(
                child: Text(
                  'Cor da construção',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Center(
                  child: Text(
                    'Pontos',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
          rows: _dataRowsGenerator(rodada),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("Rodada 1"),
          listaPontosRodara(0),
          Divider(thickness: 1),
          Text("Rodada 2"),
          listaPontosRodara(1),
          Divider(thickness: 1),
          Text("Rodada 3"),
          listaPontosRodara(2),
          Divider(thickness: 1),
        ],
      ),
    );
  }
}
