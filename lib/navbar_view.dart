import 'package:flutter/material.dart';
import 'package:fourth_app/carhome.dart';
import 'package:fourth_app/notification.dart';
import 'package:fourth_app/profile.dart';
import 'package:fourth_app/search.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {

  static const List<Widget> _widgetOptions = <Widget>[
    Carhome(),
    Search(),
    Bell(),
    Profile(),

  ];

  int _selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal:15,vertical:8),
        child: GNav(
          backgroundColor: Colors.white,
          gap:10,
          iconSize: 24,
          padding: const EdgeInsets.symmetric(horizontal:20,vertical:12),
          activeColor:Colors.blue[500],
          tabBackgroundColor:Colors.lightBlue.shade50,
          tabs:const[
            GButton(
              icon: Icons.home,
              text:'Home',
            ),
            GButton(
              icon: Icons.search,
              text:'Search',
            ),
            GButton(
              icon: Icons.notifications_none_outlined,
              text:'Bell',),
            GButton(
              icon: Icons.person_2_outlined,
              text:'Profile',),
          ],
          selectedIndex:_selectedIndex,
          onTabChange:(index){
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
