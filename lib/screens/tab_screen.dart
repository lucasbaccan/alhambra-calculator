import 'package:alhambra_calculator/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_provider.dart';
import 'round_screen.dart';

class TabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppProvider appProvider = Provider.of(context);

    List<Widget> _screens = [
      RoundScreen(),
      RoundScreen(),
      RoundScreen(),
      Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          title: Text("4"),
        ),
      ),
      // RoundScreen(1),
      // RoundScreen(2),
      // RoundScreen(3),
      // TotalScreen(),
    ];

    return Scaffold(
      body: _screens[appProvider.getCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: (index) => appProvider.setCurrentIndex = index,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        currentIndex: appProvider.getCurrentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            label: 'Rodada 1',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two),
            label: 'Rodada 2',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_3),
            label: 'Final',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: 'Total',
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
