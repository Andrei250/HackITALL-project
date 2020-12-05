import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackitallproj/hotel_booking/hotel_home_screen.dart';
import 'package:hackitallproj/app_theme.dart';
import '../icons.dart';
import 'hotel_app_theme.dart';


class Home extends StatefulWidget {

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
        backgroundColor: AppTheme.nearlyWhite,
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
              color: HotelAppTheme.buildLightTheme().primaryColor,
            ),
            title: Text('Acasa',),
            activeColor: AppTheme.lightText,
            inactiveColor: AppTheme.lightText,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: SvgPicture.asset(
              list,
              height: 30,
              width: 30,
              color: HotelAppTheme.buildLightTheme().primaryColor,
            ),
            title: Text('Produse', ),
            activeColor: AppTheme.grey,
            inactiveColor: AppTheme.lightText,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: SvgPicture.asset(
              box,
              height: 30,
              width: 30,
              color: HotelAppTheme.buildLightTheme().primaryColor,
            ),
            title: Text('Stoc', ),
            activeColor:AppTheme.grey,
            inactiveColor: AppTheme.lightText,
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