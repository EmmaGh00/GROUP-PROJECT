import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project_test1/models/score.dart';
import 'package:project_test1/provider/data_provider.dart';
import 'package:project_test1/screens/homePage.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodayPage(),
    );
  }
}

class TodayPage extends StatefulWidget {
  @override
  _TodayPageState createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  int currentQuestionIndex = 0;
  int sus = 0;

 final List<Question> questions = [
    Question(questionText: "Do you drunk or use some substances that are dangerous for your health?", isTrue: false),
  ];

  void answerQuestion(bool userAnswer) {
    
    if (questions[currentQuestionIndex].isTrue == userAnswer) {
      Provider.of<ScoreModel>(context, listen: false).increment10Score();

      // DA TOGLIERE COMMENTO QUANDO SARANNO DEFINITE LE VARIABILI IN SHARED PREFERENCES
      var provider = Provider.of<DataProvider>(context, listen: false);

      if (provider.restData[0] > 80 && provider.sleepData < 240 && HR_mean > 80) {
        Provider.of<ScoreModel>(context, listen: false).incrementScore(); //decrement di 10 punti
      } else {
        Provider.of<ScoreModel>(context, listen: false).incrementScore(); // incremento di 10 punti
      }

    } else {
      Provider.of<ScoreModel>(context, listen: false).decrement5Score(); //decrement di 5 punti per la sincerità
    } 
    Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Today',
          style: TextStyle(
            fontFamily: 'Outfit',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            color: Colors.blue,
            fontSize: 30,
            letterSpacing: 0,
          ),
        ),
        centerTitle: true,
        elevation: 2,
        leading: IconButton(
          onPressed: () 
            => _toHomePage(context), icon: Icon(Icons.arrow_back)
        )
      ),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuizQuestion(
                      question: questions[currentQuestionIndex],
                      answerQuestion: answerQuestion,
                    ), 
                    
                    /*
                    Text('Punteggio: ${Provider.of<ScoreModel>(context).score}'),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<ScoreModel>(context, listen: false).incrementScore();
                      },
                      child: Text('Incrementa'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<ScoreModel>(context, listen: false).resetScore();
                      },
                      child: Text('Resetta Punteggio'),
                    ),
                    */
                  
                    Opacity(
                      opacity: 0.1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.blue,
                          size: 300,
                          ),
                        ),
                    ),

                  ],
              ),
            ), 
          ],
        ),
      ),
    );
  }
}

class Question {
  final String questionText;
  final bool isTrue;

  Question({required this.questionText, required this.isTrue});
}


class QuizQuestion extends StatelessWidget {
  final Question question;
  final Function(bool) answerQuestion;

  QuizQuestion({required this.question, required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question.questionText,
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: ()
            => answerQuestion(true),

            child: Text('Yes'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => answerQuestion(false),
            child: Text('No'),
             ),
        ],
      )
      
     
    );
    
  }
}


// NAVIGATION - toHomePage
  void _toHomePage(BuildContext context){
    //Pop the drawer first 
    //Navigator.pop(context);
    //Then pop the HomePage
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
  }