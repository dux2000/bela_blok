import 'package:bella_tzp/constants/constants.dart';
import 'package:bella_tzp/models/game.dart';
import 'package:bella_tzp/routes/route_manager.dart';
import 'package:bella_tzp/services/game_service.dart';
import 'package:bella_tzp/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildPages(BuildContext context, Game game) {
  return InkWell(
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: () {
      context.read<GameService>().getGame(context, game.time);

      if (game.fastGame) {
        Navigator.pushNamed(context, RouteManager.currentGame);
      } else {
        Navigator.pushNamed(context, RouteManager.gameOverview);
      }
    },
    child: Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Constants.lightBlue,
      ),
      child: Column(
        children: [
          game.fastGame
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BigText(
                      text: 'Brza igra',
                      color: Colors.green.shade300,
                      fontSize: 22,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                )
              : Row(
                  children: [
                    BigText(
                      text: 'Igra',
                      color: Colors.red.shade300,
                      fontSize: 22,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        BigText(
                          text: game.mi,
                          fontSize: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        BigText(
                          text: game.vi,
                          fontSize: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<GameService>().deleteGame(context, game.time);
                },
                icon: const Icon(Icons.delete),
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
