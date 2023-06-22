import 'package:flutter/material.dart';
import 'package:where_is_my_car/screens/input_screen.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: baseColor,
        appBarTheme: AppBarTheme(
          color: baseColor,
          elevation: 0,
        ),
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Pretendard'),
      ),
      home: const InputScreen(),
    );
  }
}
