import 'package:flutter/material.dart';
import 'package:flutter_course/result.dart';

import './quiz.dart';
import 'result.dart';
//void main() {
//runApp(MyApp());
//}

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyappState();
  }
}

class _MyappState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'green', 'score': 3},
        {'text': 'white', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favourite Animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Horse', 'score': 8},
        {'text': 'Lion', 'score': 4},
        {'text': 'Tiger', 'score': 9},
      ],
    },
    {
      'questionText': 'What\'s your favourite instructor?',
      'answers': [
        {'text': 'abc', 'score': 1},
        {'text': 'qwe', 'score': 2},
        {'text': 'mar', 'score': 3},
        {'text': 'whi', 'score': 4},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
