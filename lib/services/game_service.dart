import 'package:bella_tzp/hive_database/hive_database.dart';
import 'package:bella_tzp/models/fast_game.dart';
import 'package:bella_tzp/models/game.dart';
import 'package:bella_tzp/widgets/show_snackbar.dart';
import 'package:flutter/material.dart';

class GameService extends ChangeNotifier {
  late Game _currentGame;
  Game get currentGame => _currentGame;

  List<Game> _games = [];
  List<Game> get games => _games;

  late DateTime _time;
  DateTime get time => _time;

  void getGames(BuildContext context, bool fastGames) {
    _games = HiveDatabase.getGames(fastGames);
  }

  void getGame(BuildContext context, String time) {
    _currentGame = HiveDatabase.getGame(time)!;
  }

  void saveGame(
      BuildContext context,
      TextEditingController miController,
      TextEditingController viController,
      List<bool> threeButtonsForGameType,
      List<bool> fastGameOrBestOf3,
      int numberUntilGameIsFinished) {
    DateTime time = DateTime.now();
    _time = time;
    List<FastGame> fastGame = [FastGame(gameType: numberUntilGameIsFinished)];
    Game game = Game(
      time: time.toString(),
      mi: miController.text.trim(),
      vi: viController.text.trim(),
      fastGame: fastGameOrBestOf3[0] ? true : false,
      listOfFastGames: fastGame,
    );
    String result = HiveDatabase.saveGame(game);
    if (result != 'OK') {
      showSnackBar(context, result);
    } else {
      getGames(context, false);
    }
    notifyListeners();
  }

  void updateGame(BuildContext context, String time) {
    String result = HiveDatabase.updateGame(time, currentGame);
    if (result == 'OK') {
    } else {
      showSnackBar(context, result);
    }
    notifyListeners();
  }

  void addNewFastGame(BuildContext context, FastGame fastGame, String time) {
    _currentGame.listOfFastGames.add(fastGame);
    updateGame(context, time);
  }

  void deleteGame(BuildContext context, String time) {
    String result = HiveDatabase.deleteGame(time);
    if (result == 'OK') {
      getGames(context, false);
    } else {
      showSnackBar(context, result);
    }
    notifyListeners();
  }

  int calculateGameScore(bool mi, int index) {
    int score = 0;
    if (mi) {
      for (int i = 0;
          i < _currentGame.listOfFastGames[index].miScores.length;
          i++) {
        score += _currentGame.listOfFastGames[index].miScores[i];
      }
    } else {
      for (int i = 0;
          i < _currentGame.listOfFastGames[index].viScores.length;
          i++) {
        score += _currentGame.listOfFastGames[index].viScores[i];
      }
    }
    return score;
  }
}
