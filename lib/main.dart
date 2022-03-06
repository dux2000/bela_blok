import 'package:bella_tzp/constants/constants.dart';
import 'package:bella_tzp/pages/main_page.dart';
import 'package:bella_tzp/routes/route_manager.dart';
import 'package:bella_tzp/services/game_service.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'models/fast_game.dart';
import 'models/game.dart';

void main() async {
  await Hive.initFlutter();
  Hive
    ..registerAdapter(GameAdapter())
    ..registerAdapter(FastGameAdapter());
  Box<Game> box = await Hive.openBox('games');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GameService(),
        ),
      ],
      child: MaterialApp(
        initialRoute: RouteManager.mainPage,
        onGenerateRoute: RouteManager.generateRoute,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Constants.darkBlue,
        ),
        home: const MainPage(),
      ),
    );
  }
}
