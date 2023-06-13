import 'package:dev_shot/screens/favorites.dart';
import 'package:dev_shot/screens/profil.dart';
import 'package:flutter/material.dart';
import 'package:dev_shot/services/logo.dart';
import 'package:dev_shot/screens/home.dart';
import 'package:dev_shot/screens/search.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => MainScaffoldState();
}

class MainScaffoldState extends State<MainScaffold> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final PageController _pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;

  List<Widget> listWidget = const [
    Home(),
    SearchScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  Color updatePageIndex(index) {
    if (_selectedIndex == index) {
      return Theme.of(context).colorScheme.onPrimaryContainer;
    }
    return Theme.of(context).colorScheme.outline;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: logo,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _selectedIndex = newIndex;
          });
        },
        children: const [
          Home(),
          SearchScreen(),
          Favorites(),
          Profil(),
          // listWidget.elementAt(_selectedIndex),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 100,
        color: Theme.of(context).colorScheme.primary,
        child: CurvedNavigationBar(
          index: _selectedIndex,
          key: _bottomNavigationKey,
          backgroundColor: Theme.of(context).colorScheme.primary,
          animationDuration: const Duration(milliseconds: 300),
          buttonBackgroundColor: Theme.of(context).colorScheme.primaryContainer,
          items: <Widget>[
            Icon(
              Icons.home,
              color: updatePageIndex(0),
            ),
            Icon(
              Icons.search,
              color: updatePageIndex(1),
            ),
            Icon(
              Icons.bookmark_add,
              color: updatePageIndex(2),
            ),
            Icon(
              Icons.person,
              color: updatePageIndex(3),
            ),
          ],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}


// BottomNavigationBar(
//         onTap: _onItemTapped,
//         currentIndex: _selectedIndex,
//         selectedItemColor: Theme.of(context).colorScheme.onPrimaryContainer,
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         unselectedItemColor: Theme.of(context).colorScheme.onPrimaryContainer,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//               color: updateColor(0),
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.search,
//               color: updateColor(1),
//             ),
//             label: 'List',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.bookmark_add,
//               color: updateColor(1),
//             ),
//             label: 'Favoris',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.person,
//               color: updateColor(1),
//             ),
//             label: 'Profil',
//           ),
//         ],
//       ),