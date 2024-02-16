import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
      child: CurvedNavigationBar(
        items: [Icon(Icons.home), Icon(Icons.history)],
        backgroundColor: Colors.transparent,
        animationDuration: Duration(milliseconds: 400),
      ),
    ));
  }
}
