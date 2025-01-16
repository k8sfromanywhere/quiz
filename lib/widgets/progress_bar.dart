import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final icons;
  final int count;
  final int total;

  const ProgressBar(
      {super.key, this.icons, required this.count, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              '$count-$total',
            ),
          ),
          const SizedBox(width: 10),
          ...icons,
        ],
      ),
    );
  }
}
