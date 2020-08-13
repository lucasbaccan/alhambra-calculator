import 'package:alhambra_calculator/providers/bottom_navigation_bar.dart';
import 'package:alhambra_calculator/screens/round_screen.dart';
import 'package:alhambra_calculator/screens/total_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarProvider bottomNavigationBarProvider = Provider.of(context);

    List<Widget> _screens = [
      RoundScreen(1),
      RoundScreen(2),
      RoundScreen(3),
      TotalScreen(),
    ];

    return Scaffold(
      body: _screens[bottomNavigationBarProvider.getCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) => bottomNavigationBarProvider.setCurrentIndex = index,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        currentIndex: bottomNavigationBarProvider.getCurrentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            title: Text('Rodada 1'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two),
            title: Text('Rodada 2'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_3),
            title: Text('Final'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            title: Text('Total'),
          ),
        ],
      ),
    );
  }
}

// import 'package:alhambra_calculator/screens/round_screen.dart';
// import 'package:alhambra_calculator/screens/total_screen.dart';
// import 'package:flutter/material.dart';

// class TabScreen extends StatefulWidget {
//   @override
//   _TabScreenState createState() => _TabScreenState();
// }

// class _TabScreenState extends State<TabScreen> {
//   int _selectedScreenIndex = 0;
//   List<Widget> _screens;

//   void _selectScreen(int index) {
//     setState(() {
//       _selectedScreenIndex = index;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _screens = [
//       RoundScreen(1),
//       RoundScreen(2),
//       RoundScreen(3),
//       TotalScreen(),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_selectedScreenIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         onTap: _selectScreen,
//         backgroundColor: Theme.of(context).primaryColor,
//         unselectedItemColor: Colors.black,
//         selectedItemColor: Colors.white,
//         currentIndex: _selectedScreenIndex,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.looks_one),
//             title: Text('Rodada 1'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.looks_two),
//             title: Text('Rodada 2'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.looks_3),
//             title: Text('Rodada 3'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.check_circle_outline),
//             title: Text('Total'),
//           ),
//         ],
//       ),
//     );
//   }
// }
