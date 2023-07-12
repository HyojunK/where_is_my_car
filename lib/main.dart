import 'package:flutter/material.dart';
import 'package:where_is_my_car/pages/main_page.dart';
import 'package:where_is_my_car/providers/providers.dart';
import 'constants.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FloorProvider>(
          create: (context) => FloorProvider(),
        ),
        ChangeNotifierProvider<BottomNavigationProvider>(
          create: (context) => BottomNavigationProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: baseColor,
          appBarTheme: const AppBarTheme(
            color: baseColor,
            elevation: 0,
          ),
          textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Pretendard'),
        ),
        home: const MainPage(),
      ),
    );
  }
}
