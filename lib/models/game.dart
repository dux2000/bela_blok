// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:bella_tzp/models/fast_game.dart';
import 'package:hive/hive.dart';
part 'game.g.dart';

@HiveType(typeId: 0)
class Game {
  @HiveField(0)
  String time;
  @HiveField(1)
  String mi;
  @HiveField(2)
  String vi;
  @HiveField(3)
  bool fastGame;
  @HiveField(4)
  List<FastGame> listOfFastGames;
  Game(
      {required this.time,
      required this.mi,
      required this.vi,
      required this.fastGame,
      required this.listOfFastGames});

  @override
  String toString() {
    return 'id velike igre je:${time}\n prvi tema se zove ${mi}\n drugi team se zove ${vi}\n';
  }
}
