import 'package:alhambra_calculator/providers/game_provider.dart';
import 'package:alhambra_calculator/widgets/player/player_drawer_list.dart';

import '../providers/app_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppProvider appProvider = Provider.of(context);
    final GameProvider gameProvider = Provider.of(context);

    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Configurações"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.brightness_medium),
              onPressed: appProvider.toggleTheme,
              tooltip: "Mudar entre tema claro/escuro",
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PlayerDrawerListWidget(),
                  ],
                ),
              ),
            ),
            // Rodapé
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlineButton(
                  child: Text("Reiniciar"),
                  onPressed: gameProvider.restartGame,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                OutlineButton(
                  child: Text("Sobre"),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
