import 'package:bella_tzp/constants/constants.dart';
import 'package:bella_tzp/models/fast_game.dart';
import 'package:bella_tzp/routes/route_manager.dart';
import 'package:bella_tzp/services/game_service.dart';
import 'package:bella_tzp/widgets/big_text.dart';
import 'package:bella_tzp/widgets/mainpage_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameOverviewPage extends StatelessWidget {
  const GameOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int miRez = 0;
    int viRez = 0;

    int gameIndex =
        context.read<GameService>().currentGame.listOfFastGames.length - 1;
    return Scaffold(
      floatingActionButton: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.green.shade300,
          padding: const EdgeInsets.all(20),
        ),
        onPressed: () {
          if (miRez <=
                  context
                      .read<GameService>()
                      .currentGame
                      .listOfFastGames[gameIndex]
                      .gameType &&
              viRez <=
                  context
                      .read<GameService>()
                      .currentGame
                      .listOfFastGames[gameIndex]
                      .gameType) {
            null;
          } else {
            FastGame fastGame = FastGame(
                gameType: context
                    .read<GameService>()
                    .currentGame
                    .listOfFastGames[gameIndex]
                    .gameType);
            context.read<GameService>().addNewFastGame(context, fastGame,
                context.read<GameService>().currentGame.time);

            Navigator.of(context).popAndPushNamed(RouteManager.currentGame);
          }
        },
        child: const BigText(
          text: 'Pokreni novu partiju',
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Constants.lightBlue,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BigText(
                text: context.read<GameService>().currentGame.mi,
                color: Colors.white),
            BigText(
                text: context.read<GameService>().currentGame.vi,
                color: Colors.white),
          ],
        ),
      ),
      body: Consumer<GameService>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.currentGame.listOfFastGames.length,
            itemBuilder: (context, index) {
              miRez = value.calculateGameScore(true, index);
              viRez = value.calculateGameScore(false, index);

              return MainPageCard(
                time: context.read<GameService>().currentGame.time,
                index: index,
                scoreMi: miRez,
                scoreVi: viRez,
                mi: context.read<GameService>().currentGame.mi,
                vi: context.read<GameService>().currentGame.vi,
                enabled: miRez >=
                        value.currentGame.listOfFastGames[index].gameType ||
                    viRez >= value.currentGame.listOfFastGames[index].gameType,
              );
            },
          );
        },
      ),
    );
  }
}
