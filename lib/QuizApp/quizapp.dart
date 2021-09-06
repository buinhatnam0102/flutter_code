import 'package:flutter/material.dart';
import 'widget/question.dart';
import 'widget/answer.dart';
import 'widget/quiz.dart';
import 'widget/result.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  //_MyAppState: dấu _ biến lớp MyAppState thành private chỉ được sử dụng
  //trong main.dảt
  var _questionIndex = 0;
  var _totalScore=0;
  void _resetQuiz(){
    setState(() {
      _questionIndex=0;
      _totalScore=0;
    });
  }
  final _question = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 5},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Lion', 'score': 1},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Hai ngu 1', 'score': 10},
        {'text': 'Hai ngu 2', 'score': 5},
        {'text': 'Hai ngu 3', 'score': 3},
        {'text': 'Hai ngu 4', 'score': 1},
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore+=score;
    if (_questionIndex < _question.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: _questionIndex < _question.length
            ? Quiz(
          answerQuestion: _answerQuestion,
          questionIndex: _questionIndex,
          question: _question,
        )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
