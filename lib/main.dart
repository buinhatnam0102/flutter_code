import 'package:flutter/material.dart';
import 'question.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //_MyAppState: dấu _ biến lớp MyAppState thành private chỉ được sử dụng
  //trong main.dảt
  var questionIndex=0;

  void _answerQuestion(){
    setState(() {
      questionIndex=questionIndex+1;
    });

  }

  @override
  Widget build(BuildContext context) {
    var question = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?'
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body:Column(
          children: [
            Question(
                question[questionIndex]
            ),
            ElevatedButton(onPressed: _answerQuestion, child: Text('Answer 1')),
            // onPressed : answerQuestion , not answerQuestion().
            //answerQuestion : thực thi answerQuestion khi nhấn nút.
            // answerQuestion() trả về kết quả của Function.
            ElevatedButton(onPressed: _answerQuestion, child: Text('Answer 2')),
            ElevatedButton(onPressed: ()=> print('Answer 3'), child: Text('Answer 3')),
          ],
        ),
      ),
    );
  }
}
