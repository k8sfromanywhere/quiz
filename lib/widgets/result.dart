import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int count;
  final int total;
  final Function onClearState;

  const Result(
      {super.key,
      required this.count,
      required this.total,
      required this.onClearState});

  @override
  Widget build(BuildContext context) {
    String msg = "";
    Widget img;
    if (0 <= count && count <= 2) {
      msg = 'Пора пересмотреть ИП,\n бастард!';
      img = Image.asset('assets/images/bad.png');
    } else if ((3 <= count && count <= 4)) {
      msg = 'Детали упущены,\n северянин...';
      img = Image.asset('assets/images/norm.png');
    } else {
      msg = 'Поздравляю, ты мать драконов!';
      img = Image.asset('assets/images/super.png');
    }

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 15,
            spreadRadius: 0,
            offset: Offset(
              2,
              5,
            ),
          ),
        ],
        borderRadius: BorderRadius.circular(30.0),
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(172, 171, 175, 1),
            Color.fromARGB(255, 105, 102, 102),
            Color.fromARGB(255, 27, 3, 3),
          ],
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 120,
            height: 120,
            child: FittedBox(
              fit: BoxFit.contain,
              child: img,
            ),
          ),
          Text(
            msg,
            textAlign: TextAlign.center,
          ),
          const Divider(
            color: Colors.white,
          ),
          Text(
            'Верно ответил на $count из $total',
            style: const TextStyle(color: Colors.white),
          ),
          const Divider(
            color: Colors.white,
          ),
          TextButton(
            child: const Text(
              'Пройти еще раз',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            onPressed: () => onClearState(),
          ),
        ],
      ),
    );
  }
}
