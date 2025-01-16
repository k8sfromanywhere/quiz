import "package:flutter/material.dart";
import "package:quizgameofthrones/models/questions.dart";
import "package:quizgameofthrones/widgets/progress_bar.dart";
import "package:quizgameofthrones/widgets/result.dart";
import "../widgets/quiz.dart";
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final QuestionData data = QuestionData();
  int _countResult = 0;
  int _questionIndex = 0;
  List<Icon> _icons = [];
  Timer? _timer;
  int _remainingTime = 30;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _remainingTime = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _onChangeAnswer(false);
        }
      });
    });
  }

  void _clearState() {
    setState(() {
      _questionIndex = 0;
      _countResult = 0;
      _icons = [];
    });
    _startTimer();
  }

  void _onChangeAnswer(bool isCorrect) {
    setState(() {
      if (isCorrect) {
        _icons.add(const Icon(Icons.brightness_1,
            color: Color.fromARGB(255, 8, 64, 26)));
        _countResult++;
      } else {
        _icons.add(const Icon(Icons.brightness_1,
            color: Color.fromARGB(255, 77, 74, 74)));
      }

      _questionIndex += 1;
      _remainingTime = 30;
    });

    _timer?.cancel();
    if (_questionIndex < data.questions.length) {
      _startTimer();
    }
  }

  final whiteTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 24,
  );

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTextStyle.merge(
          style: whiteTextStyle,
          child: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 92, 97, 109),
              image: DecorationImage(
                //colorFilter: ColorFilter.linearToSrgbGamma(),
                opacity: 0.9,
                image: AssetImage('assets/images/game-of-thrones.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                ProgressBar(
                  icons: _icons,
                  count: _questionIndex,
                  total: data.questions.length,
                ),
                SizedBox(
                  height: 20,
                  width: 70,
                  child: LinearProgressIndicator(
                    minHeight: 15,
                    borderRadius: BorderRadius.circular(10),
                    value: _remainingTime / 30,
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 69, 13, 9)),
                  ),
                ),
                const SizedBox(height: 30),
                _questionIndex < data.questions.length
                    ? Quiz(
                        index: _questionIndex,
                        questionData: data,
                        onChangeAnswer: _onChangeAnswer,
                      )
                    : Result(
                        count: _countResult,
                        total: data.questions.length,
                        onClearState: _clearState,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
