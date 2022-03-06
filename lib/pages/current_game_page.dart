import 'package:bella_tzp/constants/constants.dart';
import 'package:bella_tzp/models/game.dart';
import 'package:bella_tzp/routes/route_manager.dart';
import 'package:bella_tzp/services/game_service.dart';
import 'package:bella_tzp/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentGamePage extends StatelessWidget {
  const CurrentGamePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int gameIndex =
        context.read<GameService>().currentGame.listOfFastGames.length - 1;
    int roundScoreMi = context.read<GameService>().calculateGameScore(true,
        context.read<GameService>().currentGame.listOfFastGames.length - 1);
    int roundScoreVi = context.read<GameService>().calculateGameScore(false,
        context.read<GameService>().currentGame.listOfFastGames.length - 1);
    int gameType = context
        .read<GameService>()
        .currentGame
        .listOfFastGames[gameIndex]
        .gameType;
    bool finished = roundScoreMi >= gameType || roundScoreVi >= gameType;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Constants.lightBlue,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: BigText(
                    text: context.read<GameService>().currentGame.mi,
                    color: Colors.white),
              ),
            ),
            Expanded(
              child: Center(
                child: BigText(
                    text: context.read<GameService>().currentGame.vi,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Selector<GameService, Game>(
                    selector: (p0, p1) => p1.currentGame,
                    builder: (context, value, child) {
                      gameIndex = value.listOfFastGames.length - 1;
                      return ListView.builder(
                        itemCount:
                            value.listOfFastGames[gameIndex].miScores.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: BigText(
                                  color: Colors.white,
                                  text:
                                      '${value.listOfFastGames[gameIndex].miScores[index]}'),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Selector<GameService, Game>(
                    selector: (p0, p1) => p1.currentGame,
                    builder: (context, value, child) {
                      gameIndex = value.listOfFastGames.length - 1;
                      return ListView.builder(
                        itemCount:
                            value.listOfFastGames[gameIndex].miScores.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: BigText(
                                  color: Colors.white,
                                  text:
                                      '${value.listOfFastGames[gameIndex].viScores[index]}'),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Container(
              decoration: const BoxDecoration(
                color: Constants.lightBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BigText(
                          text: roundScoreMi.toString(),
                          color: Colors.white,
                        ),
                        BigText(
                          text: roundScoreVi.toString(),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            color: Colors.green,
                            onPressed: () {
                              finished
                                  ? null
                                  : Navigator.of(context).popAndPushNamed(
                                      RouteManager.enterRoundScore);
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
