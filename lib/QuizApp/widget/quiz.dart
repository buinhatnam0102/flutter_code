import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
      @required this.question,
      @required this.answerQuestion,
      @required this.questionIndex
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          question[questionIndex]['questionText'],
        ),
        ...(question[questionIndex]['answers'] as List<Map<
                String, Object>>) // add list [answer] into list[widget] of Column[children]
            .map((answer) {
          // Lấy list phần tử trong list ra dưới dạng riêng lẻ
          return Answer(()=>answerQuestion(answer['score']), answer['text']);
        }).toList()

        //ElevatedButton(onPressed: _answerQuestion, child: Text('Answer 1')),
        // onPressed : answerQuestion , not answerQuestion().
        //answerQuestion : thực thi answerQuestion khi nhấn nút.
        // answerQuestion() trả về kết quả của Function.
        //ElevatedButton(onPressed: _answerQuestion, child: Text('Answer 2')),
        //ElevatedButton(onPressed: ()=> print('Answer 3'), child: Text('Answer 3')),
      ],
    );
  }
}
