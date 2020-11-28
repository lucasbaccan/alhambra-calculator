import 'package:alhambra_calculator/providers/player_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/app_provider.dart';
import 'providers/game_provider.dart';
import 'screens/home_screen.dart';
import 'screens/tab_screen.dart';

ThemeData lightThemeData = ThemeData(
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  // primaryColor: Colors.amber,
  primaryColor: const Color(0xffF2C641),
  // accentColor: Colors.grey,
  accentColor: const Color(0xff8C4A3B),
);

ThemeData darkThemeData = ThemeData(
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: Colors.amber,
  // accentColor: Colors.grey,
  accentColor: const Color(0xff8C4A3B),
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GameProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PlayerProvider(),
        ),
      ],
      child: Consumer<AppProvider>(
        builder: (ctx, appProvider, _) => MaterialApp(
          theme: lightThemeData,
          darkTheme: darkThemeData,
          themeMode: appProvider.lightTheme ? ThemeMode.light : ThemeMode.dark,
          title: "Alhambra",
          home: TabScreen(),
        ),
      ),
    );
  }
}
