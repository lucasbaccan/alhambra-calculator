import 'package:alhambra_calculator/providers/app_provider.dart';
import 'package:alhambra_calculator/widgets/drawer_widget.dart';
import 'package:alhambra_calculator/widgets/player/player_card_list_widget.dart';
import 'package:alhambra_calculator/widgets/tile/tile_color_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppProvider appProvider = Provider.of(context);
    final int rodada = appProvider.getCurrentIndex + 1;

    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: rodada == 3 ? Text("Final") : Text("Rodada ${rodada.toString()}"),
      ),
      body: Column(
        children: [
          SizedBox(height: 5),
          Text(
            "Selecione uma cor de peça",
            textScaleFactor: 1.2,
          ),
          SizedBox(height: 5),
          TileColorBarWidget(),
          SizedBox(height: 5),
          Divider(thickness: 1),
          PlayerCardListWidget(),
        ],
      ),
    );
  }
}
