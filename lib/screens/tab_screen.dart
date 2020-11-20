import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/round_screen.dart';
import '../screens/total_screen.dart';
import '../providers/app_provider.dart';

class TabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppProvider appProvider = Provider.of(context);

    List<Widget> _screens = [
      RoundScreen(1),
      RoundScreen(2),
      RoundScreen(3),
      TotalScreen(),
    ];

    return Scaffold(
      body: _screens[appProvider.getCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) => appProvider.setCurrentIndex = index,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        currentIndex: appProvider.getCurrentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            label: 'Rodada 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two),
            label: 'Rodada 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_3),
            label: 'Final',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: 'Total',
          ),
        ],
      ),
    );
  }
}
