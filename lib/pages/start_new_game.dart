import 'package:bella_tzp/routes/route_manager.dart';
import 'package:bella_tzp/services/game_service.dart';
import 'package:bella_tzp/widgets/app_textfield.dart';
import 'package:bella_tzp/widgets/big_text.dart';
import 'package:bella_tzp/widgets/pressed_button.dart';
import 'package:bella_tzp/widgets/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartNewGame extends StatefulWidget {
  const StartNewGame({Key? key}) : super(key: key);

  @override
  State<StartNewGame> createState() => _StartNewGameState();
}

class _StartNewGameState extends State<StartNewGame> {
  TextEditingController miController = TextEditingController();
  TextEditingController viController = TextEditingController();

  final List<bool> _fastGameOrBestOf3 = [false, false];
  final List<bool> _threeButtonsForGameType = [false, false, false];

  int numberUntilGameIsFinished = 0;
  @override
  void dispose() {
    miController.dispose();
    viController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 50),
                          child: BigText(text: 'MI'),
                        ),
                        AppTextFiled(
                          controller: miController,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 55),
                          child: BigText(text: 'VI'),
                        ),
                        AppTextFiled(
                          controller: viController,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PressedButton(
                      buttonText: 'Brza igra',
                      listOfBool: _fastGameOrBestOf3,
                      function: () {
                        setState(() {
                          _fastGameOrBestOf3[0] = !_fastGameOrBestOf3[0];
                          _fastGameOrBestOf3[1] = false;
                        });
                      },
                      index: 0,
                      size: 150,
                    ),
                    PressedButton(
                      buttonText: 'Igra',
                      listOfBool: _fastGameOrBestOf3,
                      function: () {
                        setState(() {
                          _fastGameOrBestOf3[0] = false;
                          _fastGameOrBestOf3[1] = !_fastGameOrBestOf3[1];
                        });
                      },
                      index: 1,
                      size: 150,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PressedButton(
                            buttonText: '501',
                            listOfBool: _threeButtonsForGameType,
                            function: () {
                              setState(() {
                                _threeButtonsForGameType[0] =
                                    !_threeButtonsForGameType[0];
                                _threeButtonsForGameType[1] = false;
                                _threeButtonsForGameType[2] = false;
                                numberUntilGameIsFinished = 501;
                              });
                            },
                            index: 0,
                            size: 65,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PressedButton(
                            buttonText: '701',
                            listOfBool: _threeButtonsForGameType,
                            function: () {
                              setState(() {
                                _threeButtonsForGameType[1] =
                                    !_threeButtonsForGameType[1];
                                _threeButtonsForGameType[0] = false;
                                _threeButtonsForGameType[2] = false;
                                numberUntilGameIsFinished = 701;
                              });
                            },
                            index: 1,
                            size: 65,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PressedButton(
                            buttonText: '1001',
                            listOfBool: _threeButtonsForGameType,
                            function: () {
                              setState(() {
                                _threeButtonsForGameType[2] =
                                    !_threeButtonsForGameType[2];
                                _threeButtonsForGameType[1] = false;
                                _threeButtonsForGameType[0] = false;
                                numberUntilGameIsFinished = 1001;
                              });
                            },
                            index: 2,
                            size: 65,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              elevation: 0,
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 30, right: 30),
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                if (miController.text.isEmpty || viController.text.isEmpty) {
                  showSnackBar(
                      context, 'Please enter both fields for team names');
                } else if (!_fastGameOrBestOf3[0] && !_fastGameOrBestOf3[1]) {
                  showSnackBar(context, 'Please select game type');
                } else if (!_threeButtonsForGameType[0] &&
                    !_threeButtonsForGameType[1] &&
                    !_threeButtonsForGameType[2]) {
                  showSnackBar(
                      context, 'Please select score until game is played');
                } else {
                  context.read<GameService>().saveGame(
                      context,
                      miController,
                      viController,
                      _threeButtonsForGameType,
                      _fastGameOrBestOf3,
                      numberUntilGameIsFinished);
                  context.read<GameService>().getGame(
                      context, context.read<GameService>().time.toString());
                  Navigator.of(context)
                      .popAndPushNamed(RouteManager.currentGame);
                }
              },
              child: const BigText(
                color: Colors.white,
                text: 'Pokreni igru',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
