import 'package:flutter/material.dart';
import 'package:project_test1/models/score.dart';
import 'package:project_test1/models/today.dart';
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
      //Provider.of<ScoreModel>(context, listen: false).increment10Score();

      // DA TOGLIERE COMMENTO QUANDO SARANNO DEFINITE LE VARIABILI IN SHARED PREFERENCES
      var provider = Provider.of<DataProvider>(context, listen: false);

      if ((provider.restNum > 80) && (provider.sleepNum < 240) && (provider.HR_mean > 80)) {
        Provider.of<ScoreModel>(context, listen: false).decrement10Score(); //decrement di 10 punti perchè ha mentito
      } else {
        Provider.of<ScoreModel>(context, listen: false).increment10Score(); // incremento di 5 punti perchè corretto
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
            fontFamily: 'Times New Roman',
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            fontSize: 30,
            letterSpacing: 0.5,
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
            Expanded(child:
            SizedBox(height: 500),),
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
                ],
              
            ),
            ),
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
                        Icons.wine_bar_outlined, 
                        color: Color.fromARGB(255, 239, 107, 107),
                        size: 50.0,
                      ),
                      label: Text('Yes',
                        style: TextStyle(
                          color: Color.fromARGB(255, 239, 107, 107),
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      onPressed: (){
                        answerQuestion(true);
                        Provider.of<TodayModel>(context, listen: false).clickToday(); 
                      }
                    ),
          
            
          SizedBox(height: 10),
          ElevatedButton.icon(
                      icon: Icon(
                        Icons.no_drinks_outlined, 
                        color:Color.fromARGB(255, 119, 234, 140), 
                        size: 50.0,
                      ),
                      label: Text('No',
                        style: TextStyle(
                          color:Color.fromARGB(255, 119, 234, 140), 
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      onPressed: (){
                        answerQuestion(false);
                        Provider.of<TodayModel>(context, listen: false).clickToday();
                      }
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