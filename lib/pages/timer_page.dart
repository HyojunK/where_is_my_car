import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_is_my_car/constants.dart';
import 'package:where_is_my_car/providers/timer/timer_provider.dart';
import 'package:where_is_my_car/utils/reset_dialog.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '타이머',
          style: kSaveButtonTextStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Row(
                textBaseline: TextBaseline.alphabetic,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Text(
                    context
                        .watch<TimerProvider>()
                        .state
                        .days
                        .toString()
                        .padLeft(2, '0'),
                    style: kTimerNumberTextStyle,
                  ),
                  const SizedBox(width: 10.0),
                  const Text(
                    '일',
                    style: kTimerTextStyle,
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    context
                        .watch<TimerProvider>()
                        .state
                        .hours
                        .toString()
                        .padLeft(2, '0'),
                    style: kTimerNumberTextStyle,
                  ),
                  const SizedBox(width: 10.0),
                  const Text(
                    '시간',
                    style: kTimerTextStyle,
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    context
                        .watch<TimerProvider>()
                        .state
                        .minutes
                        .toString()
                        .padLeft(2, '0'),
                    style: kTimerNumberTextStyle,
                  ),
                  const SizedBox(width: 10.0),
                  const Text(
                    '분',
                    style: kTimerTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 2.0,
                side: const BorderSide(width: 5.0, color: kButtonActiveColor),
                foregroundColor: kButtonActiveColor,
                backgroundColor: kBaseColor,
                shape: const CircleBorder(),
                minimumSize: const Size(90.0, 90.0),
              ),
              onPressed: () => resetDialog(context),
              child: Image.asset(
                'assets/icons/refresh_icon@2x.png',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
