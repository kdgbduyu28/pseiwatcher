import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'mainpage.dart';
import 'stockspage.dart';
import 'userDrawer.dart';

class Navigate extends StatefulWidget {
  @override
  _NavigateState createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> {
  int _selectedIndex = 1;

  final _navPages = [
    MainPage(),
    Stocks(),
  ];
  void onBottomNavbarTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: UserDrawer(),
        backgroundColor: Color(0xff152D35),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff345B63),
          title: Text(
            "PSEI Watcher",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30,
              color: Color(0xffD4ECDD)
            ),
          ),
        ),
        body: _navPages[_selectedIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.red,
          ),
          child: BottomNavigationBar(
            backgroundColor: Color(0xff112031),
            currentIndex: _selectedIndex,
            unselectedItemColor: Color(0xff152D35),
            selectedItemColor: Color(0xff345B63),
            onTap: onBottomNavbarTap,
            items: [
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.poll),
                label: "Stocks",
              ),
            ],
          ),
        ),
      ),
    );
  }
}





