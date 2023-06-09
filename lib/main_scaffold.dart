import 'package:flutter/material.dart';
import 'package:dev_shot/services/logo.dart';
import 'package:dev_shot/screens/home.dart';
import 'package:dev_shot/screens/articles.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => MainScaffoldState();
}

class MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  List<Widget> listWidget = const [
    Home(),
    ArticlesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: logo,
      ),
      body: listWidget.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.onPrimaryContainer,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              color: Theme.of(context).colorScheme.outline,
            ),
            label: 'List',
          ),
        ],
      ),
    );
  }
}
