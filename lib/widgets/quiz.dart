import 'package:flutter/material.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final index;
  final questionData;
  final onChangeAnswer;

  const Quiz({super.key, this.index, this.questionData, this.onChangeAnswer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 150,
          padding: const EdgeInsets.all(15),
          child: Text(
            questionData.questions[index].title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Color.fromARGB(255, 148, 13, 3),
                  offset: Offset(0.6, 1),
                  blurRadius: 2,
                ),
              ],
            ),
          ),
        ),
        ...questionData.questions[index].answers
            .map((value) => Answer(
                  title: value['answer'],
                  onChangeAnswer: onChangeAnswer,
                  isCorrect: value.containsKey("isCorrect") ? true : false,
                ))
            .toList(),
      ],
    );
  }
}
