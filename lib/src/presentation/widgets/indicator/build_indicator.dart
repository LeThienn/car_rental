import 'package:flutter/material.dart';

class BuildIndicator extends StatelessWidget {
  BuildIndicator({Key? key, required this.isActive}) : super(key: key);

  bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.black : Colors.grey[400],
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}
