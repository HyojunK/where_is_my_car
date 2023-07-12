import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_is_my_car/pages/floor_page.dart';
import 'package:where_is_my_car/pages/timer_page.dart';
import 'package:where_is_my_car/providers/bottom_navigation/bottom_navigation_provider.dart';
import 'package:where_is_my_car/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _widgetList = <Widget>[
    const FloorPage(),
    const TimerPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
            _widgetList[context.watch<BottomNavigationProvider>().state.index],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: kBottomNavBackgroundColor,
          selectedItemColor: kBottomNavSelectedItemColor,
          selectedFontSize: 12.0,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/car_icon.png',
                color:
                    context.watch<BottomNavigationProvider>().state.index == 0
                        ? kBottomNavSelectedItemColor
                        : Colors.white,
              ),
              label: '내차위치',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/timer_icon.png',
                color:
                    context.watch<BottomNavigationProvider>().state.index == 1
                        ? kBottomNavSelectedItemColor
                        : Colors.white,
              ),
              label: '타이머',
            ),
          ],
          currentIndex: context.watch<BottomNavigationProvider>().state.index,
          onTap: (selectedIndex) =>
              context.read<BottomNavigationProvider>().update(selectedIndex),
        ),
      ),
    );
  }
}
