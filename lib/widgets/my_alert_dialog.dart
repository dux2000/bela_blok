import 'package:bella_tzp/pages/main_page.dart';
import 'package:bella_tzp/routes/route_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  final String text;
  final bool fastGame;
  const MyAlertDialog({
    required this.text,
    required this.fastGame,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('Pobijedio je $text'),
      actions: [
        TextButton(
          onPressed: () {
            fastGame
                ? Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => const MainPage()),
                    ModalRoute.withName('/'))
                : Navigator.popAndPushNamed(context, RouteManager.gameOverview);
          },
          child: fastGame
              ? const Text('Idi na glavni page')
              : const Text('Idi na game overview'),
        )
      ],
    );
  }
}
