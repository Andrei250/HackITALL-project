import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackitallproj/hotel_booking/hotel_home_screen.dart';

import '../icons.dart';


class Home extends StatefulWidget {

  final Map data;
  Home({ this.data });

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Color.fromRGBO(255, 205, 255, 0),
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 25,
        curve: Curves.easeInBack,
        onItemSelected: (index) {
          setState(
                () {
              _currentIndex = index;
              _pageController.jumpToPage(index);
            },
          );
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: SvgPicture.asset(
              home,
              height: 30,
              width: 30,
              color: Color.fromRGBO(155, 255, 255, 1),
            ),
            title: Text('Acasa',),
            activeColor: Color.fromRGBO(155, 255, 255, 1),
            inactiveColor: Color.fromRGBO(155, 255, 255, 1),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: SvgPicture.asset(
              list,
              height: 30,
              width: 30,
              color: Color.fromRGBO(155, 255, 255, 1),
            ),
            title: Text('Produse', ),
            activeColor:Color.fromRGBO(155, 255, 255, 1),
            inactiveColor: Color.fromRGBO(155, 255, 255, 1),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: SvgPicture.asset(
              box,
              height: 30,
              width: 30,
              color: Color.fromRGBO(155, 255, 255, 1),
            ),
            title: Text('Stoc', ),
            activeColor:Color.fromRGBO(255, 255, 255, 1),
            inactiveColor: Color.fromRGBO(255, 255, 255, 1),
            textAlign: TextAlign.center,
          )
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: <Widget>[

          HotelHomeScreen(),
          HotelHomeScreen(),
          HotelHomeScreen(),

          // Container(color: Colors.white,)
        ],
      ),
    );
  }
}