import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_is_my_car/providers/floor/floor_provider.dart';
import 'package:where_is_my_car/widgets/floor_buttons.dart';
import 'package:where_is_my_car/widgets/floor_type_buttons.dart';
import 'package:where_is_my_car/widgets/save_button.dart';

class FloorPage extends StatefulWidget {
  const FloorPage({super.key});

  @override
  State<FloorPage> createState() => _FloorPageState();
}

class _FloorPageState extends State<FloorPage> {
  @override
  void initState() {
    context.read<FloorProvider>().initSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     '내 차 위치',
      //     style: kSaveButtonTextStyle,
      //   ),
      //   centerTitle: true,
      // ),
      body: Column(
        children: [
          FloorTypeButtons(),
          FloorButtons(),
          SizedBox(height: 10.0),
          SaveButton(),
        ],
      ),
    );
  }
}
