import 'package:flutter/material.dart';
import 'package:where_is_my_car/constants.dart';
import 'package:where_is_my_car/widgets/button_card.dart';
import 'package:where_is_my_car/widgets/save_button.dart';
import 'package:where_is_my_car/widgets/icon_button_content.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum FloorType {
  ground,
  underground;
}

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  FloorType _selectedFloorType = FloorType.ground;
  int _selectedFloor = 1;

  void setFloorData() async {
    String toastMessage = kSaveSuccessMessage;
    try {
      final SharedPreferences prefs = await _prefs;
      prefs.setInt('selectedFloorType', _selectedFloorType.index);
      prefs.setInt('selectedFloor', _selectedFloor);
    } catch (e) {
      toastMessage = kSaveFailMessage;
      print(e);
    }

    Fluttertoast.showToast(
      msg: toastMessage,
    );
  }

  void getFloorData() async {
    try {
      final SharedPreferences prefs = await _prefs;
      final int selectedFloorType = prefs.getInt('selectedFloorType') ?? 0;
      final int selectedFloor = prefs.getInt('selectedFloor') ?? 1;

      setState(() {
        _selectedFloorType = FloorType.values[selectedFloorType];
        _selectedFloor = selectedFloor;
      });
    } catch (e) {
      Fluttertoast.showToast(
        msg: kGetDataErrorMessage,
      );
      print(e);
    }
  }

  @override
  void initState() {
    getFloorData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '내 차 위치',
          style: kSaveButtonTextStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ButtonCard(
                    color: _selectedFloorType == FloorType.ground
                        ? kButtonActiveColor
                        : kButtonInactiveColor,
                    buttonContent: const IconButtonContent(
                      buttonIcon: Icons.keyboard_double_arrow_up,
                      buttonText: '지상',
                    ),
                    onTap: () {
                      setState(() {
                        _selectedFloorType = FloorType.ground;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ButtonCard(
                    color: _selectedFloorType == FloorType.underground
                        ? kButtonActiveColor
                        : kButtonInactiveColor,
                    buttonContent: const IconButtonContent(
                      buttonIcon: Icons.keyboard_double_arrow_down,
                      buttonText: '지하',
                    ),
                    onTap: () {
                      setState(() {
                        _selectedFloorType = FloorType.underground;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                for (int i = 0; i < 3; i++)
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (int j = 1; j <= 3; j++)
                          Expanded(
                            child: ButtonCard(
                              color: _selectedFloor == (i * 3) + j
                                  ? kButtonActiveColor
                                  : kButtonInactiveColor,
                              buttonContent: Center(
                                child: Text(
                                  '${(i * 3) + j}층',
                                  style: kIconButtonTextStyle,
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  _selectedFloor = (i * 3) + j;
                                });
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          SaveButton(
            onTap: setFloorData,
          ),
        ],
      ),
    );
  }
}
