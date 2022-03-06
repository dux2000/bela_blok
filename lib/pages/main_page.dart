import 'package:bella_tzp/constants/constants.dart';
import 'package:bella_tzp/pages/body_pages.dart';
import 'package:bella_tzp/routes/route_manager.dart';
import 'package:bella_tzp/services/game_service.dart';
import 'package:bella_tzp/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    context.read<GameService>().getGames(context, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.lightBlue,
        title: const BigText(
          color: Colors.white,
          text: 'Bella Blok',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.of(context).pushNamed(RouteManager.startNewGame);
        },
        child: const Icon(
          Icons.add,
          color: Colors.green,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 20),
        child: BodyPages(),
      ),
    );
  }
}
