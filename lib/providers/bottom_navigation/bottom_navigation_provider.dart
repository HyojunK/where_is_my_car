import 'package:flutter/material.dart';
import 'package:where_is_my_car/providers/bottom_navigation/bottom_navigation_state.dart';

class BottomNavigationProvider with ChangeNotifier {
  BottomNavigationState _state = BottomNavigationState.initial();
  BottomNavigationState get state => _state;

  void update(int index) {
    _state = _state.copyWith(index: index);
    notifyListeners();
  }
}
