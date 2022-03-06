import 'package:bella_tzp/models/game.dart';
import 'package:hive/hive.dart';

class HiveDatabase {
  static List<Game> getGames(bool fastGames) {
    List<Game> tempList;
    Box<Game> box = Hive.box('games');

    if (fastGames) {
      tempList = box.values.where((element) => element.fastGame).toList();
    } else {
      tempList = box.values.toList();
    }
    return tempList;
  }

  static Game? getGame(String time) {
    Box<Game> box = Hive.box('games');
    Game? game = box.get(time);
    return game;
  }

  static String saveGame(Game game) {
    String result = 'OK';
    Box<Game> box = Hive.box('games');
    box.put(game.time, game).catchError((e) {
      result = e.toString();
    });

    return result;
  }

  static String updateGame(String time, Game game) {
    String result = 'OK';
    Box<Game> box = Hive.box('games');
    box.put(time, game).catchError((e) {
      result = e.toString();
    });
    return result;
  }

  static String deleteGame(String time) {
    String result = 'OK';
    Box<Game> box = Hive.box('games');
    box.delete(time).onError((error, stackTrace) {
      result = error.toString();
    });
    return result;
  }
}
