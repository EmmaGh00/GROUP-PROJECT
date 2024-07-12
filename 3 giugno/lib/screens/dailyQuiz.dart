import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_test1/models/sus.dart';
import 'package:project_test1/screens/homePage.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;

 final List<Question> questions = [
    Question(questionText: "Is true that drinking increases the risk of heart attack?", isTrue: true),
    Question(questionText: "Is true that cocaine promotes hair growth?", isTrue: false),
    Question(questionText: "Is true that alcohol warms you up?", isTrue: false),
    Question(questionText: "Is true that alcohol improves sexual performance?", isTrue: false),
    Question(questionText: "Is true that by drinking the same amount of alcohol, women get drunk faster than men?", isTrue: true),
    Question(questionText:"Is true that red wine is good for the blood?", isTrue:false),
    // Aggiungi altre domande...
  ];

  void answerQuestion(bool userAnswer) {
    if (questions[currentQuestionIndex].isTrue == userAnswer) {
      Provider.of<SusModel>(context, listen: false).incrementSus();
    }
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily quiz',
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
      body:
      currentQuestionIndex < questions.length
          ? QuizQuestion(
              question: questions[currentQuestionIndex],
              answerQuestion: answerQuestion,
            )
          : QuizResult(sus: Provider.of<SusModel>(context).sus, totalQuestions: questions.length),
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
          ElevatedButton.icon(
                      icon: Icon(
                        Icons.check, 
                        color:Color.fromARGB(255, 19, 135, 36), 
                        size: 50.0,
                      ),
                      label: Text('True',
                        style: TextStyle(
                          color:Color.fromARGB(255, 19, 135, 36),
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      onPressed: () => answerQuestion(true),
                    ),
          
          SizedBox(height: 10),
          ElevatedButton.icon(
                      icon: Icon(
                        Icons.close, 
                        color: Color.fromARGB(255, 214, 18, 18), 
                        size: 50.0,
                      ),
                      label: Text('False',
                        style: TextStyle(
                          color: Color.fromARGB(255, 214, 18, 18),
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      onPressed: () => answerQuestion(false),
                    ),
        ],
      )
    );
  }
}

class QuizResult extends StatelessWidget {
  final int sus;
  final int totalQuestions;

  QuizResult({required this.sus, required this.totalQuestions});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(24),
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text('Finish!',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                        ..shader = ui.Gradient.linear(
                          const Offset(0, 20),
                          const Offset(250, 20),
                          <Color> [
                            Color.fromARGB(255, 0, 8, 255).withOpacity(0.5),
                            Color.fromARGB(255, 3, 191, 248).withOpacity(0.5),
                          ]
                        )
                      ),
                    )
                  ),

                  
                  Text('Your score is $sus/$totalQuestions',
                    style: TextStyle(fontSize: 20),
                  ),
                ]
            ), 
          ),
          Opacity(
            opacity: 0.1,
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.quiz_outlined,
                  color: Colors.blue,
                  size: 300,
                ),
            ),
          ), 
          //codice commentato sotto 
        ],
      ),
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

/*SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Riavvia il quiz
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => QuizPage()),
              );
            },
            child: Text('Restart'),
          ),*/
