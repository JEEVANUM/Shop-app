import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

//widgets are objects and materialapp is class where we can pass objects and buildcontext class contains meta data like pixel and positon of widgets in the tree.home is property or arguement.
void main() {
  //or void main() =>runApp(MyApp())
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what is your fav color?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'red', 'score': 6},
        {'text': 'green', 'score': 3},
      ],
    },
    {
      'questionText': 'what is ur fav animal ?',
      'answers': [
        {'text': 'dog', 'score': 3},
        {'text': 'cat', 'score': 5},
        {'text': 'lion', 'score': 7}
      ],
    },
    {
      'questionText': 'who\'s ur fav instructor ?',
      'answers': [
        {'text': 'sam', 'score': 1},
        {'text': 'ram', 'score': 3},
        {'text': 'jeev', 'score': 9}
      ],
    },
  ];
  var _Index = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _Index = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _Index = _Index + 1;
    });

    print(_Index);
  }

  @override //decorating
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('my first app'),
        ),
        body: _Index < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                Index: _Index,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
