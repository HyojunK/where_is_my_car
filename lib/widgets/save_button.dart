import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_is_my_car/constants.dart';
import 'package:where_is_my_car/providers/floor/floor_provider.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      color: kSaveButtonColor,
      child: InkWell(
        onTap: () => context.read<FloorProvider>().setFloorData(),
        child: const SizedBox(
          height: kSaveButtonHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_rounded),
              SizedBox(
                width: 5.0,
              ),
              Text(
                '저장하기',
                style: kSaveButtonTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
