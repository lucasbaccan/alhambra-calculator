import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:alhambra_calculator/widgets/player/player_name_total.dart';
import 'package:alhambra_calculator/widgets/score_explain_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:widget_to_image/widget_to_image.dart';

import '../providers/game_provider.dart';
import '../providers/player_provider.dart';

class TotalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameProvider game = Provider.of(context);
    GlobalKey _globalKey = new GlobalKey();
    int pos = 1;

    Widget _placarColuna(List<PlayerProvider> playerList, PlayerProvider player) {
      final int _posPlayer = playerList.indexOf(player);
      PlayerProvider _playerAnterior;
      if (_posPlayer != 0) {
        _playerAnterior = playerList[_posPlayer - 1];
      }

      if (_playerAnterior != null && _playerAnterior.getTotalPontos() > player.getTotalPontos()) {
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
      List<DataRow> rowsList = [];
      List<PlayerProvider> playerList = game.playerList;

      playerList.sort((a, b) => a.getTotalPontos().compareTo(b.getTotalPontos()));
      playerList = playerList.reversed.toList();

      double widthLeft = MediaQuery.of(context).size.width;
      widthLeft = widthLeft - 50; //Campos pos
      widthLeft = widthLeft - (3 * 38); //Campos de pontos
      widthLeft = widthLeft - 55; //Campos total

      for (PlayerProvider player in playerList) {
        rowsList.add(
          DataRow(
            cells: [
              DataCell(Center(child: _placarColuna(playerList, player))),
              DataCell(Center(child: SizedBox(width: widthLeft, child: PlayerNameTotal(player)))),
              DataCell(Center(child: Text('${player.getPontosRodada(0)}'))),
              DataCell(Center(child: Text('${player.getPontosRodada(1)}'))),
              DataCell(Center(child: Text('${player.getPontosRodada(2)}'))),
              DataCell(Center(child: Text('${player.getTotalPontos()}'))),
            ],
          ),
        );
      }
      return rowsList;
    }

    Widget buildDataTable() {
      return RepaintBoundary(
        child: Container(
          color: Colors.white,
          child: DataTable(
            // key: _globalKey,
            columnSpacing: 0,
            sortColumnIndex: 4,
            sortAscending: true,
            horizontalMargin: 0,
            columns: [
              DataColumn(
                label: SizedBox(
                  width: 50,
                  child: Center(
                    child: Text(
                      'Pos.',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
                    ),
                  ),
                ),
                numeric: true,
              ),
              DataColumn(
                label: Expanded(
                  child: Center(
                    child: Text(
                      'Jogador',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: SizedBox(width: 38, child: Icon(Icons.looks_one)),
                numeric: true,
              ),
              DataColumn(
                label: SizedBox(width: 38, child: Icon(Icons.looks_two)),
                numeric: true,
              ),
              DataColumn(
                label: SizedBox(width: 38, child: Icon(Icons.looks_3)),
                numeric: true,
              ),
              DataColumn(
                label: SizedBox(
                  width: 55,
                  child: Center(
                    child: Text(
                      'Total',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
                    ),
                  ),
                ),
                numeric: true,
              ),
            ],
            rows: _dataRowsGenerator(),
          ),
        ),
      );
    }

    _gerarImagem() async {
      // Widget test = RepaintBoundary(
      //   child: Container(
      //     width: 100,
      //     height: 100,
      //     color: Colors.red,
      //   ),
      // );

      // game.updateImage(await WidgetToImage.repaintBoundaryToImage(test.key));
      game.updateImage(await WidgetToImage.repaintBoundaryToImage(_globalKey));

      RenderRepaintBoundary repaintBoundary = _globalKey.currentContext.findRenderObject();

      ui.Image image = await repaintBoundary.toImage(pixelRatio: 5.0);
      ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path + "/score.png";

      final buffer = byteData.buffer;
      new File(tempPath).writeAsBytes(buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

      print(tempPath);
      Share.shareFiles([tempPath], text: 'Pontuação Alhambra');
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RepaintBoundary(
            key: _globalKey,
            child: buildDataTable(),
          ),
          Divider(thickness: 3, color: Colors.black),
          ScoreExplain(),
          Divider(thickness: 3, color: Colors.black),
          RaisedButton(
            onPressed: _gerarImagem,
            child: Text('Gerar imagem'),
          ),
          game.image != null
              ? Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    child: game.image,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}

// class TotalScreen extends StatelessWidget {
//   GlobalKey _globalKey = new GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     final GameProvider game = Provider.of(context);
//     int pos = 1;

//     Widget _placarColuna(List<PlayerProvider> playerList, PlayerProvider player) {
//       final int _posPlayer = playerList.indexOf(player);
//       PlayerProvider _playerAnterior;
//       if (_posPlayer != 0) {
//         _playerAnterior = playerList[_posPlayer - 1];
//       }

//       if (_playerAnterior != null && _playerAnterior.getTotalPontos() > player.getTotalPontos()) {
//         pos++;
//       }

//       if (pos == 1) {
//         return SizedBox(
//           width: 30,
//           child: Image.asset(
//             'assets/medal1.png',
//             fit: BoxFit.fitHeight,
//           ),
//         );
//       } else if (pos == 2) {
//         return SizedBox(
//           width: 30,
//           child: Image.asset(
//             'assets/medal2.png',
//             fit: BoxFit.fitHeight,
//           ),
//         );
//       } else if (pos == 3) {
//         return SizedBox(
//           width: 30,
//           child: Image.asset(
//             'assets/medal3.png',
//             fit: BoxFit.fitHeight,
//           ),
//         );
//       }
//       return Text(pos.toString());
//     }

//     List<DataRow> _dataRowsGenerator() {
//       List<DataRow> rowsList = [];
//       List<PlayerProvider> playerList = game.playerList;

//       playerList.sort((a, b) => a.getTotalPontos().compareTo(b.getTotalPontos()));
//       playerList = playerList.reversed.toList();

//       double widthLeft = MediaQuery.of(context).size.width;
//       widthLeft = widthLeft - 50; //Campos pos
//       widthLeft = widthLeft - (3 * 40); //Campos de pontos
//       widthLeft = widthLeft - 55; //Campos total

//       for (PlayerProvider player in playerList) {
//         rowsList.add(
//           DataRow(
//             cells: [
//               DataCell(Center(child: _placarColuna(playerList, player))),
//               DataCell(Center(child: SizedBox(width: widthLeft, child: PlayerNameTotal(player)))),
//               DataCell(Center(child: Text('${player.getPontosRodada(0)}'))),
//               DataCell(Center(child: Text('${player.getPontosRodada(1)}'))),
//               DataCell(Center(child: Text('${player.getPontosRodada(2)}'))),
//               DataCell(Center(child: Text('${player.getTotalPontos()}'))),
//             ],
//           ),
//         );
//       }
//       return rowsList;
//     }

//     Widget buildDataTable() {
//       return RepaintBoundary(
//         child: DataTable(
//           key: _globalKey,
//           columnSpacing: 0,
//           sortColumnIndex: 4,
//           sortAscending: true,
//           horizontalMargin: 0,
//           columns: [
//             DataColumn(
//               label: SizedBox(
//                 width: 50,
//                 child: Center(
//                   child: Text(
//                     'Pos.',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
//                   ),
//                 ),
//               ),
//               numeric: true,
//             ),
//             DataColumn(
//               label: Expanded(
//                 child: Center(
//                   child: Text(
//                     'Jogador',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
//                   ),
//                 ),
//               ),
//             ),
//             DataColumn(
//               label: SizedBox(width: 40, child: Icon(Icons.looks_one)),
//               numeric: true,
//             ),
//             DataColumn(
//               label: SizedBox(width: 40, child: Icon(Icons.looks_two)),
//               numeric: true,
//             ),
//             DataColumn(
//               label: SizedBox(width: 40, child: Icon(Icons.looks_3)),
//               numeric: true,
//             ),
//             DataColumn(
//               label: SizedBox(
//                 width: 55,
//                 child: Center(
//                   child: Text(
//                     'Total',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
//                   ),
//                 ),
//               ),
//               numeric: true,
//             ),
//           ],
//           rows: _dataRowsGenerator(),
//         ),
//       );
//     }

//     _callRepaintBoundaryToImage() async {
//       game.image = await WidgetToImage.repaintBoundaryToImage(_globalKey);
//       // setState(() {
//       //   _image = byteData;
//       // });
//     }

//     return Column(
//       children: [
//         buildDataTable(),
//         Divider(thickness: 5),
//         RaisedButton(
//           onPressed: _callRepaintBoundaryToImage,
//           child: Text('Gerar imagem'),
//         ),
//         game.image != null
//             ? Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(25.0),
//                   child: Container(
//                     decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//                     child: game.image,
//                   ),
//                 ),
//               )
//             : Container()
//       ],
//     );

//     // return Center(
//     //   child: Image.network(
//     //       'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSDm3LjgygKZyivLJK9yTcme5jtMkesCMYnpio2d6zDTh-kNpt1_bmhnpp1WB5K14K_mkmCVJ3lS-8mai4EZ5zGgQfneT7lweCHwA&usqp=CAU&ec=45690272'),
//     // );
//   }
// }
