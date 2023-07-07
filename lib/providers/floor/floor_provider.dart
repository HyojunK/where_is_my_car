import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:where_is_my_car/constants.dart';
import 'package:where_is_my_car/providers/floor/floor_state.dart';

class FloorProvider with ChangeNotifier {
  SharedPreferences? prefs;
  FloorState _state = FloorState.initial();
  FloorState get state => _state;

  void initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    getFloorData();
    notifyListeners();
  }

  void changeFloorType(FloorType newFloorType) {
    _state = _state.copyWith(floorType: newFloorType);
    notifyListeners();
  }

  void changeFloor(int newFloor) {
    _state = _state.copyWith(floor: newFloor);
    notifyListeners();
  }

  void getFloorData() {
    final int floorTypeIndex = prefs!.getInt('floorTypeIndex') ?? 0;
    final int floor = prefs!.getInt('floor') ?? 1;
    _state = _state.copyWith(
        floorType: FloorType.values[floorTypeIndex], floor: floor);
  }

  void setFloorData() {
    String toastMessage = kSaveSuccessMessage;

    try {
      prefs!.setInt('floorTypeIndex', state.floorType.index);
      prefs!.setInt('floor', state.floor);
    } catch (e) {
      toastMessage = kSaveFailMessage;
    }

    Fluttertoast.showToast(
      msg: toastMessage,
    );
  }
}
