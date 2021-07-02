import 'package:drinks_wiki/pages/favorites_page.dart';
import 'package:drinks_wiki/pages/home_page.dart';
import 'package:drinks_wiki/pages/search_page.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pagesList = <Widget>[
    HomePage(),
    SearchPage(),
    LikesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _pagesList.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey.shade900,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.local_bar), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorites'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).accentColor,
          onTap: _onItemTapped,
        ));
  }
}
