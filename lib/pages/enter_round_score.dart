import 'package:bella_tzp/constants/constants.dart';
import 'package:bella_tzp/routes/route_manager.dart';
import 'package:bella_tzp/services/game_service.dart';
import 'package:bella_tzp/widgets/big_text.dart';
import 'package:bella_tzp/widgets/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnterRoundScore extends StatefulWidget {
  const EnterRoundScore({Key? key}) : super(key: key);

  @override
  State<EnterRoundScore> createState() => _EnterRoundScoreState();
}

class _EnterRoundScoreState extends State<EnterRoundScore> {
  bool _miSelected = false;
  bool _viSelected = false;
  TextEditingController miScoreController = TextEditingController();
  TextEditingController viScoreController = TextEditingController();
  TextEditingController miZvanjeController = TextEditingController();
  TextEditingController viZvanjeController = TextEditingController();
  int miScore = 0;
  int viScore = 0;
  int miZvanje = 0;
  int viZvanje = 0;

  int totalRoundScore = 162;
  void setScores(String value) {
    setState(() {
      if (miScoreController.text == value) {
        miScore = int.parse(value.isEmpty ? '0' : value);
        viScore = 162 - miScore;
        viScoreController.text = '${totalRoundScore - miScore}';
      } else {
        viScore = int.parse(value.isEmpty ? '0' : value);
        miScore = 162 - viScore;
        miScoreController.text = '${totalRoundScore - viScore}';
      }
    });
  }

  void saveScoreZaMi(int miScore, int viScore, bool prosli) {
    if (prosli) {
      context
          .read<GameService>()
          .currentGame
          .listOfFastGames[
              context.read<GameService>().currentGame.listOfFastGames.length -
                  1]
          .miScores
          .add(miScore);
      context
          .read<GameService>()
          .currentGame
          .listOfFastGames[
              context.read<GameService>().currentGame.listOfFastGames.length -
                  1]
          .viScores
          .add(viScore);
    } else {
      context
          .read<GameService>()
          .currentGame
          .listOfFastGames[
              context.read<GameService>().currentGame.listOfFastGames.length -
                  1]
          .miScores
          .add(0);
      context
          .read<GameService>()
          .currentGame
          .listOfFastGames[
              context.read<GameService>().currentGame.listOfFastGames.length -
                  1]
          .viScores
          .add(miScore + viScore);
    }
    context
        .read<GameService>()
        .updateGame(context, context.read<GameService>().currentGame.time);
  }

  void saveScoreZaVi(int miScore, int viScore, bool prosli) {
    if (prosli) {
      context
          .read<GameService>()
          .currentGame
          .listOfFastGames[
              context.read<GameService>().currentGame.listOfFastGames.length -
                  1]
          .miScores
          .add(miScore);
      context
          .read<GameService>()
          .currentGame
          .listOfFastGames[
              context.read<GameService>().currentGame.listOfFastGames.length -
                  1]
          .viScores
          .add(viScore);
    } else {
      context
          .read<GameService>()
          .currentGame
          .listOfFastGames[
              context.read<GameService>().currentGame.listOfFastGames.length -
                  1]
          .viScores
          .add(0);
      context
          .read<GameService>()
          .currentGame
          .listOfFastGames[
              context.read<GameService>().currentGame.listOfFastGames.length -
                  1]
          .viScores
          .add(miScore + viScore);
    }
    context
        .read<GameService>()
        .updateGame(context, context.read<GameService>().currentGame.time);
  }

  @override
  void dispose() {
    miScoreController.dispose();
    viScoreController.dispose();
    miZvanjeController.dispose();
    viZvanjeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.lightBlue,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                  fixedSize: const Size(100, 50),
                  backgroundColor: _miSelected ? Colors.green : Colors.red),
              onPressed: () {
                setState(() {
                  _miSelected = !_miSelected;
                  _viSelected = false;
                });
              },
              child: const BigText(
                color: Colors.white,
                text: 'MI',
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  fixedSize: const Size(100, 50),
                  backgroundColor: _viSelected ? Colors.green : Colors.red),
              onPressed: () {
                setState(() {
                  _viSelected = !_viSelected;

                  _miSelected = false;
                });
              },
              child: const BigText(
                color: Colors.white,
                text: 'VI',
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Constants.lightBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 100,
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: miScoreController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        setScores(value);
                      },
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Constants.lightBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 100,
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        controller: viScoreController,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          setScores(value);
                        },
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Constants.lightBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 100,
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        controller: miZvanjeController,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          setState(() {
                            miZvanje = int.parse(value.isEmpty ? '0' : value);
                          });
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Constants.lightBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 100,
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        controller: viZvanjeController,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          setState(() {
                            viZvanje = int.parse(value.isEmpty ? '0' : value);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BigText(
                  color: Colors.white,
                  text: 'MI SCORE     ${miScore + miZvanje}',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BigText(
                  color: Colors.white,
                  text: 'VI SCORE      ${viScore + viZvanje}',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50)),
                  child: TextButton(
                    onPressed: () {
                      if (!_miSelected && !_viSelected) {
                        showSnackBar(
                          context,
                          'Please selecet team who je Zvao',
                        );
                      } else if (miScore == 0 && viScore == 0) {
                        showSnackBar(
                          context,
                          'Please enter score for at least one team',
                        );
                      } else {
                        totalRoundScore += miZvanje + viZvanje;
                        miScore += miZvanje;
                        viScore += viZvanje;
                        if (_miSelected) {
                          miScore >= viScore
                              ? saveScoreZaMi(miScore, viScore, true)
                              : saveScoreZaMi(miScore, viScore, false);
                        } else {
                          viScore >= miScore
                              ? saveScoreZaVi(miScore, viScore, true)
                              : saveScoreZaVi(miScore, viScore, false);
                        }
                        Navigator.of(context)
                            .popAndPushNamed(RouteManager.currentGame);
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: BigText(
                        color: Colors.white,
                        text: 'SUBMIT',
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
