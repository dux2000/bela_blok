import 'package:flutter/material.dart';

class AppTextFiled extends StatelessWidget {
  final TextEditingController controller;
  const AppTextFiled({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: TextField(
          controller: controller,
          cursorColor: Colors.black,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
