import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String title;
  final bool? isCorrect;
  final Function? onChangeAnswer;

  const Answer(
      {super.key, required this.title, this.isCorrect, this.onChangeAnswer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChangeAnswer!(isCorrect),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
              offset: Offset(1, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(107, 101, 101, 1),
            Color.fromARGB(255, 62, 14, 20),
            Color.fromARGB(255, 50, 3, 5),
          ]),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
