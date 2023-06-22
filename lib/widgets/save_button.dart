import 'package:flutter/material.dart';
import 'package:where_is_my_car/constants.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kSaveButtonColor,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: kSaveButtonHeight,
          child: const Row(
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
