import 'package:hive/hive.dart';
part 'fast_game.g.dart';

@HiveType(typeId: 1)
class FastGame {
  @HiveField(0)
  int gameType;
  @HiveField(1)
  List<int> miScores = [];
  @HiveField(2)
  List<int> viScores = [];

  FastGame({required this.gameType});

  @override
  String toString() {
    return 'igra se do $gameType';
  }
}
