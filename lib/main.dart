import 'package:alhambra_calculator/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/app_provider.dart';
import './providers/game_provider.dart';

ThemeData lightThemeData = ThemeData(
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  // primaryColor: Colors.red[600],
  primaryColor: Colors.amber,
  accentColor: Colors.grey,
);

ThemeData darkThemeData = ThemeData(
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: Colors.amber,
  accentColor: Colors.grey,
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
      ],
      child: Consumer<AppProvider>(
        builder: (ctx, appProvider, _) => MaterialApp(
          theme: lightThemeData,
          darkTheme: darkThemeData,
          themeMode: appProvider.lightTheme ? ThemeMode.light : ThemeMode.dark,
          title: "Alhambra",
          home: HomeScreen(),
        ),
      ),
    );
  }
}
