import 'package:flutter/material.dart';
import 'package:where_is_my_car/constants.dart';
import 'package:where_is_my_car/widgets/button_card.dart';
import 'package:where_is_my_car/widgets/save_button.dart';
import 'package:where_is_my_car/widgets/icon_button_content.dart';

enum FloorType { ground, underground }

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  FloorType selectedFloorType = FloorType.ground;
  int selectedFloor = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
                    color: selectedFloorType == FloorType.ground
                        ? kButtonActiveColor
                        : kButtonInactiveColor,
                    buttonContent: IconButtonContent(
                      buttonIcon: Icons.keyboard_double_arrow_up,
                      buttonText: '지상',
                    ),
                    onTap: () {
                      setState(() {
                        selectedFloorType = FloorType.ground;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ButtonCard(
                    color: selectedFloorType == FloorType.underground
                        ? kButtonActiveColor
                        : kButtonInactiveColor,
                    buttonContent: IconButtonContent(
                      buttonIcon: Icons.keyboard_double_arrow_down,
                      buttonText: '지하',
                    ),
                    onTap: () {
                      setState(() {
                        selectedFloorType = FloorType.underground;
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
                              color: selectedFloor == (i * 3) + j
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
                                  selectedFloor = (i * 3) + j;
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
          SizedBox(
            height: 10.0,
          ),
          SaveButton(
            onTap: () {
              print('save button clicked');
            },
          ),
        ],
      ),
    );
  }
}
