import 'package:dhmsmobileapp/features/graphs/linechart.dart';
import 'package:dhmsmobileapp/features/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class NavSection extends StatefulWidget {
  const NavSection({super.key});

  @override
  State<NavSection> createState() => _NavSectionState();
}

class _NavSectionState extends State<NavSection> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 50,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    Dashbaord(),
    LineGraph(),
    Text(
      'Maintenance',
      style: optionStyle,
    ),
    Text(
      'Support',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          // decoration: const BoxDecoration(
          //   border: Border(bottom: ),
          // ),
          padding: const EdgeInsets.all(0),
          child: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image(
                        image: AssetImage(
                          'assets/images/itsalogo.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.notifications,
                          size: 30,
                          color: Color.fromRGBO(52, 64, 84, 1),
                        ),
                      ),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.menu,
                          size: 30,
                          color: Color.fromRGBO(52, 64, 84, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                color: Colors.grey,
                height: 5,
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: const Color.fromRGBO(52, 64, 84, 1),
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.grey,
              textStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
              ),
              tabs: const [
                GButton(
                  icon: Icons.dashboard,
                  text: 'Dashbaord',
                ),
                GButton(
                  icon: Icons.inventory,
                  text: 'Inventory',
                ),
                GButton(
                  icon: Icons.laptop,
                  text: 'Maintenance',
                ),
                GButton(
                  icon: Icons.support_agent,
                  text: 'Support',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(
                  () {
                    _selectedIndex = index;
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
