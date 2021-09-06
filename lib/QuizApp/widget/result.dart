import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = '';
    if (resultScore <= 8) {
      resultText = 'Wow ! Amazing Good Job Man !';
    } else if (resultScore <= 12) {
      resultText = 'Hải Ngu ok man?';
    } else if (resultScore <= 20) {
      resultText = '超　crazy?';
    } else {
      resultText = 'Bad .......';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(resultPhrase,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          TextButton(
            child: Text('Restart quiz'),
            onPressed: resetHandler,
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.amber),
            ),
          )
        ],
      ),
    );
  }
}
