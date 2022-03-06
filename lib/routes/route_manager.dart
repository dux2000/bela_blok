import 'package:bella_tzp/pages/current_game_page.dart';
import 'package:bella_tzp/pages/enter_round_score.dart';
import 'package:bella_tzp/pages/game_overview.dart';
import 'package:bella_tzp/pages/main_page.dart';
import 'package:bella_tzp/pages/start_new_game.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static const String mainPage = '/';
  static const String startNewGame = '/startNewGame';
  static const String currentGame = '/currentGame';
  static const String enterRoundScore = '/enterRoundScore';
  static const String gameOverview = '/gameOverview';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainPage:
        return MaterialPageRoute(
          builder: (context) => const MainPage(),
        );
      case startNewGame:
        return MaterialPageRoute(
          builder: (context) => const StartNewGame(),
        );
      case currentGame:
        return MaterialPageRoute(
          builder: (context) => const CurrentGamePage(),
        );
      case enterRoundScore:
        return MaterialPageRoute(
          builder: (context) => const EnterRoundScore(),
        );
      case gameOverview:
        return MaterialPageRoute(
          builder: (context) => const GameOverviewPage(),
        );
      default:
        throw const FormatException('Route not found!');
    }
  }
}
