import 'package:flutter/material.dart';
import 'package:where_is_my_car/constants.dart';
import 'package:where_is_my_car/providers/floor/floor_state.dart';
import 'package:where_is_my_car/providers/providers.dart';
import 'package:where_is_my_car/widgets/button_card.dart';
import 'package:where_is_my_car/widgets/icon_button_content.dart';
import 'package:provider/provider.dart';

class FloorTypeButtons extends StatelessWidget {
  const FloorTypeButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: ButtonCard(
              color: context.watch<FloorProvider>().state.floorType ==
                      FloorType.ground
                  ? kButtonActiveColor
                  : kButtonInactiveColor,
              buttonContent: const IconButtonContent(
                buttonIcon: Icons.keyboard_double_arrow_up,
                buttonText: '지상',
              ),
              onTap: () => context
                  .read<FloorProvider>()
                  .changeFloorType(FloorType.ground),
            ),
          ),
          Expanded(
            child: ButtonCard(
              color: context.watch<FloorProvider>().state.floorType ==
                      FloorType.underground
                  ? kButtonActiveColor
                  : kButtonInactiveColor,
              buttonContent: const IconButtonContent(
                buttonIcon: Icons.keyboard_double_arrow_down,
                buttonText: '지하',
              ),
              onTap: () => context
                  .read<FloorProvider>()
                  .changeFloorType(FloorType.underground),
            ),
          ),
        ],
      ),
    );
  }
}
