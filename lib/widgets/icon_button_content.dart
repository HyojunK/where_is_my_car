import 'package:flutter/material.dart';
import 'package:where_is_my_car/constants.dart';

class IconButtonContent extends StatelessWidget {
  const IconButtonContent({
    super.key,
    required this.buttonIcon,
    required this.buttonText,
  });

  final IconData buttonIcon;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            buttonIcon,
            size: 80.0,
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            buttonText,
            style: kIconButtonTextStyle,
          ),
        ],
      ),
    );
  }
}
