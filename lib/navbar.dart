/*import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kalkylanalys/FrontPage.dart';
import 'homepage.dart';
import 'orderpage.dart';
import 'infopage.dart';
import 'logout.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

class BNavBar extends StatefulWidget {
  const BNavBar({super.key});

  @override
  State<BNavBar> createState() => _BNavBarState();
}

class _BNavBarState extends State<BNavBar> {
     int index = 1;
final screens = [
  InfoPage(),
  FrontPage(),
  OrderPage(),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
         bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            backgroundColor: Color.fromARGB(255, 4, 154, 109), 
            indicatorColor: Color.fromARGB(255, 8, 207, 147),
            labelTextStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 14, fontWeight: FontWeight.w500,
              ),
            ),
            ),
            child: NavigationBar(
              selectedIndex: index,
              onDestinationSelected: (index) =>
              setState (() => this.index = index),
              height: 60,
              destinations: [
                NavigationDestination(icon: Icon(Icons. lock, color: Colors.white), label: 'Logga ut',
                ),
                const NavigationDestination(icon: Icon(Icons. home, color: Colors.white), label: 'Hem',
                ), 
                NavigationDestination(icon: Icon(Icons. shopping_cart_checkout, color: Colors.white), label: 'Beställ',
                ),
              ]
            )
         ),
      );

  
  }
}*/