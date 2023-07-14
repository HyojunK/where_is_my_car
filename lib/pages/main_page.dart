import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_is_my_car/pages/floor_page.dart';
import 'package:where_is_my_car/pages/timer_page.dart';
import 'package:where_is_my_car/providers/bottom_navigation/bottom_navigation_provider.dart';
import 'package:where_is_my_car/constants.dart';
import 'package:where_is_my_car/providers/timer/timer_provider.dart';
import 'package:where_is_my_car/widgets/bottom_navigation_content.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // 타이머 시작
    context.read<TimerProvider>().initTimer();
    super.initState();
  }

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
          items: const [
            BottomNavigationBarItem(
              icon: BottomNavigationIcon(
                index: 0,
                iconImgPath: 'assets/icons/car_icon@2x.png',
              ),
              label: '내차위치',
            ),
            BottomNavigationBarItem(
              icon: BottomNavigationIcon(
                index: 1,
                iconImgPath: 'assets/icons/timer_icon@2x.png',
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
