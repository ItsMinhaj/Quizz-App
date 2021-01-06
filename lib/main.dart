import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questions =  [

    {'questionText':'What\'s your favorite color?',
      'answer': [
        {'text': 'Black', 'score': 7},
        {'text': 'White', 'score': 10},
        {'text': 'Red',   'score': 6},
        {'text': 'Green', 'score': 8}
        ]
    },
    {'questionText':'What\'s your favorite animal?',
      'answer': [
        {'text': 'Cat', 'score': 7},
        {'text': 'Dog', 'score': 10},
        {'text': 'Rabbit',   'score': 6},
        {'text': 'Cow', 'score': 8}
      ]
    },
    {'questionText':'What\'s your favorite Food?',
      'answer': [
        {'text': 'Biriyani', 'score': 10},
        {'text': 'Polaw', 'score': 7},
        {'text': 'Tehari',   'score': 8},
        {'text': 'Kichuri', 'score': 6}
      ]
    },

  ];
  var _questionIndex = 0;
  var _totalScore = 0;


  void _answerQuestion(int score){

    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if(_questionIndex < _questions.length){
      print("We have more questions");
    }
    print(_questionIndex);
  }

  void _resetQuiz(){
    setState(() {
       _questionIndex = 0;
       _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length ?
        Quiz(
          questions: _questions,
          answerQuestion: _answerQuestion,
          questionIndex: _questionIndex,
        ) : Result(_totalScore,_resetQuiz),
      )
    );
  }
}
