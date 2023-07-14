import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_is_my_car/providers/timer/timer_provider.dart';

void resetDialog(BuildContext context) {
  if (Platform.isIOS) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('초기화'),
            content:
                const Text('타이머를 초기화 하시겠습니까?\n내 차 위치를 저장하면\n타이머는 자동 초기화됩니다.'),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  context.read<TimerProvider>().resetTimer();
                  Navigator.pop(context);
                },
                child: const Text(
                  '초기화',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              CupertinoDialogAction(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  '취소',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              )
            ],
          );
        });
  } else {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('초기화'),
            content:
                const Text('타이머를 초기화 하시겠습니까?\n내 차 위치를 저장하면\n타이머는 자동 초기화됩니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  context.read<TimerProvider>().resetTimer();
                  Navigator.pop(context);
                },
                child: const Text(
                  '초기화',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  '취소',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              )
            ],
          );
        });
  }
}
