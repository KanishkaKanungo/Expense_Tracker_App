import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.fill});

  final fill;

  @override
  Widget build(BuildContext context) {
    final darkMode = MediaQuery.of(context).platformBrightness==Brightness.dark;
    return Expanded(
      child: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)
              ),
              color: darkMode
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary.withOpacity(0.5)
            ),
          ),
        ),
      )
    );
  }
}