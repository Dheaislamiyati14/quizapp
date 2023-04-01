import 'package:flutter/material.dart';

import 'package:flutter_application_1/answer.dart';
import 'package:flutter_application_1/questions.dart';
import 'package:flutter_application_1/quiz.dart';

import 'result.dart';

//void main() {
//  runApp(const MyApp());
//}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState(){
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
final _questions = const[
      {
        'questionText' : 'What\'s your favorite color?',
        'answers' : [
          {'text' : 'Black', 'Score' : 10},
          {'text' : 'Blue', 'Score' : 8},
          {'text' : 'Red', 'Score' : 5},
          {'text' : 'Green', 'Score' : 3},
          {'text' : 'Yellow', 'Score' : 1},
        ],
      },
      {
        'questionText' : 'What\'s your favorite Animal?',
        'answers' : [
          {'text' : 'Cat', 'Score' : 10},
          {'text' : 'Dog', 'Score' : 8},
          {'text' : 'Pig', 'Score' : 3},
          {'text' : 'Gekko', 'Score' : 7},
          ],
      },
      {
        'questionText' : 'Whos your favorite instructor?',
        'answers' : [
          {'Max'},
          {'Max'},
          {'Max'},
          {'Max'},
          ],
      },
    ];
    var _questionIndex= 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState((){
      _questionIndex = 0;
      _totalScore = 0;
    });
  }
 void _answerQuestion(int score){

  _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if(_questionIndex < _questions.length){
      print('Kami punya pertanyaan lagi!');

    }else{
      print('Sudah tidak ada pertanyaan!');
    }
    
  }

    @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        
        appBar: AppBar(
        title: Text('Quiz'),
      
      ),
      body: _questionIndex < _questions.length

       ?Quiz(
        answerQuestion: _answerQuestion,
        questionIndex: _questionIndex,
        question: _questions,
      )
        : Result(_totalScore, _resetQuiz),
        ),
      );
  }
}