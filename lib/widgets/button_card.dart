import 'package:flutter/material.dart';
import 'package:where_is_my_car/constants.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    super.key,
    this.color = kButtonInactiveColor,
    this.buttonContent,
    required this.onTap,
  });

  final Color color;
  final Widget? buttonContent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: buttonContent,
      ),
    );
  }
}
