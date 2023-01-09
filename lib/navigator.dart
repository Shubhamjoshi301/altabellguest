import 'package:altabellguest/Food/food.dart';
import 'package:altabellguest/Utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:altabellguest/Home/home.dart';

class NavigationHandler extends StatefulWidget {
  const NavigationHandler({super.key});

  @override
  State<NavigationHandler> createState() => _NavigationHandlerState();
}

class _NavigationHandlerState extends State<NavigationHandler> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    FoodScreen(),
    const Text(
      'Index 2: Service',
      style: optionStyle,
    ),
    const Text(
      'Index 3: Complaint',
      style: optionStyle,
    ),
    const Text(
      'Index 4: More',
      style: optionStyle,
    ),
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
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(
          color: Color(0xff540375),
        ),
        unselectedItemColor: const Color(0xff8A8A8A),
        showUnselectedLabels: true,
        selectedLabelStyle: Fonts.inter_400
            .copyWith(fontSize: 12, color: const Color(0xff540375)),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room_service),
            label: 'Service',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room_service),
            label: 'Complaint',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
