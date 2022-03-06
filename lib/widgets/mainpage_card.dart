import 'package:bella_tzp/routes/route_manager.dart';
import 'package:bella_tzp/widgets/big_text.dart';
import 'package:flutter/material.dart';

class MainPageCard extends StatelessWidget {
  final int scoreMi;
  final int scoreVi;
  final String mi;
  final String vi;
  final bool enabled;
  final int index;
  final String time;

  const MainPageCard(
      {Key? key,
      required this.scoreMi,
      required this.scoreVi,
      required this.mi,
      required this.vi,
      required this.enabled,
      required this.index,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 1, 8, 0),
      child: ListTile(
        enabled: !enabled,
        leading: BigText(
          text: '${index + 1}',
          color: Colors.white,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BigText(
              text: '$scoreMi',
              color: Colors.white,
            ),
            BigText(
              text: '$scoreVi',
              color: Colors.white,
            ),
          ],
        ),
        trailing: enabled
            ? const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                ),
              )
            : const Padding(
                padding: EdgeInsets.only(right: 33),
                child: Text(''),
              ),
        tileColor: enabled ? Colors.green.shade300 : Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        onTap: () {
          Navigator.pushNamed(context, RouteManager.currentGame);
        },
      ),
    );
  }
}
