import 'package:bella_tzp/constants/constants.dart';
import 'package:bella_tzp/widgets/big_text.dart';
import 'package:flutter/material.dart';

class PressedButton extends StatelessWidget {
  final String buttonText;
  final List<bool> listOfBool;
  final Function function;
  final int index;
  final double size;
  const PressedButton(
      {Key? key,
      required this.buttonText,
      required this.listOfBool,
      required this.function,
      required this.index,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: AnimatedContainer(
        child: Center(
            child: BigText(
          text: buttonText,
          color: listOfBool[index] ? Colors.white : Constants.gold,
        )),
        duration: const Duration(microseconds: 200),
        width: size,
        height: 50,
        decoration: BoxDecoration(
          color: listOfBool[index] ? Constants.pinkyRed : Constants.lightBlue,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
