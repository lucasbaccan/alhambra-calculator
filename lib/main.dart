import 'package:alhambra_calculator/providers/bottom_navigation_bar.dart';
import 'package:alhambra_calculator/providers/game.dart';
import 'package:alhambra_calculator/screens/tab_screen.dart';
import 'package:alhambra_calculator/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Game(),
        ),
        ChangeNotifierProvider(
          create: (_) => BottomNavigationBarProvider(),
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Alhambra"),
            centerTitle: true,
            actions: <Widget>[
              Consumer<Game>(
                builder: (ctx, game, _) => IconButton(
                  icon: game.abrirFechar
                      ? Icon(Icons.keyboard_arrow_down)
                      : Icon(Icons.keyboard_arrow_up),
                  onPressed: () => {
                    game.abrirFechar = !game.abrirFechar,
                    game.abrirFechar ? game.closeAllDetalhe() : game.openAllDetalhe(),
                  },
                ),
              ),
              Consumer2<Game, BottomNavigationBarProvider>(
                builder: (ctx, game, bottomNavigationBar, _) => IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () => {
                    game.reiniciarJogo(),
                    bottomNavigationBar.setCurrentIndex = 0,
                  },
                ),
              ),
            ],
          ),
          drawer: AppDrawer(),
          body: TabScreen(),
        ),
      ),
    );
  }
}
