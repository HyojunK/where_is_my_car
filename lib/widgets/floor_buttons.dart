import 'package:flutter/material.dart';
import 'package:where_is_my_car/constants.dart';
import 'package:where_is_my_car/providers/floor/floor_provider.dart';
import 'package:where_is_my_car/widgets/button_card.dart';
import 'package:provider/provider.dart';

class FloorButtons extends StatelessWidget {
  const FloorButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                        color: context.watch<FloorProvider>().state.floor ==
                                (i * 3) + j
                            ? kButtonActiveColor
                            : kButtonInactiveColor,
                        buttonContent: Center(
                          child: Text(
                            '${(i * 3) + j}층',
                            style: kIconButtonTextStyle,
                          ),
                        ),
                        onTap: () => context
                            .read<FloorProvider>()
                            .changeFloor((i * 3) + j),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
