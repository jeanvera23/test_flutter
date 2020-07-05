import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var _totalScore = 0;
  var _questions = [
    {
      "questionText": "Color?",
      "answers": [
        {"name": "black", "score": 5},
        {"name": "blue", "score": 4},
        {"name": "yellow", "score": 3},
      ]
    },
    {
      "questionText": "Animal?",
      "answers": [
        {"name": "cat", "score": 5},
        {"name": "dog", "score": 4},
        {"name": "fish", "score": 3},
      ]
    }
  ];

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      _totalScore = 0;
    });
  }

  void responseQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      questionIndex++;
    });
    print(num);
    if (questionIndex < _questions.length) {
      print("we have more _questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo Home Page'),
        ),
        body: (questionIndex < _questions.length)
            ? Quiz(
                questions: _questions,
                answerQuestion: responseQuestion,
                questionIndex: questionIndex)
            : Result(_totalScore, resetQuiz),
      ),
    );
  }
}
