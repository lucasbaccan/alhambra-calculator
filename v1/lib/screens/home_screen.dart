import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_provider.dart';
import '../providers/game_provider.dart';
import '../screens/tab_screen.dart';
import '../widgets/home_screen/home_screen_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppProvider appProvider = Provider.of(context);
    final GameProvider gameProvider = Provider.of(context);

    return Scaffold(
      drawer: HomeScreenDrawer(),
      appBar: AppBar(
        title: Text("Alhambra"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            color: Theme.of(context).accentColor.computeLuminance() > 0.5 ? Colors.white : Colors.black,
            onPressed: () => {
              gameProvider.restartGame(),
              appProvider.setCurrentIndex = 0,
            },
          ),
          Visibility(
            visible: appProvider.getCurrentIndex != 3,
            child: IconButton(
              icon: gameProvider.openClose ? Icon(Icons.keyboard_arrow_down) : Icon(Icons.keyboard_arrow_up),
              color: Theme.of(context).accentColor.computeLuminance() > 0.5 ? Colors.white : Colors.black,
              onPressed: () => {
                gameProvider.openClose = !gameProvider.openClose,
                gameProvider.openClose ? gameProvider.closeAllDetails() : gameProvider.openAllDetails(),
              },
            ),
          ),
        ],
      ),
      body: TabScreen(),
    );
  }
}
