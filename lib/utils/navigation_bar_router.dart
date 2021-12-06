import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class NavigationBarRouter extends StatefulWidget {
  const NavigationBarRouter({Key? key}) : super(key: key);
  static const routeName = '/navigation_bar_router';

  @override
  State<NavigationBarRouter> createState() => _NavigationBarRouter();
}

class _NavigationBarRouter extends State<NavigationBarRouter> {
  final List<Widget> _pages = [
    FadeInLeft(child: const HomePage()),
    FadeInLeft(child: const BMIPage()),
    FadeInLeft(child: const FavoritePage()),
    FadeInLeft(child: const ProfilePage())
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, //New
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}