import 'package:bella_tzp/models/game.dart';
import 'package:bella_tzp/services/game_service.dart';
import 'package:bella_tzp/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:bella_tzp/widgets/game_card.dart';
import 'package:provider/provider.dart';

class BodyPages extends StatelessWidget {
  const BodyPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<GameService, List<Game>>(
      selector: (context, value) => value.games,
      builder: (context, value, child) {
        return value.isEmpty
            ? const Center(
                child: BigText(
                  text: 'PRAZNO',
                ),
              )
            : ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return buildPages(context, value[index]);
                },
              );
      },
    );
  }
}
