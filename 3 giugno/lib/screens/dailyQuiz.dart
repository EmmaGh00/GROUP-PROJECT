import 'package:flutter/material.dart';
import 'package:project_test1/models/score.dart';
import 'package:project_test1/screens/homePage.dart';
import 'package:provider/provider.dart';

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
  int sus = 0;

 final List<Question> questions = [
    Question(questionText: "Drinking increases the risk of heart attack", isTrue: true),
    Question(questionText: "Cocaine promotes hair growth", isTrue: false),
    Question(questionText: "Alcohol warms you up", isTrue: false),
    Question(questionText: "Alcohol improves sexual performance", isTrue: false),
    Question(questionText: "By drinking the same amount of alcohol, women get drunk faster than men", isTrue: true),
    Question(questionText:"Red wine is good for the blood", isTrue:false),
    // Aggiungi altre domande...
  ];

  void answerQuestion(bool userAnswer) {
    if (questions[currentQuestionIndex].isTrue == userAnswer) {
      sus++;
      Provider.of<ScoreModel>(context, listen: false).incrementScore();
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
      body: currentQuestionIndex < questions.length
          ? QuizQuestion(
              question: questions[currentQuestionIndex],
              answerQuestion: answerQuestion,
            )
          : QuizResult(sus: sus, totalQuestions: questions.length),
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
            onPressed: () => answerQuestion(true),
            child: Text('True'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => answerQuestion(false),
            child: Text('False'),
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'End!',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            'Your score is $sus/$totalQuestions',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Riavvia il quiz
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => QuizPage()),
              );
            },
            child: Text('Restart'),
          ),
            Opacity(
              opacity: 0.1,
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.quiz_outlined,
                    color: Colors.blue,
                    size: 150,
                  ),
                ),
            ),
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