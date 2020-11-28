import 'package:flutter/material.dart';
import '../widgets/drawer_widget.dart';
import 'tab_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text("Alhambra"),
        centerTitle: true,
      ),
      body: TabScreen(),
    );
  }
}
