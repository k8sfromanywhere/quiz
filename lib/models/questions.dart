class Question {
  final String title;
  final List<Map> answers;

  Question({
    required this.title,
    required this.answers,
  });
}

class QuestionData {
  final data = [
    Question(
        title: 'Какой персонаж из Игры престолов был сыном Рикарда Карстарка?',
        answers: [
          {
            'answer': 'Брандон Старк',
          },
          {'answer': 'Джон Сноу', 'isCorrect': 1},
          {
            'answer': 'Джоффри Баратеон',
          },
          {
            'answer': 'Тирион Ланнистер',
          },
        ]),
    Question(
        title:
            'Какой город был столицей Империи Валирии, прежде чем стать столицей Семи Королевств?',
        answers: [
          {
            'answer': 'Браавос',
          },
          {
            'answer': 'Пентос',
          },
          {
            'answer': 'Королевская Гавань',
          },
          {'answer': 'Валирия', 'isCorrect': 1},
        ]),
    Question(
        title:
            'Как назывался замок, где происходила битва между Станнисом Баратеоном и Ланнистерами?',
        answers: [
          {
            'answer': 'Замок Роковой Воды',
          },
          {
            'answer': 'Замок Безумца',
          },
          {'answer': 'Замок Серый Камень', 'isCorrect': 1},
          {
            'answer': 'Замок Белой Воды',
          },
        ]),
    Question(title: 'Кто убил первого Таргариена на железном троне?', answers: [
      {
        'answer': 'Ланнистеры',
      },
      {
        'answer': 'Тиреллы',
      },
      {
        'answer': 'Грейджои',
      },
      {'answer': 'Баратеоны', 'isCorrect': 1},
    ]),
    Question(
        title:
            'Что говорил Брандон Старк перед тем, как упасть с высоты и остаться инвалидом?',
        answers: [
          {
            'answer': 'Не хочу это делать',
          },
          {
            'answer': 'Это моя судьба',
          },
          {'answer': 'Расскажите мне о моей матери и отце', 'isCorrect': 1},
          {
            'answer': 'Люблю Церсею',
          },
        ]),
  ];

  List<Question> get questions => [...data];
}
