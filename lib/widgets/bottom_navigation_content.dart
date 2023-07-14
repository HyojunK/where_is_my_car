import 'package:flutter/material.dart';
import 'package:where_is_my_car/constants.dart';
import 'package:provider/provider.dart';
import 'package:where_is_my_car/providers/bottom_navigation/bottom_navigation_provider.dart';

class BottomNavigationIcon extends StatelessWidget {
  final int index;
  final String iconImgPath;
  const BottomNavigationIcon({
    super.key,
    required this.index,
    required this.iconImgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      iconImgPath,
      width: 24.0,
      height: 24.0,
      color: context.watch<BottomNavigationProvider>().state.index == index
          ? kBottomNavSelectedItemColor
          : Colors.white,
    );
  }
}
